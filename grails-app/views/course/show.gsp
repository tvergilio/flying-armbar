
<%@ page import="javax.servlet.RequestDispatcher; com.classplanner.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
        <g:javascript library="jquery" />
        <r:require module="jquery-ui" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="list" controller="dashboard" action="dashboard" id="${courseInstance.id}"> Course Dashboard</g:link></li>
                <li><g:enrolButton courseId="${courseInstance.id}" /></li>
			</ul>
		</div>
		<div id="show-course" class="content scaffold-show" role="main">
			<h1>${courseInstance.subject}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list course">
			
				<g:if test="${courseInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="course.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate format='dd MMMM yyyy' date="${courseInstance?.startDate}" /></span>
					
				</li>
				</g:if>

				<g:if test="${courseInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="course.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${courseInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.teacher}">
				<li class="fieldcontain">
					<span id="teacher-label" class="property-label"><g:message code="course.teacher.label" default="Teacher" /></span>
					
						<span class="property-value" aria-labelledby="teacher-label"><g:link controller="user" action="show" id="${courseInstance?.teacher?.id}">${courseInstance?.teacher?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="course.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${courseInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.sponsorships}">
				<li class="fieldcontain">
					<span id="sponsorships-label" class="property-label"><g:message code="course.sponsorships.label" default="Sponsorships" /></span>
					
						<g:each in="${courseInstance.sponsorships}" var="s">
						<span class="property-value" aria-labelledby="sponsorships-label"><g:link controller="sponsorship" action="show" id="${s.id}">${s?.sponsor.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

				%{--<g:if test="${courseInstance?.messages}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="messages-label" class="property-label"><g:message code="course.messages.label" default="Messages" /></span>--}%
					%{----}%
						%{--<g:each in="${courseInstance.messages}" var="m">--}%
						%{--<span class="property-value" aria-labelledby="messages-label"><g:link controller="textMessage" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>--}%
						%{--</g:each>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			
				<g:if test="${courseInstance?.respondents}">
				<li class="fieldcontain">
					<span id="respondents-label" class="property-label"><g:message code="course.respondents.label" default="Respondents" /></span>
					
						<span class="property-value" aria-labelledby="respondents-label"><g:fieldValue bean="${courseInstance}" field="respondents"/></span>
					
				</li>
				</g:if>

                <g:if test="${courseInstance?.tasks}">
                    <li class="fieldcontain">
                        <span id="tasks-label" class="property-label"><g:message
                                code="courseEvent.tasks.label" default="Tasks" /></span>
                        <g:each in="${courseInstance.tasks}" var="t">
                            <span class="property-value" aria-labelledby="tasks-label">
                                <g:link controller="task" action="show"
                                        id="${t.id}">${t.title}</g:link></span>
                        </g:each>
                    </li>
                </g:if>

                <g:if test="${courseInstance?.messages}">
                    <li class="fieldcontain">
                        <span id="messages-label" class="property-label"><g:message
                                code="course.messages.label" default="Messages" /></span>
                        <span class="property-value" aria-labelledby="messages-label">
                            <g:link controller="textMessage" action="index"
                                    id="${courseInstance.id}">
                                View Messages
                            </g:link></span>
                    </li>
                </g:if>
			
				<g:if test="${courseInstance?.students}">
				<li class="fieldcontain">
					<span id="students-label" class="property-label"><g:message code="course.students.label" default="Students" /></span>
					
						<g:each in="${courseInstance.students}" var="s">
						<span class="property-value" aria-labelledby="students-label"><g:link controller="user" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:courseInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${courseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <g:set var="msgEntityName" value="${message(code: 'textMessage.label', default: 'Forum Message')}"/>
                    <g:link controller="textMessage" action="create" params= "${[course_id:courseInstance.id]}"><g:message code="default.new.label" args="[msgEntityName]"></g:message></g:link>
                </fieldset>
			</g:form>
		</div>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#enrolDialog').hide();
            $( "#enrolButton" ).click(function() {
                $("#enrolDialog").dialog({
                    resizable: false,
                    height:180,
                    width: 420,
                    modal: false,
                    buttons: {
                        "Submit": function() {
                            $.ajax({
                                type: "post",
                                dataType: "html",
                                url: "${g.createLink(action:'enrol')}",
                                async: false,
                                data: $("#enrolForm").serialize(),
                                success: function (response, status, xml) {
                                    $("#enrolSpan").html(response);
                                }
                            });
                            $(this).dialog("close");
                        },
                        Cancel: function() {
                            $(this).dialog( "close" );
                        }
                    }
                });
            });
        });
    </script>
    <div id="enrolDialog" title="Student enrolment for ${courseInstance.subject}">
        <g:form name="enrolForm" action="enrol">
            <g:hiddenField name="id" value="${courseInstance.id}" />
            <p>Are you sure you would like to enrol for the ${courseInstance.subject} course?</p>
        </g:form>
    </div>
	</body>
</html>
