import org.grails.comments.Commentable
import org.grails.rateable.Rateable

class EventSpeakerAssignment implements Commentable, Rateable {

  Event event
  User user
  String topic
  String topicAbstract
  boolean lightningTalk = false

  static searchable = true

  static constraints = {
    event(nullable:false)
    user(nullable:false)
    topic(blank:false)
    topicAbstract(blank:false,maxSize:4000)
    lightningTalk()
  }

  String toString() {
    "${user.firstName} ${user.lastName}: ${topic}"
  }
}
