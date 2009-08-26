class EventAttendeeRegistrationController {

  def index = { redirect(action: listForEvent, id: params.id) }

  def listForEvent = {
    def event = Event.get(params.id)
    [event: event]
  }

  def setAttendeeIsHere = {
    def attendee = EventAttendeeRegistration.get(params.id)
    attendee.attended = true
    attendee.save(flush: true)

    render """<img src="${resource(dir: 'images', file: 'ok.png')}"/>"""
  }

  def registerAttendee = {
    def user = User.get(params.userId)
    def event = Event.get(params.eventId)

    event.addToRegistrations(new EventAttendeeRegistration(user: user)).save()
    redirect(controller: 'event', action: 'show', id: event.id)
  }

  def unregisterAttendee = {
    def user = User.get(params.userId)
    def event = Event.get(params.eventId)

    def registration = EventAttendeeRegistration.findByEventAndUser(event, user)
    registration.delete()
    redirect(controller: 'event', action: 'show', id: event.id)
  }
}
