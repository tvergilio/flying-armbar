package com.classplanner

class Task {

    String title
    String notes
    User assignedTo
    Date dueDate
    Course course
    static constraints = {
        title blank: false
        notes blank: true, nullable: true, maxSize: 5000
        assignedTo nullable: true
        dueDate nullable: true
    }
    static belongsTo = Course
}
