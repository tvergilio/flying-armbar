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


