class EventAttendeeRegistration {

    Event event
    User user
    boolean raffleWinner = false

    static constraints = {
      event(nullable:false)
      user(nullable:false)
      raffleWinner()
    }

    String toString() {
      "(${event.startTime}) ${event.title} - ${user.firstName} ${user.lastName}"
    }
}
