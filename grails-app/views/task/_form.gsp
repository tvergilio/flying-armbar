<%@ page import="com.classplanner.Task" %>



<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="task.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${taskInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="task.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="5000" value="${taskInstance?.notes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'assignedTo', 'error')} ">
	<label for="assignedTo">
		<g:message code="task.assignedTo.label" default="Assigned To" />
		
	</label>
	<g:select id="assignedTo" name="assignedTo.id" from="${com.classplanner.User.list()}" optionKey="id" value="${taskInstance?.assignedTo?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'dueDate', 'error')} ">
	<label for="dueDate">
		<g:message code="task.dueDate.label" default="Due Date" />
		
	</label>
	<g:datePicker name="dueDate" precision="day"  value="${taskInstance?.dueDate}" years="${2014..2023}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="task.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${com.classplanner.Course.list()}" optionKey="id" required="" value="${taskInstance?.course?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'completed',
        'error')} ">
    <label for="completed">
        <g:message code="task.completed.label" default="Completed" />
    </label>
    <g:checkBox name="completed" value="${taskInstance?.completed}" />
</div>

