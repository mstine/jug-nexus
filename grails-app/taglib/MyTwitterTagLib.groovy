class MyTwitterTagLib {

  def twitterCacheService

  def timeline = { attrs, body ->

    out << "<ul>"

    //is there a more elegant way to just do the first 10 elements?
    twitterCacheService.cachedTweets.eachWithIndex() { tweet, i ->
      if (i < 10) {
        out << "<li>${twitter.markup(text:tweet)}</li>"
      }
    }

    out << "</ul>"
  }

}
