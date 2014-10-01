<h3>Students</h3>
<table>
<thead>
<tr>
<th>Name</th>
<th>Email Address</th>
<th>Web Site</th>
</tr>
</thead>
    <g:each in="${students}" var="student">
        <tr>
            <td>
                <g:link controller="user" action="show" id="${student.id}">
                    ${student.fullName}
                </g:link>
            </td>
            <td>
                <a href="mailto:${student.email}">
                    ${student.email}
                </a>
            </td>
            <td>
                <a href="http://${student.website}">
                    ${student.website}
                </a>
            </td>
        </tr>
    </g:each>
</table>