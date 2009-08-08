/**
 * User domain class.
 */
class AcegiUser {
  static transients = ['pass']
  static hasMany = [authorities: Role, eventsAttending:EventAttendeeRegistration, eventsSpeaking:EventSpeakerAssignment]
  static belongsTo = Role

  String username
  /** MD5 Password  */
  String passwd
  String firstName
  String lastName
  String location
  String company
  String email
  String bio
  String website
  String blogFeed
  String twitterNickname
  boolean moderated = false
  String whyIWantToJoin

  /** plain password to create a MD5 password  */
  String pass = '[secret]'

  static constraints = {
    username(blank: false, unique: true)
    passwd(blank: false)
    firstName(blank:false)
    lastName(blank:false)
    location(nullable:true)
    company(nullable:true)
    email(blank:false,email:true)
    bio(nullable:true,maxSize:4000)
    website(nullable:true,url:true)
    blogFeed(nullable:true,url:true)
    twitterNickname(nullable:true)
    whyIWantToJoin(blank:false,maxSize:4000)
  }

  String toString() {
    "${firstName} ${lastName}"
  }
}
