package com.classplanner

class SendController {

    def index() { }

    def send() {
        //check captcha first before sending
        boolean captchaValid = simpleCaptchaService.validateCaptcha(params.captcha)
        if (captchaValid) {
            sendMail {
                to "classplannerdev@gmail.com"
                from "${request.getParameter('email')}"
                subject "Message from: ${request.getParameter('name')} - ${request.getParameter('subject')}"
                body request.getParameter('body') ?: grailsApplication.config.grails.mail.default.body
            }
            render "Thank you, your e-mail has been sent to our dev team."
        } else {
            //captcha entered is wrong, preserve values entered and get another captcha
            flash.message = message(code: 'captcha.error.message', args:['Please re-enter the captcha', null])
            redirect(controller: 'send', action: 'mailForm', params: getParams())
        }
    }

    def mailForm(){}

    def simpleCaptchaService

}
