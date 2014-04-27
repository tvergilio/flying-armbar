package com.classplanner



import spock.lang.*

/**
 *
 */
class TaskServiceSpec extends Specification {

        def setup() {
            new User(fullName: 'Tammy Tester', userName: 'tester',
                    email: 'tester@test.com', website: 'test.com',
                    bio: 'A test person').save()
        }

        def cleanup() {
        }

        void "test addDefaultTasks"() {
            when: "we pass an event to taskService.addDefaultTasks"
            def e = new Course(subject: 'Test Course',
                    location: 'TestCity, USA',
                    description: 'Test Description',
                    teacher: User.findByUserName('tester'),
                    startDate: new Date())
            taskService.addDefaultTasks(e)
            then: "the event will have 6 default tasks"
            e.tasks.size() == 6
        }
}
