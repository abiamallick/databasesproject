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

			String update="";
			
			if (request.getParameter("updated_email")!=null && request.getParameter("username")!=null) {
				String updated_email = request.getParameter("updated_email");
				String username = request.getParameter("username");
				//out.print(entity);
				
				update = "UPDATE USERS SET email = '" + updated_email + "' WHERE username = '" + username + "'";
				out.print("Account successfully updated.");
			}
			else if (request.getParameter("updated_pass")!=null && request.getParameter("username")!=null) {
				String updated_pass = request.getParameter("updated_pass");
				String username = request.getParameter("username");
				//out.print(entity);
				
				update = "UPDATE USERS SET user_password = '" + updated_pass + "' WHERE username = '" + username + "'";
				out.print("Account successfully updated.");
			}

			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(update);
			ps = con.prepareStatement(update); 
			
			//Run the query against the DB
			ps.executeUpdate();
			 %>
			
			  
			
			<a href="CRepHome.jsp"><%= "Click to return back to the customer rep home page."%></a>
			
		<% //close the connection.
			db.closeConnection(con);
		 }catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>
