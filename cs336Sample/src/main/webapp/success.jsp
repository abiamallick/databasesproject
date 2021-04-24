<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>



	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Successful Login</title>
	</head>

<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} 
    
    else {
%>
Welcome <%=session.getAttribute("user")%>  




<div  style='text-align:right'>
<a href='logout.jsp'>Log out</a>
</div>

<div  style='text-align:center'>
<a href='Sellers.jsp'>Sell</a>
</div>

<br>

<div  style='text-align:right'>
<a href='Alerts.jsp'>View Alerts Here</a>
</div>

<div  style='text-align:right'>
<a href='Questions.jsp'>Have Questions?</a>
</div>

<div  style='text-align:right'>
<a href='AuctionHistory.jsp?bid_username=<%=session.getAttribute("user")%>'>View Auction History</a>
</div>

<div style='text-align:right'>
<a href='seeWishlist.jsp'>Want to see your wishlist?</a>
</div>

<div id="searchbar">
   <h2>Hi! Select at least one search parameter</h2>
		<form action="itemSearch.jsp" method="GET">
		<label for="type">Are you looking for sneakers, boots, or heels?</label>
				<input type="text" name="shoe_type" id="shoe_type" placeholder="Enter shoe type"> <br>
				<input type="submit" value="Search">
			<label for="brand">Brand</label>
				<select name="brand" id="brand">
				<option value="" disabled selected hidden="true">Select brand</option>
				<option value="Nike">Nike</option>
				<option value="Adidas">Adidas</option>
				<option value="Reebok">Reebok</option>
				<option value="Under Armour">Under Armour</option>
				<option value="Vans">Vans</option>
				<option value="Converse">Converse</option>
				<option value="Uggs">Uggs</option>
				<option value="Sperry">Sperry</option>
				<option value="Bearclaw">Bearclaw</option>
				<option value="Hunter">Hunter</option>
				<option value="Doc Martens">Doc Martens</option>
				<option value="Crocs">Crocs</option>
			</select> 			
			<label for="size">Size</label>
				<select name="size" id="size">
				<option value="" disabled selected hidden="true">Select brand</option>
				<option value="4.0">4.0</option>
				<option value="4.5">4.5</option>
				<option value="5.0">5.0</option>
				<option value="5.5">5.5</option>
				<option value="6.0">6.0</option>
				<option value="6.5">6.5</option>
				<option value="7.0">7.0</option>
				<option value="7.5">7.5</option>
				<option value="8.0">8.0</option>
				<option value="8.5">8.5</option>
				<option value="9.0">9.0</option>
				<option value="9.5">9.5</option>
				<option value="10.0">10.0</option>
				<option value="10.5">10.5</option>
				<option value="11.0">11.0</option>
				<option value="11.5">11.5</option>
				<option value="12.0">12.0</option>
				
		</form>
	</div>
	

<br>


<%
    }
%>













