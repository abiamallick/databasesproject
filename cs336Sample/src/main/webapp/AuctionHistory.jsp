<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<html>
<body>
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
	String bid_username = request.getParameter("bid_username");
	String str2 = "SELECT b.bid_username, f.title, a.starting_date, a.closing_date, f.sold FROM Bids b JOIN footwear_items f ON b.bid_footwear_item_id=f.footwear_item_id JOIN Auctions a ON f.footwear_item_id=a.footwear_sells_id WHERE b.bid_username='" + bid_username + "'";
	
	//out.println(str);
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str2);
	%>

 <tr><td colspan=2 style="font-size:12pt;" align="center">
<h3>Auction History</h3></td></tr>


<br>


			
			  <tr>
			  	<th><b>Title&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&emsp;&ensp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</b></th>
			 
			    <th><b>Starting Date&emsp;&ensp;&emsp;&ensp;</b></th> 
			    <th><b>Closing Date&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</b></th>
			 
			    <th><b>Status</b></th> 
			  
			  	</tr>
			  <table>
<table style= ""width:50%">
	<%  while (result.next()) { %>
	<div>
	<tr>
		<td><%= result.getString("f.title") %></a></td>
		
		<td><%= result.getString("a.starting_date") %> </td>
		<td><%= result.getString("a.closing_date") %></a></td>
		<% if (result.getString("f.sold").equals("1")){ %>
			<td>Sold</td>
		<% }else{ %>
			<td>Not Sold</td>
			<% } %>
	</tr>	

				</div>
			
	<% } %>
	</table>
			<%  db.closeConnection(con);

			
		
		 }catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>
