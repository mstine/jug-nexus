class SponsorGroup {

  String name

  static hasMany = [sponsors: Sponsor]

  static mapping = {
    sponsors lazy: false
  }

  static constraints = {
    name(blank: false)
    sponsors()
  }

  String toString() {
    name
  }
}
