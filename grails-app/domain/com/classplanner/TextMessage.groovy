package com.classplanner

import com.classplanner.Course
import com.classplanner.User

class TextMessage {

    String subject
    String content
    TextMessage parent
    Course course
    User author
    static constraints = {
        subject blank: false
        content blank: false, maxSize: 2000
        parent nullable: true
        author nullable: false
    }
    static belongsTo = Course

    static findAllChildren (TextMessage msg) {
        return findAllWhere([parent: msg]);
    }

    String toString() {
        "$subject, $author"
    }
}
