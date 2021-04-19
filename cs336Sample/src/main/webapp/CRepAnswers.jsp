<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%  try {
	//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Create a SQL statement

			String entity = request.getParameter("question");
			
			out.print(entity);
			
			 %>
			
			  
			  
			<form action="CRepAnswerInsert.jsp?question_id=<%=request.getParameter("question_id")%>" method="GET">
		<label for="type">Submit answer to question below</label>
				<input type="text" name="q_answer" id="q_answer" placeholder="Enter answer to user's question"> <br>
				<input type="hidden" name="questionid" value=<%=request.getParameter("question_id")%>>
				<input type="submit" value="Submit">
				</form>
			<a href="CRepHome.jsp"><%= "Return back to the customer rep home page."%></a>
			
		<% //close the connection.
			db.closeConnection(con);
		 }catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>

</body>
</html>
