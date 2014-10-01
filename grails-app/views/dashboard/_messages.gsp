<h3>Forum Messages</h3>
<table>
<thead>
<tr>
<th>Author</th>
<th>Subject</th>
<th>Content</th>
</tr>
</thead>
<g:each in="${messages}" var="msg">
    <tr>
        <td>
            <g:link controller="user" action="show" id="${msg.author.id}">
                ${msg.author}
            </g:link>
        </td>
        <td>
            ${msg.subject}
        </td>
        <td>
            ${msg.content[0..Math.min(msg.content.size() -1, 24)]}
            ${msg.content.size() > 25 ? '...' : ''}
        </td>
    </tr>
</g:each>
</table>
<g:link controller="textMessage" action="index" id="${course.id}">
    View threaded messages for this event.
</g:link>