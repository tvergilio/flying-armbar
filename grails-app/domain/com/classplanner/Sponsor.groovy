package com.classplanner

class Sponsor {
    String name
    String website
    String description
    byte[] logo
    static hasMany = [sponsorships : Sponsorship]
    static belongsTo = [Course]
    String toString(){
        name
    }
    static constraints = {
        name blank: false, unique: true
        website blank: false, url: true
        description nullable: true, maxSize: 5000
        logo nullable: true, maxSize: 1000000
        sponsorships nullable: true
    }
}
