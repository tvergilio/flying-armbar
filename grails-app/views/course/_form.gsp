<%@ page import="com.classplanner.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="course.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${courseInstance?.startDate}" years="${2014..2023}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'subject', 'error')} ">
	<label for="subject">
		<g:message code="course.subject.label" default="Subject" />
		
	</label>
	<g:textField name="subject" value="${courseInstance?.subject}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="course.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="5000" value="${courseInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'teacher', 'error')} required">
	<label for="teacher">
		<g:message code="course.teacher.label" default="Teacher" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="teacher" name="teacher.id" from="${com.classplanner.User.list()}" optionKey="id" required="" value="${courseInstance?.teacher?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="course.location.label" default="Location" />
		
	</label>
	<g:textField name="location" value="${courseInstance?.location}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'sponsorships', 'error')} ">
	<label for="sponsorships">
		<g:message code="course.sponsorships.label" default="Sponsorships" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${courseInstance?.sponsorships?}" var="s">
    <li><g:link controller="sponsorship" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="sponsorship" action="create" params="['course.id': courseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sponsorship.label', default: 'Sponsorship')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="course.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${courseInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['course.id': courseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'messages', 'error')} ">
	<label for="messages">
		<g:message code="course.messages.label" default="Messages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${courseInstance?.messages?}" var="m">
    <li><g:link controller="textMessage" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="textMessage" action="create" params="['course.id': courseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'textMessage.label', default: 'Text Message')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'respondents', 'error')} ">
	<label for="respondents">
		<g:message code="course.respondents.label" default="Respondents" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'students', 'error')} ">
	<label for="students">
		<g:message code="course.students.label" default="Students" />
		
	</label>
	<g:select name="students" from="${com.classplanner.User.list()}" multiple="multiple" optionKey="id" size="5" value="${courseInstance?.students*.id}" class="many-to-many"/>

</div>

