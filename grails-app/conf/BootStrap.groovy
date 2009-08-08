class BootStrap {

     def authenticateService

     def init = { servletContext ->

       def memberRole = new Role(authority:"ROLE_MEMBER", description: "Default role for registered users.").save()
       new Role(authority:"ROLE_ADMIN", description: "Administrator role.").save()
       new Role(authority:"ROLE_SPEAKER", description: "Event speaker role.").save()

       new User(username: "mstine", passwd: authenticateService.encodePassword("password"),
                firstName: "Matt", lastName: "Stine",
                email: "matt.stine@gmail.com", whyIWantToJoin: "I started the JUG!", moderated: true).addToAuthorities(memberRole).save()

       new User(username: "jneely", passwd: authenticateService.encodePassword("password"),
                firstName: "Joel", lastName: "Neely",
                email: "joel.neely@gmail.com", whyIWantToJoin: "I've been coding since the 60's!", moderated: true).addToAuthorities(memberRole).save()

       new User(username: "mmayo", passwd: authenticateService.encodePassword("password"),
                firstName: "Michael", lastName: "Mayo",
                email: "michael.mayo@gmail.com", whyIWantToJoin: "I write Android apps!", moderated: true).addToAuthorities(memberRole).save()

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

       new EventAttendeeRegistration(event: Event.findByTitle("Bay Area Ruby Lovers"),
                                  user: User.findByUsername("mmayo")).save()

       new EventAttendeeRegistration(event: Event.findByTitle("Bay Area Ruby Lovers"),
                                  user: User.findByUsername("jneely")).save()

       new EventAttendeeRegistration(event: Event.findByTitle("Bay Area Ruby Lovers"),
                                  user: User.findByUsername("mstine")).save()




     }
     def destroy = {
     }
} 