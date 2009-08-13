class RaffleController {

  def raffleService

  def index = {
    def event = Event.get(params.id)
    [nonWinningParticipants: raffleService.findNonWinningParticipants(event),
            event: event,
            winningParticipants: raffleService.findWinningParticipants(event)]
  }

  def pickWinner = {
    def event = Event.get(params.id)
    def attendees = raffleService.findNonWinningParticipants(event)

    int totalAttendees = attendees.size()

    int winner = (int) Math.round(Math.random() * totalAttendees);
    def winningAttendee = attendees.get(winner)

    winningAttendee.raffleWinner = true
    winningAttendee.save()

    render(contentType: "text/json") {
      nonWinners {
        attendees.each {a ->
          nonWinner(id: a.id, firstName: a.user.firstName, lastName: a.user.lastName, raffleWinner: a.raffleWinner)
        }
      }
    }
  }

  def listWinners = {
    def event = Event.get(params.id)
    def attendees = raffleService.findWinningParticipants(event)

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
    winner.save(flush: true)

    render "OK"
  }


}
