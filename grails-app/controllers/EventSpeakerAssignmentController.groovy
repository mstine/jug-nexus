import com.lucastex.grails.fileuploader.UFile

class EventSpeakerAssignmentController {

  def twitterService
  def tinyurlService

  def index = { redirect(action: list, params: params) }

  // the delete, save and update actions only accept POST requests
  static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

  def list = {
    params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
    [eventSpeakerAssignmentInstanceList: EventSpeakerAssignment.list(params), eventSpeakerAssignmentInstanceTotal: EventSpeakerAssignment.count()]
  }

  def show = {
    def eventSpeakerAssignmentInstance = EventSpeakerAssignment.get(params.id)

    if (!eventSpeakerAssignmentInstance) {
      flash.message = "EventSpeakerAssignment not found with id ${params.id}"
      redirect(action: list)
    }
    else { return [eventSpeakerAssignmentInstance: eventSpeakerAssignmentInstance] }
  }

  def delete = {
    def eventSpeakerAssignmentInstance = EventSpeakerAssignment.get(params.id)
    if (eventSpeakerAssignmentInstance) {
      try {
        eventSpeakerAssignmentInstance.delete(flush: true)
        flash.message = "EventSpeakerAssignment ${params.id} deleted"
        redirect(action: list)
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "EventSpeakerAssignment ${params.id} could not be deleted"
        redirect(action: show, id: params.id)
      }
    }
    else {
      flash.message = "EventSpeakerAssignment not found with id ${params.id}"
      redirect(action: list)
    }
  }

  def edit = {
    def eventSpeakerAssignmentInstance = EventSpeakerAssignment.get(params.id)

    if (!eventSpeakerAssignmentInstance) {
      flash.message = "EventSpeakerAssignment not found with id ${params.id}"
      redirect(action: list)
    }
    else {
      return [eventSpeakerAssignmentInstance: eventSpeakerAssignmentInstance]
    }
  }

  def update = {
    def eventSpeakerAssignmentInstance = EventSpeakerAssignment.get(params.id)
    if (eventSpeakerAssignmentInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (eventSpeakerAssignmentInstance.version > version) {

          eventSpeakerAssignmentInstance.errors.rejectValue("version", "eventSpeakerAssignment.optimistic.locking.failure", "Another user has updated this EventSpeakerAssignment while you were editing.")
          render(view: 'edit', model: [eventSpeakerAssignmentInstance: eventSpeakerAssignmentInstance])
          return
        }
      }
      eventSpeakerAssignmentInstance.properties = params
      if (!eventSpeakerAssignmentInstance.hasErrors() && eventSpeakerAssignmentInstance.save()) {
        flash.message = "EventSpeakerAssignment ${params.id} updated"

        def link = createLink(controller: "eventSpeakerAssignment", action: "show", id: eventSpeakerAssignmentInstance.id, absolute: true)
        def tinyLink = tinyurlService.tiny(link)

        def prefix = "Updated "

        if (eventSpeakerAssignmentInstance.lightningTalk) {
          prefix += "Lightning Talk"
        } else {
          prefix += "Topic"
        }
        prefix += " by ${eventSpeakerAssignmentInstance.user.firstName} ${eventSpeakerAssignmentInstance.user.lastName}"

        twitterService.setStatus("${prefix}: ${eventSpeakerAssignmentInstance.topic} ${tinyLink}", [username: grailsApplication.config.twitter.username,
                password: grailsApplication.config.twitter.password])

        redirect(action: show, id: eventSpeakerAssignmentInstance.id)
      }
      else {
        render(view: 'edit', model: [eventSpeakerAssignmentInstance: eventSpeakerAssignmentInstance])
      }
    }
    else {
      flash.message = "EventSpeakerAssignment not found with id ${params.id}"
      redirect(action: list)
    }
  }

  def create = {
    def eventSpeakerAssignmentInstance = new EventSpeakerAssignment()
    eventSpeakerAssignmentInstance.properties = params
    return ['eventSpeakerAssignmentInstance': eventSpeakerAssignmentInstance]
  }

  def save = {
    def eventSpeakerAssignmentInstance = new EventSpeakerAssignment(params)
    eventSpeakerAssignmentInstance.merge()
    if (eventSpeakerAssignmentInstance.save()) {
      flash.message = "EventSpeakerAssignment ${eventSpeakerAssignmentInstance.id} created"

      def link = createLink(controller: "eventSpeakerAssignment", action: "show", id: eventSpeakerAssignmentInstance.id, absolute: true)
      def tinyLink = tinyurlService.tiny(link)

      def prefix = "New "

      if (eventSpeakerAssignmentInstance.lightningTalk) {
        prefix += "Lightning Talk"
      } else {
        prefix += "Topic"
      }
      prefix += " by ${eventSpeakerAssignmentInstance.user.firstName} ${eventSpeakerAssignmentInstance.user.lastName}"

      twitterService.setStatus("${prefix}: ${eventSpeakerAssignmentInstance.topic} ${tinyLink}", [username: grailsApplication.config.twitter.username,
              password: grailsApplication.config.twitter.password])

      redirect(action: show, id: eventSpeakerAssignmentInstance.id)
    }
    else {
      render(view: 'create', model: [eventSpeakerAssignmentInstance: eventSpeakerAssignmentInstance])
    }
  }

  def addFile = {
    UFile uploadedFile = UFile.get(params.ufileId)
    EventSpeakerAssignment eventSpeakerAssignment = EventSpeakerAssignment.get(params.id)

    eventSpeakerAssignment.addToFiles(uploadedFile)
    eventSpeakerAssignment.save()

    def prefix = "New File Uploaded for ${eventSpeakerAssignment.user.firstName} ${eventSpeakerAssignment.user.lastName}'s "
    if (eventSpeakerAssignment.lightningTalk) {
      prefix += "Lightning Talk"
    } else {
      prefix += "Topic"
    }

    def link = createLink(controller: "eventSpeakerAssignment", action: "show", id: eventSpeakerAssignment.id, absolute: true)
    def tinyLink = tinyurlService.tiny(link)
    twitterService.setStatus("${prefix}: ${eventSpeakerAssignment.topic} ${tinyLink}", [username: grailsApplication.config.twitter.username,
            password: grailsApplication.config.twitter.password])

    redirect action: "show", id: params.id
  }
}
