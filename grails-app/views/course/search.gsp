<%@ page import="com.classplanner.Course" %>
<%--
  Created by IntelliJ IDEA.
  User: Thalita
  Date: 01/10/2014
  Time: 16:52
--%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Course Search Results</title>
</head>
<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Home</a></li>
    </ul>
</div>
<div id="list-tekEvent" class="content scaffold-list" role="main">
    <h1>Search Results</h1>
    <br />
    <ol class="property-list course">
        <g:if test="${courses}">
            <g:each in="${courses}" var="course">
                <li>
                    <g:link action="show" id="${course.id}">${Course.findById(course.id)}</g:link>
                </li>
            </g:each>
        </g:if>
        <g:else>
            <h3>No Matching Results Found</h3>
        </g:else>
    </ol>
</div>
</body>
</html>