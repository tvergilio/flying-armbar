<span style="text-align:center">
    <h1>${course}</h1>
</span>
<table>
    <tr>
        <td>
            Start Date: <g:formatDate format="dd/MMM/yyyy" date="${course.startDate}"/>
        </td>
        <td>
            <g:if test="${course.teacher}">
                Teacher: ${course.teacher}
            </g:if>
        </td>
    </tr>
    <tr>
        <td>
            Location: ${course.location}
        </td>
        <td>
            Number of students enrolled: ${course.students.size()}
        </td>
    </tr>
</table>