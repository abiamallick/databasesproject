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
	
	String str2 = "SELECT * FROM USERS";
	
	
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str2);
	
	%>

<table>
 <tr><td colspan=2 style="font-size:12pt;" align="center">
<h3>USER ACCOUNT INFORMATION: SELECT A USER'S USERNAME, PASSWORD OR EMAIL TO UPDATE</h3></td></tr>

</table>

<br>
			<div>
			  <tr>
			  	<th><b>Username&emsp;&ensp;&emsp;&ensp;&ensp;</b></th>
			 
			    <th><b>&emsp;&ensp;&emsp;&ensp;Password&emsp;&ensp;&emsp;</b></th> 
			  <th><b>&ensp;&emsp;&ensp;&emsp;&emsp;Email&emsp;&ensp;&emsp;&ensp;&emsp;&emsp;</b></th>
			  	</tr>
			  </div>
<table style= ""width:50%">
	<%
	//parse out the results
	while (result.next()) { 
	%>
	<div>
	<tr>
	
		<td><a href="DeleteAccountUser.jsp?username=<%= result.getString("username") %>"><%= result.getString("username") %></a>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</td></a></td>
		<td> <%= result.getString("user_password") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
		<td> <%= result.getString("email") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
	
	</tr>	
	</div>
	<% } %>
	
	<%  db.closeConnection(con);
	%>
	
</table>

<%} catch (Exception e) {
	out.print(e);
}
%>