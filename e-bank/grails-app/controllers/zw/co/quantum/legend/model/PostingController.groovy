package zw.co.quantum.legend.model

class PostingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [postingInstanceList: Posting.list(params), postingInstanceTotal: Posting.count()]
    }

    def create = {
        def postingInstance = new Posting()
        postingInstance.properties = params
        return [postingInstance: postingInstance]
    }

    def save = {
        def postingInstance = new Posting(params)
        if (postingInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'posting.label', default: 'Posting'), postingInstance.id])}"
            redirect(action: "show", id: postingInstance.id)
        }
        else {
            render(view: "create", model: [postingInstance: postingInstance])
        }
    }

    def show = {
        def postingInstance = Posting.get(params.id)
        if (!postingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'posting.label', default: 'Posting'), params.id])}"
            redirect(action: "list")
        }
        else {
            [postingInstance: postingInstance]
        }
    }

    def edit = {
        def postingInstance = Posting.get(params.id)
        if (!postingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'posting.label', default: 'Posting'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [postingInstance: postingInstance]
        }
    }

    def update = {
        def postingInstance = Posting.get(params.id)
        if (postingInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (postingInstance.version > version) {
                    
                    postingInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'posting.label', default: 'Posting')] as Object[], "Another user has updated this Posting while you were editing")
                    render(view: "edit", model: [postingInstance: postingInstance])
                    return
                }
            }
            postingInstance.properties = params
            if (!postingInstance.hasErrors() && postingInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'posting.label', default: 'Posting'), postingInstance.id])}"
                redirect(action: "show", id: postingInstance.id)
            }
            else {
                render(view: "edit", model: [postingInstance: postingInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'posting.label', default: 'Posting'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def postingInstance = Posting.get(params.id)
        if (postingInstance) {
            try {
                postingInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'posting.label', default: 'Posting'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'posting.label', default: 'Posting'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'posting.label', default: 'Posting'), params.id])}"
            redirect(action: "list")
        }
    }
	
}
