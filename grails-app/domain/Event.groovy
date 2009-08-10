import org.grails.comments.Commentable
import org.grails.rateable.Rateable

class Event implements Commentable, Rateable {

  String title
  Date startTime
  Date endTime
  String location
  String directions
  String description
  boolean onHomePage = false
  boolean archived = false
  int maxAttendees
  boolean registrationOpen = true

  static searchable = true

  static hasMany = [registrations:EventAttendeeRegistration, speakers:EventSpeakerAssignment]

  static constraints = {
    title(blank:false)
    startTime(blank:false)
    endTime(blank:false)
    location(blank:false)
    directions(blank:false)
    description(nullable:true, maxSize:4000)
    maxAttendees(min:0)
    registrationOpen()
    onHomePage()
    archived()
  }

  String toString() {
    title
  }
}
