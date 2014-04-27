package com.classplanner

import grails.transaction.Transactional

@Transactional
class TaskService {

    def serviceMethod() {

    }
    def addDefaultTasks(course) {
        if (course.tasks?.size() > 0)
            return //We only want to add tasks to a new course
        course.addToTasks new Task(title: 'Identify resources needed')
        course.addToTasks new Task(title: 'Get price / availability of materials')
        course.addToTasks new Task(title: 'Compile potential sponsor list')
        course.addToTasks new Task(title: 'Get syllabus approved')
        course.addToTasks new Task(title: 'Compile potential students list')
        course.addToTasks new Task(title: 'Design syllabus')
        course.save()
    }
}
