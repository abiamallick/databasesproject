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

			String entity = request.getParameter("question_id");
					ResultSet result = stmt.executeQuery("SELECT * FROM questions");
			
			 %>
			<%= "ALL QUESTIONS ASKED:"%>
			  
			  
			<% while (result.next()) { %>
			<table>
			<div>
				<tr>  
					<b><a href="CRepAnswers.jsp?question=<%= result.getString("question")%>&question_id=<%=result.getString("question_id")%>"><%= result.getString("question") %></a></b>
					<%= result.getString("answer") %>
				</tr>
				</div>
			</table>
			 	<% 	} %>
				
			
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
