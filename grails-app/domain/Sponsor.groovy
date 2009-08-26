import com.lucastex.grails.fileuploader.UFile

class Sponsor {

  String name
  String url
  UFile logo

  static belongsTo = [sponsorGroup: SponsorGroup]

  static mapping = {
    logo lazy: false
  }

  static constraints = {
    name(blank: false)
    url(blank: false, url: true)
    sponsorGroup()
    logo(nullable:true)
  }

  String toString() {
    name
  }
}
