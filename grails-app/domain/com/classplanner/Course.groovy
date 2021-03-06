package com.classplanner

class Course {
    Date startDate
    String subject
    String description
    User teacher
    String location
    static hasMany = [students : User, respondents: String, sponsorships: Sponsorship, tasks: Task, messages: TextMessage]
    static searchable = true
    static constraints = {
        startDate()
        subject unique: true
        description maxSize: 5000
        teacher()
        location()
        sponsorships nullable: true
        tasks nullable: true
        messages nullable: true
    }

    String toString() {
        "$subject, $teacher"
    }

}
