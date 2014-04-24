package com.classplanner


class User {
    static mapping = {
        table '`user`' // or 'users'
    }
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
