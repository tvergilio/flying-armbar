package com.classplanner

class Sponsorship {

    Course course
    Sponsor sponsor
    String contributionType
    String description
    String notes
    static constraints = {
        course nullable: false
        sponsor nullable: false
        contributionType inList:["Other", "Field Trips", "A/V", "Books", "Cash", "Lab Material"]
        description nullable: true, blank: true
        notes nullable: true, blank: true, maxSize: 5000
    }
}
