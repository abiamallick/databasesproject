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
	db.closeConnection(con);
	%>

</table>


<p>How would you like to bid?</p>

      <script type="text/javascript">
        function manual() { 
        	document.getElementById('area').style.display = 'block'; 
        	}
        function automatic() { 
        	document.getElementById('area2').style.display = 'block'; 
        	}
        function isautomatic(){
        	if onclick=="manual();"
        }
       
      </script>       
     
      
      <form name="radios">
        <INPUT TYPE=RADIO NAME="X" VALUE="H" onclick="manual();"/>Manual 
        <INPUT TYPE=RADIO NAME="X" VALUE="L" onclick="automatic();"/>Automatic 
        <TEXTAREA id="area" style="display: none;" NAME="data" ROWS=10 COLS=50></TEXTAREA>   
        <TEXTAREA id="area2" style="display: none;" NAME="data" ROWS=15 COLS=30></TEXTAREA> 
      </form>
      
     <br>
      <br>
      
      
      
 
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
	
	String str2 = "SELECT * FROM footwear_items WHERE footwear_item_id != " + "'" + entity + "'";
	
	//out.println(str);
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
	while (result.next()) { %>
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






      
