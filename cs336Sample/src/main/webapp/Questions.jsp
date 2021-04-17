<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post or Browse Questions</title>
</head>
<body>
		<div id="searchbar1">
   		<h2><a href="QuestionsDisplay.jsp"><%= "Click Here to see all questions and answers"%></a> or search by keyword below:</h2>
		<form action="QuestionsKeyword.jsp" method="POST">
				<input type="text" name="questionKeyword" id="questionKeyword" placeholder="Enter keywords to get relevant questions"> <br>
				<input type="submit" value="Search">
		</form>
	</div>
	
	<br>
	<br>
	<h1 style="font-size:2.5vw">Hi-Please post your question! A Customer Representative will answer as soon as possible.</h1>
	<br>
		<form method="post" action="QuestionsAsked.jsp">
		<table>
		<tr>    
		<td><u>Enter question here: </u></td> 
		</tr>
		<tr>
		<td><p><input type="text" name="questionAsked"placeholder="Enter question to post"></p></td>
		
		</table>
		<p>   </p>
		<input type="submit" value="Submit!">
		</form>
	<br>




</body>
</html>