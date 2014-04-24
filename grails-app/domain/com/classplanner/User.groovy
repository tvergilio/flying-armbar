package com.classplanner

class User {
    String fullName
    String userName
    String password
    String email
    String website
    String bio
    static belongsTo = [Course]
    String toString() { fullName }
    static constraints = {
        fullName()
        userName()
        email()
        website()
        bio maxSize:5000
    }
}
