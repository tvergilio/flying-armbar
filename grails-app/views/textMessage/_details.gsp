<div id="show-testMessage" class="content scaffold-show" role="main">
    <ol class="property-list testMessage">
        <g:if test="${textMessageInstance?.subject}">
            <li class="fieldcontain">
                <span id="subject-label" class="property-label"><g:message
                        code="textMessage.subject.label" default="Subject" /></span>
                <span class="property-value" aria-labelledby="subject-label">
                    <g:fieldValue bean="${textMessageInstance}" field="subject"/></span>
            </li>
        </g:if>
    <g:if test="${textMessageInstance?.content}">
        <li class="fieldcontain">
            <span id="content-label" class="property-label"><g:message
                    code="textMessage.content.label" default="Content" /></span>
            <span class="property-value" aria-labelledby="content-label">
                <g:fieldValue bean="${textMessageInstance}" field="content"/></span>
        </li>
    </g:if>
    <g:if test="${textMessageInstance?.author}">
        <li class="fieldcontain">
            <span id="author-label" class="property-label"><g:message
                    code="textMessage.author.label" default="Author" /></span>
            <span class="property-value" aria-labelledby="author-label">
                <g:link controller="User" action="show"
                        id="${textMessageInstance?.author?.id}">
                    ${textMessageInstance?.author?.encodeAsHTML()}
                </g:link></span>
        </li>
    </g:if>
</ol>
    <g:form>
        <fieldset class="buttons">
            <g:link class="create" action="reply"
                    resource="${textMessageInstance}">Reply</g:link>
        </fieldset>
    </g:form>
</div>