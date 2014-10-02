<%--
  Created by IntelliJ IDEA.
  User: Thalita
  Date: 02/10/2014
  Time: 10:34
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Contact Us</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="content scaffold-create">
    <div style="padding: 20px">
        <h3>Contact Us</h3>
        <g:form name="mailForm" action="send">
            <div class="fieldcontain">
                <label>
                    <g:message code="name" default="Name"/>
                </label>
                <g:textField name="name" value="${params.name}"/>

            </div>

            <div class="fieldcontain">
                <label>
                    <g:message code="email" default="E-mail address"/>
                </label>
                <g:textField name="email" value="${params.email}"/>

            </div>

            <div class="fieldcontain">
                <label for="subject">
                    <g:message code="course.subject.label" default="Subject"/>

                </label>
                <g:textField name="subject" value="${params.subject}"/>

            </div>

            <div class="fieldcontain">
                <label for="body">
                    <g:message code="message" default="Message"/>
                </label>
                <g:textArea name="body" value="${params.body}" columns="30"
                            style="display: block;	margin-left: 26%; width:50%;height:60"/>
            </div>
            <br/>
            <input type="submit" value="Send" style="float: right"/>
        </g:form>
    </div>
</div>
</body>
</html>