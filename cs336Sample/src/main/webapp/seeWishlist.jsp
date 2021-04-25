
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
<body bgcolor="#53649E"></body>
<body>
<style>

.tab1{
tab-size=50;
}



table, th, td {
  border: 4px solid black;
  border="1"
  border-collapse: collapse;
  padding: 10px;
}
th, td {
padding: 30px;
}
</style>

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

 <tr><td colspan=2 style="font-size:12pt;" align="center">
<h3>Your Wish List</h3></td></tr>
<table style="background-color:#667AC0">
<tr>
	<th>Footwear Item Type: &emsp;&ensp;&emsp;&ensp;</th>
	&emsp;&ensp;&emsp;&ensp;
	<th>Footwear Item Size: &emsp;&ensp;&emsp;&ensp;</th>
	&emsp;&ensp;&emsp;&ensp;
	<th>Footwear Item Brand:</th>
</tr>



	<%
	//parse out the results
		while (result.next()) { 
	%>

<tr>
    <td><%= result.getString("shoe_type") %> </td>
    <td><%= result.getString("size") %> </td>
    <td><%= result.getString("brand") %> </td>
</tr>

	<% }
	//close the connection.
	db.closeConnection(con);
	%>

</table>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<a href="success.jsp"><%= "Click to return back to the home page."%></a>
	
<%} catch (Exception e) {
	out.print(e);
}%>
</body>
</html>