<%@ page import="com.classplanner.Sponsorship" %>



<div class="fieldcontain ${hasErrors(bean: sponsorshipInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="sponsorship.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${com.classplanner.Course.list()}" optionKey="id" required="" value="${sponsorshipInstance?.course?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sponsorshipInstance, field: 'sponsor', 'error')} required">
	<label for="sponsor">
		<g:message code="sponsorship.sponsor.label" default="Sponsor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sponsor" name="sponsor.id" from="${com.classplanner.Sponsor.list()}" optionKey="id" required="" value="${sponsorshipInstance?.sponsor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sponsorshipInstance, field: 'contributionType', 'error')} ">
	<label for="contributionType">
		<g:message code="sponsorship.contributionType.label" default="Contribution Type" />
		
	</label>
	<g:select name="contributionType" from="${sponsorshipInstance.constraints.contributionType.inList}" value="${sponsorshipInstance?.contributionType}" valueMessagePrefix="sponsorship.contributionType" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sponsorshipInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="sponsorship.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${sponsorshipInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sponsorshipInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="sponsorship.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="5000" value="${sponsorshipInstance?.notes}"/>

</div>

