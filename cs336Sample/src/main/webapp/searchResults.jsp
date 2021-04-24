<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter"%>
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
	boolean hasEnded = false;
	boolean hasReserve= false;
	int auc = 0;
	%>

<%
try {

	//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the combobox from the index.jsp
		String practice = (String)session.getAttribute("user");
		LocalDateTime myDateObj = LocalDateTime.now();
		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
		String formattedDate = myDateObj.format(myFormatObj);
		String entity = request.getParameter("footwear_item_id");
		String auctionDate="";
		Double auctionReserve=0.0;
		Double auctionAmount = 0.0;
		
		
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT b.bid_username, au.auction_id, au.closing_date, au.initial_price_sells, b.bid_amount FROM Auctions au, BIDS b WHERE b.bid_amount = (SELECT Max(bid_amount) FROM bids WHERE bid_footwear_item_id = '" + entity + "') and au.initial_price_sells = (SELECT Min(initial_price_sells) FROM Auctions WHERE bid_footwear_item_id = '" + entity + "')";
		
		ResultSet result2 = stmt.executeQuery(str);
		
		while (result2.next()) {
			
			auctionDate = (result2.getString("closing_date"));
			auctionReserve = (result2.getDouble("initial_price_sells"));
			auctionAmount = (result2.getDouble("bid_amount"));
			auc = (result2.getInt("auction_id"));
			
		}
		
		if(auctionDate==formattedDate)
		{
			hasEnded=true;
		}
		else if(auctionDate.compareTo(formattedDate)<0)
		{
			hasEnded=true;
		}
		else if(auctionDate.compareTo(formattedDate)>0)
		{
			hasEnded=false;
		}
		
		
		if(auctionReserve==auctionAmount)
		{
			hasReserve=true;
		}
		else if(auctionReserve>auctionAmount)
		{
			hasEnded=true;
		}
		else if(auctionReserve<auctionAmount)
		{
			hasEnded=false;
		}
		
} catch (Exception e) {
	out.print(e);
}%>
<%        
try {

	//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the combobox from the index.jsp
		String practice = (String)session.getAttribute("user");
		LocalDateTime myDateObj = LocalDateTime.now();
		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
		String formattedDate = myDateObj.format(myFormatObj);
		String entity = request.getParameter("footwear_item_id");
		String auctionDate="";
		int status = 0;
		
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT bid_username, bid_amount FROM bids WHERE bid_amount = (SELECT Max(bid_amount) FROM bids WHERE bid_footwear_item_id = '" + entity + "')";
		


		ResultSet result2 = stmt.executeQuery(str);
		
		
		while (result2.next()) {
			
			String theItem = request.getParameter("footwear_item_id");
			
			

			String winner_username = (result2.getString("bid_username"));
			
			double winner_amount = (result2.getDouble("bid_amount"));
			
			//String auc_num = request.getParameter("auction_id");
			
			
			
			
			
			if(hasEnded==true && hasReserve==true)
			{
				status = 1;
				String insert3 = "INSERT INTO WINNER(w_username,w_amount,w_auction_id,w_footwear_id,status_winner)"
	  					+ " VALUES ('" + winner_username + "', '" + winner_amount + "','" + auc + "', '" + theItem + "', '" + status + "')";
				String update1 = "UPDATE footwear_items  SET sold=1 WHERE footwear_item_id = " + "'" + theItem + "'";
	  			PreparedStatement ps = con.prepareStatement(insert3);
				ps = con.prepareStatement(insert3); 
				ps.executeUpdate();
			}
			//out.print(auc);
			
		}
		
		
} catch (Exception e) {
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
	
	<div>
	<tr>
		<td><a href="AuctionHistory.jsp?bid_username=<%= result.getString("bid_username")%>"><%= result.getString("bid_username") %></a><td>
		
		<td><%= result.getString("bid_amount") %> <td>
		<td><td>
		
	</tr>	

				</div>
			
	<% }
	//close the connection.
	%>

</table>



<p>How would you like to bid:</p>

<table>
</table>

	<br>
		<form method="post" action="createBids.jsp">
		<table>
		 <tr>    
		<td>Bid Type</td><td><select name ="bidtype" size=1>
				<option value="Manual">Manual</option>
				<option value="Automatic">Automatic</option>
			</select>
		</tr>
		<tr>    
		<td>Bid Amount $</td><td><input type="text" name="manualbidamount"placeholder="Only for manual"></td>
		</tr>
		<tr> 
		<td>Bid Increment</td><td><input type="text" name="bidincrprice"placeholder="Only for automatic"></td>
		</tr>
		<tr> 
		<td>Bid Upper Limit</td><td><input type="text" name="bidUL"placeholder="Only for automatic"></td>
		</tr>
		
		
		</table>
		<input type="hidden" name="footwearid" value=<%=hi%>>
		<input type="submit" value="Place Bid!">
		</form>
	<br>
<div>

</div>

      
      
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
	
	String str2 = "SELECT f.title, f.footwear_item_id, f.size, f.sold, a.starting_date, a.closing_date, a.auction_user FROM footwear_items f JOIN Auctions a ON a.footwear_sells_id=f.footwear_item_id WHERE f.footwear_item_id != '" + entity + "' AND f.shoe_type = '" + ftype + "' AND date_format(a.closing_date, '%Y-%m')=date_format(now(), '%Y-%m') ORDER BY f.title";
	
	
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str2);
	
	
	%>

<table>
 <tr><td colspan=2 style="font-size:12pt;" align="center">
<h3>Similar Items</h3></td></tr>

</table>

<br>
			<div>
			  <tr>
			  	<th><b>Title&emsp;&ensp;&emsp;&ensp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</b></th>
			 
			    <th><b>&emsp;&ensp;&emsp;&ensp;&emsp;&emsp;&ensp;&emsp;&ensp;&emsp;Size&emsp;&ensp;&emsp;</b></th> 
			  <th><b>Starting Date&emsp;&ensp;&emsp;&ensp;&emsp;&emsp;</b></th>
			  <th><b>Closing Date &emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;</b></th>
			  <th><b>&emsp;&ensp;&emsp;Status</b></th>
			  	</tr>
			  </div>
<table style= ""width:50%">
	<%
	//parse out the results
	while (result.next()) { 
	%>
	<div>
	<tr>
	
		<td><a href="searchResults.jsp?footwear_item_id=<%= result.getInt("footwear_item_id") %>"><%= result.getString("f.title") %></a>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</td>
		<td> <%= result.getString("f.size") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
		<td> <%= result.getString("a.starting_date") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
		<td> <%= result.getString("a.closing_date") %> &emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</td>
		<% if (result.getString("sold").equals("1")){ %>
			<td>Sold</td>
		<% }else{ %>
			<td>Not Sold</td>
			<% } %>
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






      
