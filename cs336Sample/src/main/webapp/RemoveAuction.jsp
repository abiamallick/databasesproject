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
	
	String str2 = "SELECT * FROM Auctions";
	
	
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str2);
	
	%>

<h3>AUCTION INFORMATION: SELECT AN AUCTION ID TO DELETE AN AUCTION</h3>



<br>
			
			  	<th><b>Auction Id&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&ensp;&emsp;&ensp;</b></th>
			    <th><b>Footwear Item Id&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</b></th> 
			  <th><b>User for Auction&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</b></th>
			  <th><b>Starting Date&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&ensp;&emsp;&ensp;&ensp;&emsp;&ensp;</b></th>
			    <th><b>Closing Date&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</b></th> 
			  	
<table style= ""width:50%">
	<%
	//parse out the results
	while (result.next()) { 
	%>
	<div>
	<tr>
	
		<td><a href="RemoveAuctionInfo.jsp?auction_id=<%= result.getString("auction_id")%>"><%= result.getString("auction_id")%></a>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</td></a></td>
		<td> <%= result.getString("footwear_sells_id") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
		<td> <%= result.getString("auction_user") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
				<td> <%= result.getString("starting_date") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
		<td> <%= result.getString("closing_date") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
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