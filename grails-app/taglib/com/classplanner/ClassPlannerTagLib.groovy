package com.classplanner

class ClassPlannerTagLib {
    //static encodeAsForTags = [tagName: 'raw']
    def messageThread = {attrs ->
        def messages = attrs.messages.findAll{msg -> !msg.parent}
        processMessages(messages, 0)
    }
    void processMessages(messages, indent){
        messages.each{ msg ->
            def body = "${msg?.author} - ${msg?.subject}"
            out << "<p style='height:35; margin-left:${indent * 20}px;'>"
            out << "${remoteLink(action:'showDetail', id:msg.id, update:'details', body)}"
            out << "</p>"
            def children = TextMessage.findAllChildren(msg)
            if (children){
                processMessages(children, indent + 1)
            }
        }
    }
    def loginToggle = {
        out << "<div style='margin: 15px 0 40px;'>"
        if (request.getSession(false) && session.user){
            out << "<span style='float:left; margin-left: 15px; color: #48802c;'>"
            out << "Welcome ${session.user}."
            out << "</span><span style='float:right;margin-right:15px'>"
            out << "<a href='${createLink(controller:'User', action:'logout')}'>"
            out << "Logout </a></span>"
        } else{
            out << "<span style='float:right;margin-right:10px'>"
            out << "<a href='${createLink(controller:'User', action:'login')}'>"
            out << "Login </a></span>"
        }
        out << "</div><br/>"
    }

    def teacherCourses = {
        if (request.getSession(false) && session.user){
            def courses = Course.findAllByTeacher(session.user)
            if (courses){
                out << "<div style='margin-left:25px; margin-top:25px; width:85%'>"
                out << "<h3>Courses you are teaching:</h3>"
                out << "<ol>"
                courses.each{
                    out << "<li><a href='"
                    out << "${createLink(controller:'course',action:'show',id:it.id)}'>"
                    out << "${it}</a></li>"
                }
                out << "</ol>"
                out << "</div>"
            }
        }
    }

    def studentCourses = {
        if (request.getSession(false) && session.user){
            def courses = Course.createCriteria().list{
                students{
                    eq('id', session.user?.id)
                }
            }
            if (courses){
                out << "<div style='margin-left:25px; margin-top:25px; width:85%'>"
                out << "<h3>Courses you have enrolled for:</h3>"
                out << "<ul>"
                courses.unique().each(){
                    out << "<li><a href='"
                    out << "${createLink(controller:'course',action:'show',id:it.id)}'>"
                    out << "${it}</a></li>"
                }
                out << "</ul>"
                out << "</div>"
            }
        }
    }
}
