<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <h2>Hi! To update email of <%=request.getParameter("username")%>, please put in new email.</h2>
		<form action="UpdatedAccountSuccess.jsp" method="GET">
		<label for="type"></label>
				<input type="text" name="updated_email" id="updated_email" placeholder="Enter new email"> 
				<input type="hidden" name="username" value=<%=request.getParameter("username")%>>
				<input type="submit" value="Submit">
				
		</form>
	</div>
<br>

</body>
</html>