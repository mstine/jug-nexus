class RegistrationTagLib {

  def authenticateService

  def registerForEvent = {attrs, body ->
    out << """<div class="registration">"""

    def event = attrs.event

    if (event.registrationOpen) {

      def user = authenticateService.userDomain()

      if (event.registrations.size() < event.maxAttendees) {
        if (user) {
          def registered = event.registrations.any { it.user == user}

          if (registered) {
            outputUnregisterLink(out, user, event)
          } else {
            out << """<h2><a href="${createLink(controller: "eventAttendeeRegistration", action: "registerAttendee", params: [userId: user.id, eventId: event.id])}">"""
            out << """<img src="${resource(dir: 'images', file: 'ok.png')}"/> Register Me!</a></h2>"""
          }
        } else {
          out << """<h2><a href="${createLink(controller: "login")}">Login</a> to register for this event!</h2>"""
        }
      } else if (user && event.registrations.any {it.user == user}) {
        outputUnregisterLink(out, user, event)
      } else {
        out << """<h2 class="eventFull">This event has reached its maximum attendance.</h2>"""
      }
    } else {
      out << """<h2 class="eventClosed">Registration for this event has closed.</h2>"""
    }

    out << """</div>"""
  }

  private def outputUnregisterLink(out, user, event) {
    out << """<h2><a href="${createLink(controller: "eventAttendeeRegistration", action: "unregisterAttendee", params: [userId: user.id, eventId: event.id])}">"""
    out << """<img src="${resource(dir: 'images', file: 'cancel.png')}"/> Unregister Me!</a></h2>"""
  }


}
