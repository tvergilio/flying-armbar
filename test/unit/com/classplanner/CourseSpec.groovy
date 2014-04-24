package com.classplanner

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Course)
class CourseSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test toString"() {
        when: "a course has a name and a startDate"
        def course = new Course(subject: 'Norse Mythology',
                startDate: new Date(2014, 4, 13),
                teacher: [fullName: 'John Doe']
                        as User)
        then: "the toString method will combine them."
        course.toString() == 'Norse Mythology, John Doe'
    }
}
