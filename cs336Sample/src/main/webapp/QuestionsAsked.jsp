<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		//String input_username = request.getParameter("username");
		
		String input_username = (String)session.getAttribute("user");
		String input_question = request.getParameter("questionAsked");
		String input_answer =  "Customer representative will answer soon";

		
		
		String insert = "INSERT INTO Questions(q_username, question, answer)"
				+ " VALUES ('" + input_username + "', '" + input_question + "', '" + input_answer + "' )";
		
		
		//out.println(insert);
		PreparedStatement ps;
		ps = con.prepareStatement(insert); 
		out.print("Your question has been successfully submitted and will be answered shortly.");


		ps.executeUpdate();

		con.close();
		out.println("<a href='success.jsp'>   click here to go back to the home page </a>");
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Please enter a valid question.");
	}
%>
</body>
</html>