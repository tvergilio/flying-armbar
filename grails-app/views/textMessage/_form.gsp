<%@ page import="com.classplanner.TextMessage" %>



<div class="fieldcontain ${hasErrors(bean: textMessageInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="textMessage.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subject" required="" value="${textMessageInstance?.subject}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: textMessageInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="textMessage.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="content" cols="40" rows="5" maxlength="2000" required="" value="${textMessageInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: textMessageInstance, field: 'parent', 'error')} ">
	<label for="parent">
		<g:message code="textMessage.parent.label" default="Parent" />
		
	</label>
	<g:select id="parent" name="parent.id" from="${com.classplanner.TextMessage.list()}" optionKey="id" value="${textMessageInstance?.parent?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: textMessageInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="textMessage.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${com.classplanner.User.list()}" optionKey="id" required="" value="${textMessageInstance?.author?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: textMessageInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="textMessage.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${com.classplanner.Course.list()}" optionKey="id" required="" value="${textMessageInstance?.course?.id}" class="many-to-one"/>

</div>

