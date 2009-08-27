
class TwitterJob {
    def twitterService
    def twitterCacheService
    def grailsApplication

    def startDelay = 30000 //startup after 30 seconds
    def timeout = 300000 // execute job every 5 minutes

    def execute() {
        log.debug "Retrieving twitter timeline..."
        twitterCacheService.cachedTweets = twitterService.getUserTimeline([username:grailsApplication.config.twitter.username,
                      password:grailsApplication.config.twitter.password])
        log.debug "Twitter timeline updated!"
    }
}
