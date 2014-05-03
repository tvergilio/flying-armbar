<%@ page import="com.classplanner.TextMessage" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'textMessage.label', default: 'Forum Message')}"/>
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
                    code="default.new.label" args="[entityName]"/></g:link>
        </li>
    </ul>
</div>

<div id="list-textMessage" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="subject"
                              title="${message(code: 'textMessage.subject.label', default: 'Subject')}"/>

            <g:sortableColumn property="content"
                              title="${message(code: 'textMessage.content.label', default: 'Content')}"/>

            <th><g:message code="textMessage.parent.label" default="Parent"/></th>

            <th><g:message code="textMessage.author.label" default="Author"/></th>

            <th><g:message code="textMessage.course.label" default="Course"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${textMessageInstanceList}" status="i" var="textMessageInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${textMessageInstance.id}">${fieldValue(bean: textMessageInstance, field: "subject")}</g:link></td>

                <td>${fieldValue(bean: textMessageInstance, field: "content")}</td>

                <td>${fieldValue(bean: textMessageInstance, field: "parent")}</td>

                <td>${fieldValue(bean: textMessageInstance, field: "author")}</td>

                <td>${fieldValue(bean: textMessageInstance, field: "course")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${textMessageInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
