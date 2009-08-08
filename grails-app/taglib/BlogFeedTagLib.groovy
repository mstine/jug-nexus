import com.sun.syndication.io.SyndFeedInput
import com.sun.syndication.feed.synd.SyndFeed
import com.sun.syndication.io.XmlReader
import com.sun.syndication.feed.synd.SyndEntry

class BlogFeedTagLib {

  def renderBlogFeed = { attrs, body ->

    String feedUrl = attrs.url

    SyndFeedInput input = new SyndFeedInput()
    SyndFeed feed = input.build(new XmlReader(new URL(feedUrl)))

    out << "<div class=\"blogFeed\">\n"
    out << "   <ul>\n"

    feed.entries.eachWithIndex { SyndEntry entry, i ->
      if (i < 5) {
        out << "      <li><strong><a href=\"${entry.link}\">${entry.title}</a></strong><br/><br/>${entry.description.value}</li>\n"
      }
    }

    out << "   </ul>\n</div>"

  }

}
