class RaffleService {

  boolean transactional = true

  def findNonWinningParticipants(def event) {
    EventAttendeeRegistration.createCriteria().list {
      and {
        eq("event", event)
        eq("raffleWinner", false)
        eq("attended", true)
      }
    }
  }

  def findWinningParticipants(def event) {
    EventAttendeeRegistration.createCriteria().list {
      and {
        eq("event", event)
        eq("raffleWinner", true)
        eq("attended", true)

      }
    }
  }
}