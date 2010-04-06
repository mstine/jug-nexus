import grails.util.Environment

class BootStrap {

  def authenticateService
  def emailConfirmationService

  def init = {servletContext ->

    switch (Environment.current) {
      case Environment.DEVELOPMENT:
        bootstrapDevelopment()
        break
      case Environment.TEST:
        bootstrapTest()
        break
      case Environment.PRODUCTION:
        bootstrapProduction()
        break
    }

    emailConfirmationService.onConfirmation = {email, uid ->
      log.info("User with id $uid has confirmed their email address $email")
      // now do somethingÉ
      // Then return a map which will redirect the user to this destination
      return [controller: 'register', action: 'resetPassword', params: [uid: uid]]
    }
    emailConfirmationService.onInvalid = {uid ->
      log.warn("User with id $uid attempted an invalid password reset")
    }
    emailConfirmationService.onTimeout = {email, uid ->
      log.warn("User with id $uid failed to reset password after 30 days")
    }


  }

  private def bootstrapTest() {}

  private def bootstrapProduction() {

    //Execute only if we haven't inserted roles before!
    if (Role.count() == 0) {
      def memberRole = new Role(authority: "ROLE_MEMBER", description: "Default role for registered users.").save()
      def adminRole = new Role(authority: "ROLE_ADMIN", description: "Administrator role.").save()
      def speakerRole = new Role(authority: "ROLE_SPEAKER", description: "Event speaker role.").save()

      new User(username: "mstine", passwd: authenticateService.encodePassword("changeme"),
              firstName: "Matt", lastName: "Stine",
              email: "matt.stine@gmail.com", whyIWantToJoin: "I started the JUG!", moderated: true, bio: "Temporary Bio!").addToAuthorities(memberRole).addToAuthorities(adminRole).addToAuthorities(speakerRole).save()
    }

  }

  private def bootstrapDevelopment() {
    def memberRole = new Role(authority: "ROLE_MEMBER", description: "Default role for registered users.").save()
    def adminRole = new Role(authority: "ROLE_ADMIN", description: "Administrator role.").save()
    def speakerRole = new Role(authority: "ROLE_SPEAKER", description: "Event speaker role.").save()

    new User(username: "mstine", passwd: authenticateService.encodePassword("password"),
            firstName: "Matt", lastName: "Stine",
            email: "matt.stine@gmail.com", whyIWantToJoin: "I started the JUG!", moderated: true, bio: """Lorem ipsum dolor sit amet, consectetur adipiscing
elit. Phasellus tincidunt dolor porta nisl bibendum auctor. Ut ac turpis ut eros rutrum iaculis. Ut id ante ipsum. Ut ut est sit amet arcu ultricies ultricies
vitae eu dolor. Cras id lectus eu massa volutpat lacinia ut nec tellus. Nam dapibus massa sit amet tellus vulputate quis varius mauris porta. Etiam laoreet nisi
ut nisl commodo pharetra. Mauris mi purus, volutpat a faucibus nec, viverra sit amet nibh. Praesent mattis eleifend sapien, sed mattis dolor lacinia non. Donec
fermentum dapibus elit, nec dictum odio vestibulum eu. Cras enim metus, facilisis eget blandit a, viverra vel leo. Duis hendrerit massa quis magna semper quis
faucibus velit ultricies. Cras pretium urna quis velit egestas sed vulputate mauris vulputate. Duis nec erat nec tortor tempor placerat sed id tellus.""").addToAuthorities(memberRole).addToAuthorities(adminRole).addToAuthorities(speakerRole).save()

    new User(username: "kdonald", passwd: authenticateService.encodePassword("password"),
            firstName: "Keith", lastName: "Donald",
            email: "keith.donald@springsource.com", whyIWantToJoin: "I started the JUG!", moderated: true, bio: """Our speaker for this event is Keith Donald. Keith is a principal and founding partner at SpringSource, the company behind Spring. He is best known in the Spring community for creating Spring Web Flow. At SpringSource, Keith is the lead of the Web Application Development Products Team. His team, based in Melbourne, Florida, sustains the development of Spring MVC and Web Flow and their associated integrations, and is also responsible for future innovations in the domain of web application development frameworks.

Since the first Spring Experience in 2005, Keith, with Jay Zimmerman of NoFluffJustStuff Software Symposiums, has served as director of the popular conference series.

Keith is also the principal architect behind SpringSourceÕs state-of-the-art training curriculum, which has provided practical training on Spring to over 3000 students worldwide.

Over his career, Keith, an experienced enterprise software developer and mentor, has built business applications for customers spanning a diverse set of industries including banking, network management, information assurance, education, and retail. He is particularly adept at translating business requirements into technical solutions. """).addToAuthorities(speakerRole).save()

    new User(username: "jneely", passwd: authenticateService.encodePassword("password"),
            firstName: "Joel", lastName: "Neely",
            email: "joel.neely@gmail.com", whyIWantToJoin: "I've been coding since the 60's!", moderated: true).addToAuthorities(memberRole).save()

    new User(username: "mmayo", passwd: authenticateService.encodePassword("password"),
            firstName: "Michael", lastName: "Mayo",
            email: "michael.mayo@gmail.com", whyIWantToJoin: "I write Android apps!", moderated: true).addToAuthorities(memberRole).save()

    new User(username: "joeuser", passwd: authenticateService.encodePassword("password"),
            firstName: "Joe", lastName: "User",
            email: "joe.user@gmail.com", whyIWantToJoin: "Test", moderated: true).addToAuthorities(memberRole).save()

    new User(username: "janeuser", passwd: authenticateService.encodePassword("password"),
            firstName: "Jane", lastName: "User",
            email: "jane.user@gmail.com", whyIWantToJoin: "Test", moderated: true).addToAuthorities(memberRole).save()

    new User(username: "jeduser", passwd: authenticateService.encodePassword("password"),
            firstName: "Jed", lastName: "User",
            email: "Jed.user@gmail.com", whyIWantToJoin: "Test", moderated: true).addToAuthorities(memberRole).save()

    new Event(title: "Pragmatic JMS", startTime: new Date("01/01/2009 18:00:00"), endTime: new Date("01/01/2009 20:30:00"),
            location: "X Building", directions: "See Google Maps!").save()

    new Event(title: "Why Scala will Rule the World!", startTime: new Date("02/01/2009 18:00:00"), endTime: new Date("02/01/2009 20:30:00"),
            location: "X Building", directions: "See Google Maps!").save()

    new Event(title: "Bay Area Ruby Lovers", startTime: new Date("03/01/2009 18:00:00"), endTime: new Date("03/01/2009 20:30:00"),
            location: "X Building", directions: "See Google Maps!").save()

    new EventSpeakerAssignment(event: Event.findByTitle("Pragmatic JMS"),
            user: User.findByUsername("mstine"),
            topic: "Pragmatic JMS", topicAbstract: "Test").save()

    new EventSpeakerAssignment(event: Event.findByTitle("Why Scala will Rule the World!"),
            user: User.findByUsername("jneely"),
            topic: "Why Scala will Rule the World!", topicAbstract: "Test").save()

    new EventSpeakerAssignment(event: Event.findByTitle("Bay Area Ruby Lovers"),
            user: User.findByUsername("mmayo"),
            topic: "Bay Area Ruby Lovers", topicAbstract: "Test").save()

    def event = Event.findByTitle("Bay Area Ruby Lovers")

    1.upto(25) {i ->
      def dummy = new User(username: "user${i}", passwd: authenticateService.encodePassword("password"),
              firstName: "User", lastName: "${i}",
              email: "user.${i}@gmail.com", whyIWantToJoin: "Test", moderated: true).addToAuthorities(memberRole).save()
      event.addToRegistrations(new EventAttendeeRegistration(user: dummy)).save()

    }

    event.addToRegistrations(new EventAttendeeRegistration(user: User.findByUsername("mmayo"))).save()
    event.addToRegistrations(new EventAttendeeRegistration(user: User.findByUsername("jneely"))).save()
    event.addToRegistrations(new EventAttendeeRegistration(user: User.findByUsername("mstine"))).save()
    event.addToRegistrations(new EventAttendeeRegistration(user: User.findByUsername("joeuser"))).save()
    event.addToRegistrations(new EventAttendeeRegistration(user: User.findByUsername("janeuser"))).save()
    event.addToRegistrations(new EventAttendeeRegistration(user: User.findByUsername("jeduser"))).save()
  }

  def destroy = {
  }
} 