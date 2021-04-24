<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <h2>Hi! To update password of <%=request.getParameter("username")%>, please put in new password.</h2>
		<form action="UpdatedAccountSuccess.jsp" method="GET">
		<label for="type"></label>
				<input type="text" name="updated_pass" id="updated_pass" placeholder="Enter new password"> 
				<input type="hidden" name="username" value=<%=request.getParameter("username")%>>
				<input type="submit" value="Submit">
				
		</form>
	</div>
<br>

</body>
</html>