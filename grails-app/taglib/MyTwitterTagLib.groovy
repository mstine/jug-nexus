class MyTwitterTagLib {

  def twitterCacheService

  def timeline = { attrs, body ->

    out << "<ul>"

    twitterCacheService.cachedTweets.each {
      out << "<li>${twitter.markup(text:it)}</li>"
    }

    out << "</ul>"
  }

}
