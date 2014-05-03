<%@ page import="com.classplanner.TextMessage" %>

<g:if test="${textMessageInstance?.parent}">
    <div class="fieldcontain ${hasErrors(bean: textMessageInstance,
            field: 'parent', 'error')} ">
        <label for="parent">
            In Reply to:
        </label>
        ${textMessageInstance?.parent?.author}
    </div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: textMessageInstance,
        field: 'subject', 'error')} required">
    <label for="subject">
        <g:message code="textMessage.subject.label" default="Subject" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="subject" class="messageField" required=""
                 value="${textMessageInstance?.subject}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: textMessageInstance,
        field: 'content', 'error')} required">
    <label for="content">
        <g:message code="textMessage.content.label" default="Content" />
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="content" class="messageField" cols="40" rows="5"
                maxlength="2000" required="" value="${textMessageInstance?.content}"/>
</div>

%{--<g:hiddenField name="course.id" value="${textMessageInstance?.course.id}"/>--}%
<g:if test="${!params.id && !textMessageInstance?.parent?.id}">
<div class="fieldcontain ${hasErrors(bean: textMessageInstance, field: 'course', 'error')} required">
<label for="course">
    <g:message code="textMessage.course.label" default="Course"/>
    <span class="required-indicator">*</span>
</label>
<g:select id="course" name="course.id" from="${com.classplanner.Course.list()}" optionKey="id" required=""
          value="${textMessageInstance?.course?.id}" class="many-to-one"/>
</div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: textMessageInstance, field: 'author', 'error')} required">
    <label for="author">
        <g:message code="textMessage.author.label" default="Author"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="author" name="author.id" from="${com.classplanner.User.list()}" optionKey="id" required=""
              value="${textMessageInstance?.author?.id}" class="many-to-one"/>

</div>

<g:if test="${params.id && textMessageInstance?.parent?.id}">
<g:hiddenField name="course_id" value="${params.course_id}"/>
%{--<g:if test="${textMessageInstance?.course?.id}">--}%
    %{--<g:hiddenField name="course_id" value="${textMessageInstance?.course?.id}"/>--}%
%{--</g:if>--}%
<g:hiddenField name="parent" value="${textMessageInstance?.parent?.id}"/>
<g:hiddenField name="course" value="${textMessageInstance?.parent?.course?.id}"/>
</g:if>
