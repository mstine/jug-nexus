class RatingSecurityFilters {

  def authenticateService
  def grailsApplication

  def filters = {

    authenticatedCheck(controller:'rateable', action:'rate') {

      before = {

        if (!authenticateService.isLoggedIn()) {
            render "DENIED,${grabTaglib().createLink(controller:'login')}"
          return false
        } else {
          return true
        }


      }

    }

  }

  private def grabTaglib() {
    grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
  }


}