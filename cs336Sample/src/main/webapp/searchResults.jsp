<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Page</title>
</head>
<body>
	<%
	
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("footwear_item_id");
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM footwear_items WHERE footwear_item_id like " + "'" + entity + "'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			
			
			

			//parse out the results
			while (result.next()) {
				//make a row
				
				//Print out current bar or beer name:
				out.print("<table>");
			//make a row
			out.print("<tr>");
			//make a column
			
			//print out column header
			out.print("Item Title: ");
			out.print(result.getString("title"));
			out.print("<br>");
			
			//make a column
			
			out.print("Shoe Size: ");
			out.print(result.getString("size"));				
			out.print("<br>");
			//make a column
			
			out.print("Initial Price: $");
			out.print(result.getString("initial_price"));				
			out.print("<br>");
			
			
			out.print("Brand: ");
			out.print(result.getString("brand"));				
			out.print("<br>");

			out.print("Condition: ");
			out.print(result.getString("item_condition"));				
			out.print("<br>");
			
			out.print("Style: ");
			out.print(result.getString("style"));				
			out.print("<br>");
			
			out.print("Shoe Type: ");
			out.print(result.getString("shoe_type"));				
			out.print("<br>");
			}
			out.print("</table>");
			

	
		//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>




<%
try {

	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	String entity = request.getParameter("footwear_item_id");
	String str2 = "SELECT * FROM bids WHERE bid_footwear_item_id = " + "'" + entity + "'";
	
	int hi = Integer.parseInt(entity);
	
	//out.println(str);
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str2);
	%>
<table>	
 <tr><td colspan=2 style="font-size:12pt;" align="center">
<h3>Bids</h3></td></tr>

</table>
<br>


			<div>
			  <tr>
			  	<th><b>Title&emsp;&ensp;</b></th>
			 
			    <th><b>Brand</b></th> 
			  
			  	</tr>
			  </div>
<table style= ""width:50%">
	<%
	//parse out the results
	while (result.next()) { %>

	<tr>
		<td><%= result.getString("bid_username") %> <td>
		$
		<td><%= result.getString("bid_amount") %> <td>
	</tr>	

	<% }
	//close the connection.
	%>

</table>



<p>How would you like to bid:</p>

<div>
  <input type="radio" id="huey" name="manual" value="huey"
         checked>
  <label for="huey">Manual</label>
</div>

	<br>
		<form method="post" action="manualBid.jsp">
		<table>
		<tr>    
		<td>Bid Amount $</td><td><input type="text" name="manualbidamount"></td>
		</tr>
		</table>
		<input type="hidden" name="footwearid" value=<%=hi%>>
		<input type="submit" value="Place Bid!">
		</form>
	<br>
<div>
  <input type="radio" id="dewey" name="automatic" value="dewey">
  <label for="dewey">Automatic</label>
</div>

	<br>
		<form method="post" action="automaticBid.jsp">
		<table>
		<tr>    
		<td>Bid Increment $</td><td><input type="text" name="autobidincr"></td>
		</tr>
		<tr>    
		<td>Upper Limit $</td><td><input type="text" name="auto_upperlimit"></td>
		</tr>
		</table>
		<input type="submit" value="Place Bid!">
		</form>
	<br>

      
      
 <%    db.closeConnection(con);  %>
 
<%} catch (Exception e) {
	out.print(e);
}%>




<%
try {
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	String entity = request.getParameter("footwear_item_id");
	String ftype = request.getParameter("shoe_type");
	
	String str2 = "SELECT * FROM footwear_items WHERE footwear_item_id != " + "'" + entity + "' AND shoe_type = '" + ftype + "'";
	out.println(ftype);
	
	
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str2);
	
	
	%>

<table>	
 <tr><td colspan=2 style="font-size:12pt;" align="center">
<h3>Similar Items</h3></td></tr>

</table>
<br>


			
<table style= ""width:50%">
	<%
	//parse out the results
	while (result.next()) { 
	%>
	<tr>
	
		<td><a href="searchResults.jsp?footwear_item_id=<%= result.getInt("footwear_item_id") %>"><%= result.getString("title") %></a></td>
		
		<td>Size: <%= result.getString("size") %> <td>
	</tr>	
	<% }
	
	//close the connection.
	db.closeConnection(con);
	%>
</table>
<%} catch (Exception e) {
	out.print(e);
}
%>






      
