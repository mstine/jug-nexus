import Event
import EventAttendeeRegistration
import User
import org.springframework.dao.DataIntegrityViolationException

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
    render registerForEvent(event: event)
  }

  def unregisterAttendee = {
    def user = User.get(params.userId)
    def event = Event.get(params.eventId)

    def registration = EventAttendeeRegistration.findByEventAndUser(event, user)
    user.removeFromEventsAttending(registration)
    event.removeFromRegistrations(registration)
    registration.delete()
    render registerForEvent(event: event)
  }

  def delete = {
    def user = User.get(params.userId)
    def event = Event.get(params.eventId)

    def registration = EventAttendeeRegistration.findByEventAndUser(event, user)
    user.removeFromEventsAttending(registration)
    event.removeFromRegistrations(registration)
    registration.delete()
    redirect (action: listForEvent, id: params.eventId)
  }
}
