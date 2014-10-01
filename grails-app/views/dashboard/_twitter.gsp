<h3>Post Course Updates to Twitter</h3>
<g:form name="twitterForm" action="tweet" id="${course.id}">
    (No more than 140 characters)<br/>
    <textarea name="status" rows="3" columns="50" style="width:100%;
    height:60"></textarea>
    <br/>
    <input type="submit" value="Post to Twitter" />
</g:form>