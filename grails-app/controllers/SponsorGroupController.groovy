

class SponsorGroupController {
    
    def index = {
        redirect action:"list", params:params 
    }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ sponsorGroupInstanceList: SponsorGroup.list( params ), sponsorGroupInstanceTotal: SponsorGroup.count() ]
    }

    def show = {
        def sponsorGroupInstance = SponsorGroup.get( params.id )

        if(!sponsorGroupInstance) {
            flash.message = "SponsorGroup not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            [ sponsorGroupInstance : sponsorGroupInstance ]
        }
    }

    def delete = {
        def sponsorGroupInstance = SponsorGroup.get( params.id )
        if(sponsorGroupInstance) {
            try {
                sponsorGroupInstance.delete(flush:true)
                flash.message = "SponsorGroup ${params.id} deleted"
                redirect(action:"list")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "SponsorGroup ${params.id} could not be deleted"
                redirect(action:"show",id:params.id)
            }
        }
        else {
            flash.message = "SponsorGroup not found with id ${params.id}"
            redirect(action:"list")
        }
    }

    def edit = {
        def sponsorGroupInstance = SponsorGroup.get( params.id )

        if(!sponsorGroupInstance) {
            flash.message = "SponsorGroup not found with id ${params.id}"
            redirect action:'list'
        }
        else {
            return [ sponsorGroupInstance : sponsorGroupInstance ]
        }
    }

    def update = {
        def sponsorGroupInstance = SponsorGroup.get( params.id )
        if(sponsorGroupInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(sponsorGroupInstance.version > version) {
                    
                    sponsorGroupInstance.errors.rejectValue("version", "sponsorGroup.optimistic.locking.failure", "Another user has updated this SponsorGroup while you were editing.")

                    render view:'edit', model:[sponsorGroupInstance:sponsorGroupInstance]
                    return
                }
            }
            sponsorGroupInstance.properties = params
            if(!sponsorGroupInstance.hasErrors() && sponsorGroupInstance.save()) {
                flash.message = "SponsorGroup ${params.id} updated"

                redirect action:'show', id:sponsorGroupInstance.id
            }
            else {
                render view:'edit', model:[sponsorGroupInstance:sponsorGroupInstance]
            }
        }
        else {
            flash.message = "SponsorGroup not found with id ${params.id}"
            redirect action:'list'
        }
    }

    def create = {
        def sponsorGroupInstance = new SponsorGroup()
        sponsorGroupInstance.properties = params
        return ['sponsorGroupInstance':sponsorGroupInstance]
    }

    def save = {
        def sponsorGroupInstance = new SponsorGroup(params)
        if(sponsorGroupInstance.save(flush:true)) {
            flash.message = "SponsorGroup ${sponsorGroupInstance.id} created"

            redirect action:"show", id:sponsorGroupInstance.id
        }
        else {
            render view:'create', model:[sponsorGroupInstance:sponsorGroupInstance]
        }
    }
}
