class BootStrap {

  def authenticateService

  def init = {servletContext ->

    def memberRole = new Role(authority: "ROLE_MEMBER", description: "Default role for registered users.").save()
    def adminRole = new Role(authority: "ROLE_ADMIN", description: "Administrator role.").save()
    def speakerRole = new Role(authority: "ROLE_SPEAKER", description: "Event speaker role.").save()

    new User(username: "mstine", passwd: authenticateService.encodePassword("password"),
            firstName: "Matt", lastName: "Stine",
            email: "matt.stine@gmail.com", whyIWantToJoin: "I started the JUG!", moderated: true, bio: """Lorem ipsum dolor sit amet, consectetur adipiscing
elit. Phasellus tincidunt dolor porta nisl bibendum auctor. Ut ac turpis ut eros rutrum iaculis. Ut id ante ipsum. Ut ut est sit amet arcu ultricies ultricies
vitae eu dolor. Cras id lectus eu massa volutpat lacinia ut nec tellus. Nam dapibus massa sit amet tellus vulputate quis varius mauris porta. Etiam laoreet nisi
ut nisl commodo pharetra. Mauris mi purus, volutpat a faucibus nec, viverra sit amet nibh. Praesent mattis eleifend sapien, sed mattis dolor lacinia non. Donec
fermentum dapibus elit, nec dictum odio vestibulum eu. Cras enim metus, facilisis eget blandit a, viverra vel leo. Duis hendrerit massa quis magna semper quis
faucibus velit ultricies. Cras pretium urna quis velit egestas sed vulputate mauris vulputate. Duis nec erat nec tortor tempor placerat sed id tellus.""").addToAuthorities(memberRole).addToAuthorities(adminRole).addToAuthorities(speakerRole).save()

    new User(username: "jneely", passwd: authenticateService.encodePassword("password"),
            firstName: "Joel", lastName: "Neely",
            email: "joel.neely@gmail.com", whyIWantToJoin: "I've been coding since the 60's!", moderated: true).addToAuthorities(memberRole).save()

    new User(username: "mmayo", passwd: authenticateService.encodePassword("password"),
            firstName: "Michael", lastName: "Mayo",
            email: "michael.mayo@gmail.com", whyIWantToJoin: "I write Android apps!", moderated: true).addToAuthorities(memberRole).save()

    new User(username: "joeuser", passwd: authenticateService.encodePassword("password"),
            firstName: "Joe", lastName: "User",
            email: "joe.user@gmail.com", whyIWantToJoin: "Test", moderated: true).addToAuthorities(memberRole).save()

    new User(username: "janeuser", passwd: authenticateService.encodePassword("password"),
            firstName: "Jane", lastName: "User",
            email: "jane.user@gmail.com", whyIWantToJoin: "Test", moderated: true).addToAuthorities(memberRole).save()

    new User(username: "jeduser", passwd: authenticateService.encodePassword("password"),
            firstName: "Jed", lastName: "User",
            email: "Jed.user@gmail.com", whyIWantToJoin: "Test", moderated: true).addToAuthorities(memberRole).save()

    new Event(title: "Pragmatic JMS", startTime: new Date("01/01/2009 18:00:00"), endTime: new Date("01/01/2009 20:30:00"),
            location: "X Building", directions: "See Google Maps!").save()

    new Event(title: "Why Scala will Rule the World!", startTime: new Date("02/01/2009 18:00:00"), endTime: new Date("02/01/2009 20:30:00"),
            location: "X Building", directions: "See Google Maps!").save()

    new Event(title: "Bay Area Ruby Lovers", startTime: new Date("03/01/2009 18:00:00"), endTime: new Date("03/01/2009 20:30:00"),
            location: "X Building", directions: "See Google Maps!").save()

    new EventSpeakerAssignment(event: Event.findByTitle("Pragmatic JMS"),
            user: User.findByUsername("mstine"),
            topic: "Pragmatic JMS", topicAbstract: "Test").save()

    new EventSpeakerAssignment(event: Event.findByTitle("Why Scala will Rule the World!"),
            user: User.findByUsername("jneely"),
            topic: "Why Scala will Rule the World!", topicAbstract: "Test").save()

    new EventSpeakerAssignment(event: Event.findByTitle("Bay Area Ruby Lovers"),
            user: User.findByUsername("mmayo"),
            topic: "Bay Area Ruby Lovers", topicAbstract: "Test").save()

    def event = Event.findByTitle("Bay Area Ruby Lovers")

    1.upto(25) {i ->
      def dummy = new User(username: "user${i}", passwd: authenticateService.encodePassword("password"),
              firstName: "User", lastName: "${i}",
              email: "user.${i}@gmail.com", whyIWantToJoin: "Test", moderated: true).addToAuthorities(memberRole).save()
      event.addToRegistrations(new EventAttendeeRegistration(user: dummy)).save()

    }

    event.addToRegistrations(new EventAttendeeRegistration(user: User.findByUsername("mmayo"))).save()
    event.addToRegistrations(new EventAttendeeRegistration(user: User.findByUsername("jneely"))).save()
    event.addToRegistrations(new EventAttendeeRegistration(user: User.findByUsername("mstine"))).save()
    event.addToRegistrations(new EventAttendeeRegistration(user: User.findByUsername("joeuser"))).save()
    event.addToRegistrations(new EventAttendeeRegistration(user: User.findByUsername("janeuser"))).save()
    event.addToRegistrations(new EventAttendeeRegistration(user: User.findByUsername("jeduser"))).save()

  }
  def destroy = {
  }
} 