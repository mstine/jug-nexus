import org.springframework.security.providers.UsernamePasswordAuthenticationToken as AuthToken
import org.springframework.security.context.SecurityContextHolder as SCH

import Role
import User

/**
 * Registration controller.
 */
class RegisterController {

  def authenticateService
  def daoAuthenticationProvider
  def emailerService
  def emailConfirmationService

  static Map allowedMethods = [save: 'POST', update: 'POST']

  /**
   * User Registration Top page.
   */
  def index = {

    // skip if already logged in
    if (authenticateService.isLoggedIn()) {
      redirect action: show
      return
    }

    if (session.id) {
      def person = new User()
//			person.properties = params
      bindData(person, params)
      return [person: person]
    }

    redirect uri: '/'
  }

  /**
   * User Information page for current user.
   */
  def show = {

    // get user id from session's domain class.
    def user = authenticateService.userDomain()
    if (user) {
      render view: 'show', model: [person: User.get(user.id)]
    }
    else {
      redirect action: index
    }
  }

  /**
   * Edit page for current user.
   */
  def edit = {

    def person
    def user = authenticateService.userDomain()
    if (user) {
      person = User.get(user.id)
    }

    if (!person) {
      flash.message = "[Illegal Access] User not found with id ${params.id}"
      redirect action: index
      return
    }

    [person: person]
  }

  /**
   * update action for current user's edit page
   */
  def update = {

    def person
    def user = authenticateService.userDomain()
    if (user) {
      person = User.get(user.id)
    }
    else {
      redirect action: index
      return
    }

    if (!person) {
      flash.message = "[Illegal Access] User not found with id ${params.id}"
      redirect action: index, id: params.id
      return
    }

    // if user want to change password. leave passwd field blank, passwd will not change.
    if (params.passwd && params.passwd.length() > 0
            && params.repasswd && params.repasswd.length() > 0) {
      if (params.passwd == params.repasswd) {
        person.passwd = authenticateService.encodePassword(params.passwd)
      }
      else {
        person.passwd = ''
        flash.message = 'The passwords you entered do not match.'
        render view: 'edit', model: [person: person]
        return
      }
    }

    person.firstName = params.firstName
    person.lastName = params.lastName
    person.location = params.location
    person.company = params.company
    person.email = params.email
    person.showEmail = (params.showEmail != null)
    person.bio = params.bio
    person.website = params.website
    person.blogFeed = params.blogFeed
    person.twitterNickname = params.twitterNickname

    if (person.save()) {
      redirect action: show, id: person.id
    }
    else {
      render view: 'edit', model: [person: person]
    }
  }

  /**
   * Person save action.
   */
  def save = {

    // skip if already logged in
    if (authenticateService.isLoggedIn()) {
      redirect action: show
      return
    }

    def person = new User()
//		person.properties = params
    bindData(person, params)

    def config = authenticateService.securityConfig
    def defaultRole = config.security.defaultRole

    def role = Role.findByAuthority(defaultRole)
    if (!role) {
      person.passwd = ''
      flash.message = 'Default Role not found.'
      render view: 'index', model: [person: person]
      return
    }

    if (params.captcha.toUpperCase() != session.captcha) {
      person.passwd = ''
      flash.message = 'Access code did not match.'
      render view: 'index', model: [person: person]
      return
    }

    if (params.passwd != params.repasswd) {
      person.passwd = ''
      flash.message = 'The passwords you entered do not match.'
      render view: 'index', model: [person: person]
      return
    }

    def pass = authenticateService.encodePassword(params.passwd)
    person.passwd = pass
    person.moderated = true
    if (person.save()) {
      role.addToPeople(person)
      if (config.security.useMail) {
        String emailContent = """You have signed up for an account at:

 ${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}

 Here are the details of your account:
 -------------------------------------
 LoginName: ${person.username}
 Email: ${person.email}
 Full Name: ${person.userRealName}
 Password: ${params.passwd}
"""

        def email = [
                to: [person.email], // 'to' expects a List, NOT a single email address
                subject: "[${request.contextPath}] Account Signed Up",
                text: emailContent // 'text' is the email body
        ]
        emailerService.sendEmails([email])
      }

      person.save(flush: true)

      def auth = new AuthToken(person.username, params.passwd)
      def authtoken = daoAuthenticationProvider.authenticate(auth)
      SCH.context.authentication = authtoken
      redirect uri: '/'
    }
    else {
      person.passwd = ''
      render view: 'index', model: [person: person]
    }
  }

  def requestPasswordEmail = { }

  def sendPasswordEmail = {
    def user = User.findByUsername(params.username)
    if (user) {
    def uuid = UUID.randomUUID()
    user.lastPasswordResetToken = uuid
    user.save()

    emailConfirmationService.sendConfirmation(user.email, "Password Reset Notification", [:], uuid.toString())
    flash.message = 'Password reset mail has been sent to your email address on record.'
    redirect uri: "/"
    } else {
      flash.message = "Could not find a user with username: ${params.username}"
      redirect action: requestPasswordEmail
    }
  }

  def resetPassword = {
    def user = User.findByLastPasswordResetToken(params.uid)
    if (!user) {
      flash.message = 'You have issued an invalid password reset request!'
      redirect uri: "/"
    }
    [uid: params.uid]
  }

  def saveNewPassword = {
    def user = User.findByLastPasswordResetToken(params.uid)
    if (!user) {
      flash.message = 'You have issued an invalid password reset request!'
      redirect uri: "/"
    }

    if (params.passwd && params.passwd.length() > 0
            && params.repasswd && params.repasswd.length() > 0) {
      if (params.passwd == params.repasswd) {
        user.passwd = authenticateService.encodePassword(params.passwd)
        user.save()
        flash.message = 'Your password has been reset. Please login!'
        redirect controller: "login", action: "auth"
      }
      else {
        flash.message = 'The passwords you entered do not match.'
        redirect action: resetPassword, params: [uid: params.uid]
      }
    } else {
      flash.message = 'The passwords you entered do not match.'
        redirect action: resetPassword, params: [uid: params.uid]  
    }
  }
}
