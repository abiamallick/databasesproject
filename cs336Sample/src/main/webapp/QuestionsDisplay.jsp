<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%  try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			StringBuilder searchQuery = new StringBuilder("");
		
					ResultSet result = stmt.executeQuery("SELECT * FROM questions");
			
			 %>
			
			<div>
			  <tr>
			    <th>&emsp;&emsp;&emsp;&emsp;Title&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</th>
			    <th>Brand&emsp;&emsp;&emsp;</th> 
			    <th>Size&emsp;&emsp;</th>
			    <th>Initial Price&emsp;&emsp;&emsp;&emsp;&emsp;</th>
			  </tr>
			  </div>
			  
			  
			<% while (result.next()) { %>
			<table>
			<div>
				<tr>    
					<td>result.getString("title")</td>
					<td><%= result.getString("brand") %></td>
					<td><%= result.getString("size") %></td>
					<td><%= result.getString("initial_price") %></td>
				</tr>
				</div>
			</table>
			 	<% 	}
				
			//close the connection.
			db.closeConnection(con);
			

			
		
		 }catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>

</body>
</html>