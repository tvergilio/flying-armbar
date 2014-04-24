package com.classplanner



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TextMessageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TextMessage.list(params), model:[textMessageInstanceCount: TextMessage.count()]
    }

    def show(TextMessage textMessageInstance) {
        respond textMessageInstance
    }

    def create() {
        respond new TextMessage(params)
    }

    @Transactional
    def save(TextMessage textMessageInstance) {
        if (textMessageInstance == null) {
            notFound()
            return
        }

        if (textMessageInstance.hasErrors()) {
            respond textMessageInstance.errors, view:'create'
            return
        }

        textMessageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'textMessageInstance.label', default: 'TextMessage'), textMessageInstance.id])
                redirect textMessageInstance
            }
            '*' { respond textMessageInstance, [status: CREATED] }
        }
    }

    def edit(TextMessage textMessageInstance) {
        respond textMessageInstance
    }

    @Transactional
    def update(TextMessage textMessageInstance) {
        if (textMessageInstance == null) {
            notFound()
            return
        }

        if (textMessageInstance.hasErrors()) {
            respond textMessageInstance.errors, view:'edit'
            return
        }

        textMessageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TextMessage.label', default: 'TextMessage'), textMessageInstance.id])
                redirect textMessageInstance
            }
            '*'{ respond textMessageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TextMessage textMessageInstance) {

        if (textMessageInstance == null) {
            notFound()
            return
        }

        textMessageInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TextMessage.label', default: 'TextMessage'), textMessageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'textMessageInstance.label', default: 'TextMessage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
