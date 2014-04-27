import com.classplanner.Course
import com.classplanner.Sponsor
import com.classplanner.Sponsorship
import com.classplanner.User

class BootStrap {

    def init = {
        //servletContext ->
//        if (!Course.get(1)) {
//            new User(fullName: 'Aidan Curley',
//                    userName: 'acurley',
//                    password: 't0ps3cr3t',
//                    email: 'curley@aidansgroovyshop.com',
//                    website: 'blog.aidansgroovyshop.com',
//                    bio: '''Aidan has been teaching for over 10 years. He has
//worked in many different countries. In his spare time, Aidan
//runs and reads about whisky.''').save()
//            new User(fullName: 'Thalita Vergilio',
//                    userName: 'tvergilio',
//                    password: 't0ps3cr3t',
//                    email: 'thalita.vergilio@blah.com',
//                    website: 'www.thalita.org',
//                    bio: '''Thalita is a software developer. She likes working with new technologies. In her spare time, she does Brazilian jiu jitsu and reads about vikings.''').save()
//            def event1 = new Course(startDate: new Date(2014, 3, 13),
//                    subject: 'A raid on England',
//                    description: '''In 793, 'Northmen' (as the Anglo-Saxon Chronicle calls them) attacked the Christian monastery at Lindisfarne in Northumbria, in north-east England. Northumbria was an English kingdom, and its monasteries were famous for books, art and treasures. On a January day, the longships arrived and the Vikings attacked. They burned buildings, stole treasures, murdered monks, and terrified everyone. Some Christian Church leaders said the Vikings were sent by God, to punish people in England for doing wrong.''',
//                    teacher: User.findByFullName('Thalita Vergilio'),
//                    location: 'TBD')
//            if (!event1.save()) {
//                event1.errors.allErrors.each { error ->
//                    println "An error occured with event1: ${error}"
//                }
//            }
//            def event2 = new Course(startDate: new Date(2014, 3, 13),
//                    subject: 'Viking weapons',
//                    description: '''The Vikings fought using long swords and axes. A good sword was handed down from father to son, but Vikings also buried weapons with their owner when he died. Wood rots and metal rusts away after a thousand years or more in the ground, but some remains show what the weapons were like.Vikings did not wear much armour, though some chieftains wore mail coats. Most relied on a round wooden shield for protection. On their heads, they wore helmets made of leather or iron. A Viking saying was, 'Never leave your weapons behind when you go to work in the fields - you may need them'.''',
//                    teacher: User.findByFullName('Aidan Curley'),
//                    location: 'TBD')
//            if (!event2.save()) {
//                event2.errors.allErrors.each { error ->
//                    println "An error occured with event1: ${error}"
//                }
//            }
//            def g1 = Course.findBySubject('Viking weapons')
//            g1.addToStudents(new User(fullName: 'Sarah Martin',
//                    userName: 'sarah',
//                    password: '54321',
//                    email: 'sarah@martinworld.com',
//                    website: 'www.martinworld.com',
//                    bio: 'Web designer and History student.'))
//            g1.addToStudents(new User(fullName: 'Jeremy Wade',
//                    userName: 'fish_on',
//                    password: '12345',
//                    email: 'jwade@email.com',
//                    website: 'www.fishon.com',
//                    bio: 'Biologist and extreme angler.'))
//            g1.addToRespondents('ben@grailsmail.com')
//            g1.addToRespondents('zachary@linuxgurus.org')
//            g1.addToRespondents('solomon@bootstrapwelding.com')
//            def s1 = new Sponsor(name: 'Sleepy Fjord',
//                    website: 'http://www.sleepyfjord.com',
//                    description: 'Recycling for a greener world').save()
//            def s2 = new Sponsor(name: 'Kunst Designs',
//                    website: 'http://kunst.com',
//                    description: 'An innovative design Company'
//            ).save()
//            def sp1 = new Sponsorship(course: event1,
//                    sponsor: s1,
//                    contributionType: 'Other',
//                    description: 'Cool T-Shirts').save()
//            def sp2 = new Sponsorship(course: event1,
//                    sponsor: s2,
//                    contributionType: 'Cash',
//                    description: 'Will be paying towards the cost of the course.').save()
//            g1.save()
//        }
    }
    def destroy = {
    }
}
