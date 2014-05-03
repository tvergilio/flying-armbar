<%@ page import="com.classplanner.TextMessage" %>
<!DOCTYPE html>
<html>
<head>
    <g:javascript library="jquery" />
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'textMessage.label', default: 'Text Message')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-textMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"
                    params='["course.id": "${course?.id}"]'><g:message
                    code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-textMessage" class="content scaffold-list" role="main">
    <h1>${course?.subject} - Forum Messages</h1>
    <div id="messageList">
        <g:messageThread messages="${textMessageInstanceList}" />
    </div>
    <h3>Message Details</h3>
    <div id="details">
    </div>
</div>
</body>
</html>
