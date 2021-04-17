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
	ApplicationDB db = new ApplicationDB();	
	//Connection con = db.getConnection();	
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Projectfirst","root", "Aniagutowska1");

	//Create a SQL statement
	Statement stmt = con.createStatement();
			//Create a SQL statement
			
	
			//Create a SQL statement

			String entity = request.getParameter("question_id");
					ResultSet result = stmt.executeQuery("SELECT * FROM questions");
			
			 %>
			
			  
			  
			<% while (result.next()) { %>
			<table>
			<div>
				<tr>    
					<b><%= result.getString("question") %></b>
					<%= result.getString("answer") %>
				</tr>
				</div>
			</table>
			 	<% 	} %>
				
			<%= "ALL QUESTIONS ASKED:"%>
			<br>
			<br>
			<div  style='text-align:right'>
			<a href="CRepHome.jsp"><%= "Return back to the cutomer rep home page."%></a>
			</div>
		<% //close the connection.
			db.closeConnection(con);
		 }catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>

</body>
</html>
