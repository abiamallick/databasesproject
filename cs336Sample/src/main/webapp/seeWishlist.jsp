<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Wish List!</title>
</head>
<body>

<%
try {

	//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the combobox from the index.jsp
		String practice = (String)session.getAttribute("user");
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "Select * from wishlist WHERE wishlistUser = " + "'" + practice + "'";

		//out.println(str);
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
	%>
<table>	
 <tr><td colspan=2 style="font-size:12pt;" align="center">
<h3>Your Wish List</h3></td></tr>

</table>
<br>


<table>
	<%
	//parse out the results
	while (result.next()) { %>
	<tr>
	<td>
		<%= result.getString("shoe_type") %> 
		,
		<%= result.getString("size") %>
		,
		<%= result.getString("brand") %></td>
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