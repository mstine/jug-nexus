import EventAttendeeRegistration
import EventSpeakerAssignment
import Role

/**
 * User domain class.
 */
class User {
  static transients = ['pass']
  static hasMany = [authorities: Role, eventsAttending: EventAttendeeRegistration, eventsSpeaking: EventSpeakerAssignment]
  static belongsTo = Role

  static searchable = {
    mapping {
      spellCheck "include"
    }
  }

  String username
  /** MD5 Password    */
  String passwd
  String firstName
  String lastName
  String location
  String company
  String email
  boolean showEmail = false
  String bio
  String website
  String blogFeed
  String twitterNickname
  boolean moderated = false
  boolean speakerOnly = false
  String whyIWantToJoin
  String lastPasswordResetToken

  /** plain password to create a MD5 password    */
  String pass = '[secret]'

  static constraints = {
    username(blank: false, unique: true)
    passwd(blank: false)
    firstName(blank: false)
    lastName(blank: false)
    location(nullable: true)
    company(nullable: true)
    email(blank: false, email: true)
    bio(nullable: true, maxSize: 4000)
    website(nullable: true, url: true)
    blogFeed(nullable: true, url: true)
    twitterNickname(nullable: true)
    whyIWantToJoin(blank: false, maxSize: 4000)
    lastPasswordResetToken(nullable: true)
  }

  String toString() {
    "${firstName} ${lastName}"
  }




  boolean equals(o) {
    if (this.is(o)) return true;

    if (!o || getClass() != o.class) return false;

    User user = (User) o;

    if (!username.equals(user.username)) return false;

    return true;
  }

  int hashCode() {
    return username.hashCode();
  }
}
