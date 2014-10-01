<%--
  Created by IntelliJ IDEA.
  User: Thalita
  Date: 01/10/2014
  Time: 14:42
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Course Planner - Dashboard</title>
    <meta name="layout" content="main" />
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Home</a></li>
        <li><g:link class="create" controller="task" action="create">Create Task</g:link></li>
        <li><g:link controller="user" action="create" params="['course.id': params.get('id')]">Add Student</g:link></li>
        <li><g:link class="list" controller="sponsor" action="index"> All Sponsors</g:link></li>
    </ul>
</div>
<div id="course" style='margin:10px 10px 10px 10px'>
    <g:render template="course" model="${['course':course]}" />
</div>
<div id="tasks" style='margin:10px 10px 10px 10px'>
    <g:render template="tasks" model="${['tasks':tasks]}" />
</div>
<div id="students" style='margin:10px 10px 10px 10px'>
    <g:render template="students" model="${['students':students]}" />
</div>
<div id="messages" style='margin:10px 10px 10px 10px'>
    <g:render template="messages" model="${[messages:messages]}" />
</div>
<div id="sponsors" style='margin:10px 10px 10px 10px'>
    <g:render template="sponsors" model="${[sponsorships:sponsorships]}" />
</div>
</body>
</html>