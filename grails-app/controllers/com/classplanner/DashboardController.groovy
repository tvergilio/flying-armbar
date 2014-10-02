package com.classplanner

class DashboardController {

    def index() {}

    def dashboard = {
        def course = Course.get(params.id)
        if (course) {
            if (course.teacher.userName == session.user.userName ||
                    course.students.collect { it.userName }.contains(
                            session.user.userName)) {
                def tasks = Task.findAllByCourseAndCompleted(course, false,
                        [max: 3, sort: 'dueDate', order: 'asc'])
                def students = course.students
                def messages = TextMessage.findAllByCourseAndParentIsNull(course,
                        [sort: 'id', order: 'desc'])
                def sponsorships = course.sponsorships
                return [course  : course, tasks: tasks, students: students,
                        messages: messages, sponsorships: sponsorships]
            } else {
                flash.message = "Access to dashboard for ${course.subject} denied. Access is restricted to students and organisers."
                redirect controller: 'course', action: 'index'
            }
        } else {
            //flash.message = "No course was found with an id of ${params.id}"
            redirect controller: 'Course', action: 'index'
        }
    }

    def enrollStudents() {
        def course = Course.get(params.course.id)
        def notIn = new ArrayList<String>()
        notIn.add(course.teacher?.fullName)
        for (User user : course.students) {
            notIn.add(user.fullName)
        }
        def allUsers = User.findAllByFullNameNotInList(notIn)
        if (course && allUsers) {
            return [course: course, allUsers: allUsers, enrolled: course.students]
        }
    }

    def enroll() {
        def course = Course.get(params.courseid);
        course.refresh()
        def student = params.get('student');
        User user = User.findById(student)
        course.students.add(user)
        course.save()
        redirect(action: dashboard, 'id'  : course.id)
    }
}
