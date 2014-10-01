package com.classplanner

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test toString"() {
        when: "a user has a fullName"
        def user = new User (fullName: 'Donald Duck')
        then: "the toString method will return the full name."
        user.toString() == 'Donald Duck'
    }
}
