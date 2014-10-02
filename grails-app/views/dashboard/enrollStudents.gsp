<%--
  Created by IntelliJ IDEA.
  User: Thalita
  Date: 02/10/2014
  Time: 15:42
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Add Students</title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link controller="user" class="create" action="create"><g:message code="default.new.label"
                                                                                args=" "/></g:link></li>
    </ul>
</div>
<g:form controller="dashboard" action="enroll">
%{--<table>--}%
%{--<thead>--}%
%{--<tr>--}%
%{--<g:sortableColumn property="fullName"--}%
%{--title="${message(code: 'user.fullName.label', default: 'Full Name')}"/>--}%
%{--<g:sortableColumn property="bio" title="${message(code: 'user.bio.label', default: 'Bio')}"/>--}%
%{--<g:sortableColumn property="enroll" title="Enroll"/>--}%
%{--</tr>--}%
%{--</thead>--}%
%{--<tbody>--}%
%{--<g:each in="${allUsers}" status="i" var="userInstance">--}%
%{--<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--}%
%{--<td>${fieldValue(bean: userInstance, field: "fullName")}</td>--}%
%{--<td>${fieldValue(bean: userInstance, field: "bio")}</td>--}%
%{--<td><g:checkBox id="enrollchk" name="enroll" value="${enrolled.contains(userInstance)}"/></td>--}%
%{--</tr>--}%
%{--</g:each>--}%
%{--</tbody>--}%
%{--</table>--}%
    <g:if test="${allUsers}">
        <div class="fieldcontain" style="padding: 25px">
            <g:select name="student"
                      from="${allUsers}"
                      value="${students}"
                      optionKey="id"/>
            <input type="submit" value="Enroll" style="float: right"/>
            <input type="hidden" name='courseid' value="${params.course.id}"/>
        </div>
    </g:if>
</g:form>
</body>
</html>