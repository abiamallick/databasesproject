<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alerts Page</title>
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
	int footwear_idno = 1001;
	//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
	String str = "SELECT a.alert_message, f.title FROM ALERTS a, footwear_items f WHERE a.alert_username = " + "'" + practice + "' And  f.footwear_item_id= '" + footwear_idno + "'";

	//out.println(str);
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str);
	%>
<table>	
 <tr><td colspan=2 style="font-size:12pt;" align="center">
<h3>Your Alerts</h3></td></tr>

</table>
<br>


<table>
	<%
	//parse out the results
	while (result.next()) { %>
	<tr>
		<td><%= result.getString("a.alert_message") %> <td>
		in regards to
		<td><%= result.getString("f.title") %> <td>
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
