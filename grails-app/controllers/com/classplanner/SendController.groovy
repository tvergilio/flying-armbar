package com.classplanner

class SendController {

    def index() { }

    def send() {
        sendMail{
            to "classplannerdev@gmail.com"
            from "${request.getParameter('email')}"
            subject "Message from: ${request.getParameter('name')} - ${request.getParameter('subject')}"
            body request.getParameter('body')?: grailsApplication.config.grails.mail.default.body
        }
        render "Thank you, your e-mail has been sent to our dev team."
    }

    def mailForm(){}
}
