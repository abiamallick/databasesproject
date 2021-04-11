<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected search item
			String entity = (request.getParameter("searchItem")).trim();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM footwear_items WHERE shoe_type like " + "'" + entity + "'";
            if(entity==null || entity.equals("")){
                str = "SELECT * FROM footwear_items";
            }
            //System.out.println(str);
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>
				<%if (entity.equals("heels"))
					out.print("Heels Available:");
				else if (entity.equals("sneakers"))
					out.print("Sneakers Available:");
				else if (entity.equals("sandals"))
					out.print("Sandals Available:");
            	else if ((entity==null || entity.equals("")))
            		out.print("All listings of footwear items.");
   	            else 
   	            	out.print("Please enter correct type of footwear item.");
	            
				%>
			</td>
		</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("title") %></td>
				</tr>
				

			<% }
			//close the connection.
			db.closeConnection(con);
			%>
		</table>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>