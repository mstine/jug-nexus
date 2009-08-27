class TwitterEventService {

  boolean transactional = false

  def twitterService
  def tinyurlService
  def grailsApplication

  def tweetUpdatedTopic(def topic) {
    def tinyLink = createTinyLink("eventSpeakerAssignment", "show", topic.id)
    def prefix = buildTweetPrefix("Updated", topic)
    def tweet = "${prefix}: ${topic.topic} ${tinyLink}"
    sendTweet(tweet)
  }

  def tweetNewTopic(def topic) {
    def tinyLink = createTinyLink("eventSpeakerAssignment", "show", topic.id)
    def prefix = buildTweetPrefix("New", topic)
    def tweet = "${prefix}: ${topic.topic} ${tinyLink}"
    sendTweet(tweet)
  }

  def tweetNewFileForTopic(def topic) {
    def tinyLink = createTinyLink("eventSpeakerAssignment", "show", topic.id)
    def prefix = buildTweetPrefix("New File Uploaded for", topic)
    def tweet = "${prefix}: ${topic.topic} ${tinyLink}"
    sendTweet(tweet)
  }

  def tweetUpdatedEvent(def event) {
    def tinyLink = createTinyLink("event", "show", event.id)
    def tweet = "Updated Event Posted for ${createFormattedDate(event.startTime)}: ${event.title} ${tinyLink}"
    sendTweet(tweet)
  }

  def tweetNewEvent(def event) {
    def tinyLink = createTinyLink("event", "show", event.id)
    def tweet = "New Event Posted for ${createFormattedDate(event.startTime)}: ${event.title} ${tinyLink}"
    sendTweet(tweet)
  }

  private def createTinyLink(def controller, def action, def id) {
    def link = grabTaglib().createLink(controller: controller, action: action, id: id, absolute: true)
    def tinyLink = tinyurlService.tiny(link)
    return tinyLink
  }

  private def buildTweetPrefix(eventType, topic) {
    def prefix = "${eventType} "

    if (topic.lightningTalk) {
      prefix += "Lightning Talk"
    } else {
      prefix += "Topic"
    }
    prefix += " by ${topic.user.firstName} ${topic.user.lastName}"
    return prefix
  }

  private def sendTweet(def tweet) {
    def authParams = [username: grailsApplication.config.twitter.username,
            password: grailsApplication.config.twitter.password]
    log.debug tweet
//    twitterService.setStatus(tweet, authParams)
  }

  private def createFormattedDate(def date) {
    grabTaglib().formatDate(format: 'MM/dd/yyyy', date: date)
  }

  private def grabTaglib() {
    grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
  }
}
