package com.classplanner

class DashboardController {

    def index() { }

    def dashboard = {
        def course = Course.get(params.id)
        if (course){
            if(course.teacher.userName == session.user.userName ||
                    course.students.collect{it.userName}.contains(
                            session.user.userName)){
                def tasks = Task.findAllByCourseAndCompleted(course, false,
                        [max:3, sort:'dueDate', order: 'asc'])
                def students = course.students
                def messages = TextMessage.findAllByCourseAndParentIsNull(course,
                        [sort:'id', order:'desc'])
                def sponsorships = course.sponsorships
                return [course:course, tasks:tasks, students:students,
                        messages:messages, sponsorships:sponsorships]
            }
            else{
                flash.message = "Access to dashboard for ${course.subject} denied. Access is only for students or organisers."
                redirect controller:'course', action:'index'
            }
        }
        else{
            //flash.message = "No course was found with an id of ${params.id}"
            redirect controller:'Course', action:'index'
        }
    }
}
