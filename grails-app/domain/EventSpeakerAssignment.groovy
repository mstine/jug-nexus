import Event
import User
import com.lucastex.grails.fileuploader.UFile
import org.grails.comments.Commentable
import org.grails.rateable.Rateable

class EventSpeakerAssignment implements Commentable, Rateable {

  Event event
  User user
  String topic
  String topicAbstract
  boolean lightningTalk = false

  static hasMany = [files: UFile]

  static searchable = {
    mapping {
      spellCheck "include"
    }
  }

  static constraints = {
    event(nullable: false)
    user(nullable: false)
    topic(blank: false)
    topicAbstract(blank: false, maxSize: 4000)
    lightningTalk()
  }

  String toString() {
    "${topic}"
  }
}
