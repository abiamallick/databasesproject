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
		<form action="QuestionKeyword.jsp" method="POST">
				<input type="text" name="questionAsked" id="questionAsked" placeholder="Enter question"> <br>
				<input type="submit" value="Search">
		</form>
	</div>
		<div id="searchbar">
   		<h2>Hi-Please post your question! A Customer Representative will answer as soon as possible.</h2>
		<form action="QuestionsAsked.jsp" method="POST">
				<input type="text" name="questionAsked" id="questionAsked" placeholder="Enter question to post"> <br>
				<input type="submit" value="Search">
		</form>
	</div>
</body>
</html>