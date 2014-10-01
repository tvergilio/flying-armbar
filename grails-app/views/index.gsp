<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Course Planner</title>
	</head>
	<body>
    <div id="welcome">
        <br />
        <h3>Welcome to Course Planner</h3>
        <p>This is a course planning application which will help us organise academic courses and keep track of lecturers and student interest.</p>
    </div>
    <div class="homeCell">
        <h3>Find a Course</h3>
        <p> If you are a student, you can see a list of courses here. If there is a course that you would be interested in attending, you can let the organisers know by registering your interest.</p>
        <span class="buttons" >
            <g:link controller="course" action="index">Find a Course</g:link>
        </span>
    </div>
    <div class="homeCell">
        <h3>Organize a Course</h3>
        <p>If you are a lecturer and you would like to organise a new course, you can register your project here. Once your course has gathered enough student interest, you can apply for departmental approval with the department of your choice.</p>
        <span class="buttons" >
            <g:link controller="course" action="create"> Organize a Course</g:link>
        </span>
    </div>
    <div class="homeCell">
        <h3>Sponsor a Course</h3>
        <p>If your business or organisation would like to get involved in education in our local community, then sponsoring an academic course can be a great way to
        let everyone know that you're there.</p>
        <span class="buttons" >
            <g:link controller="sponsor" action="create">Sponsor a Course</g:link>
        </span>
    </div>
    </body>
</html>