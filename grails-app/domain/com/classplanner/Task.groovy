package com.classplanner

class Task {

    String title
    String notes
    User assignedTo
    Date dueDate
    Course course
    Boolean completed
    static constraints = {
        title blank: false
        notes blank: true, nullable: true, maxSize: 5000
        assignedTo nullable: true
        dueDate nullable: true
        completed nullable: true
    }
    static belongsTo = Course
}
