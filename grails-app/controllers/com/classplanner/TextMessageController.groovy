package com.classplanner

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class TextMessageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    String linkName = "Messages"

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def list
        def count
        def course = Course.get(params.course_id)
        if (course) {
            list = TextMessage.findAllByCourse(course, params)
            count = TextMessage.countByCourse(course)
        } else {
            list = TextMessage.list(params)
            count = TextMessage.count()
        }
        render view: 'ajaxIndex', model: [textMessageInstanceList : list,
                                          textMessageInstanceCount: count,
                                          course                  : course]

    }

    def show(TextMessage textMessageInstance) {
        respond textMessageInstance
    }

    def reply = {
        def parent = TextMessage.get(params.id)
        def textMessageInstance = new TextMessage(parent:parent, course:parent.course,
                subject:"RE: $parent.subject")
        render view:'create', model:['textMessageInstance':textMessageInstance]
    }

    def create() {
        if (params.course == null) {
            params.course = Course.get(params.course_id)
        }

        TextMessage message = new TextMessage(params)
        respond message
    }

    @Transactional
    def save(TextMessage textMessageInstance) {
        if (textMessageInstance == null) {
            notFound()
            return
        }

        if (textMessageInstance.course == null) {
            def course = Course.get(params.course_id)
            textMessageInstance.course = course
            textMessageInstance.validate()
        }

        if (textMessageInstance.hasErrors()) {
            respond textMessageInstance.errors, view: 'create'
            return
        }

        textMessageInstance.save flush: true

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
            respond textMessageInstance.errors, view: 'edit'
            return
        }

        textMessageInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TextMessage.label', default: 'TextMessage'), textMessageInstance.id])
                redirect textMessageInstance
            }
            '*' { respond textMessageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TextMessage textMessageInstance) {

        if (textMessageInstance == null) {
            notFound()
            return
        }

        textMessageInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TextMessage.label', default: 'TextMessage'), textMessageInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'textMessageInstance.label', default: 'TextMessage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def showDetail() {
        def textMessageInstance = TextMessage.get(params.id)
        if (textMessageInstance) {
            render(template: "details", model: [textMessageInstance: textMessageInstance])
        } else {
            render "No message found with id: ${params.id}"
        }
    }
}
