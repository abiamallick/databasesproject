<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<style>

.tab1{
tab-size=50;
}



table, th, td {
  border: 1px solid black;
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
	
	String str2 = "SELECT * FROM USERS";
	
	
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str2);
	
	%>

 <tr><td colspan=2 style="font-size:12pt;" align="center">
<h3>USER ACCOUNT INFORMATION: SELECT A USER'S USERNAME TO DELETE</h3></td></tr>


<br>
			<div>
			  <tr>
			  	<th><b>Username&emsp;&ensp;&emsp;&ensp;&ensp;&ensp;&emsp;&ensp;&ensp;&ensp;&emsp;&ensp;&ensp;</b></th>
			 
			    <th><b>&emsp;&ensp;&emsp;&ensp;Password&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&ensp;</b></th> 
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