import grails.converters.JSON

class RaffleController {

  def index = {
    def event = Event.get(params.id)

    [nonWinningParticipants: EventAttendeeRegistration.findAllByEventAndRaffleWinner(event, false),
            event: event,
            winningParticipants: EventAttendeeRegistration.findAllByEventAndRaffleWinner(event, true)]
  }

  def pickWinner = {
    def event = Event.get(params.id)
    def attendees = EventAttendeeRegistration.findAllByEventAndRaffleWinner(event, false)

    int totalAttendees = attendees.size()

    int winner = (int) Math.round(Math.random() * totalAttendees);
    def winningAttendee = attendees.get(winner)

    winningAttendee.raffleWinner = true
    winningAttendee.save()

    render(contentType: "text/json") {
      nonWinners {
        attendees.each { a ->
          nonWinner(id: a.id, firstName: a.user.firstName, lastName: a.user.lastName, raffleWinner: a.raffleWinner)
        }
      }
    }
  }

  def listWinners = {
    def event = Event.get(params.id)
    def attendees = EventAttendeeRegistration.findAllByEventAndRaffleWinner(event, true);

    render(contentType: "text/json") {
      winners {
        attendees.each {
          winner(id: it.id, firstName: it.user.firstName, lastName: it.user.lastName, raffleWinner: it.raffleWinner)
        }
      }
    }
  }

  def deleteWinner = {
    def winner = EventAttendeeRegistration.get(params.id)
    winner.raffleWinner = false
    winner.save(flush:true)

    render "OK"
  }


}
