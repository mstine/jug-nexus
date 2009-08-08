class EventSpeakerAssignment {

  Event event
  User user
  String topic
  String topicAbstract
  boolean lightningTalk = false

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
