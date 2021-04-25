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
	String sorting_options=request.getParameter("sorting_options");
	String s = (String)session.getAttribute("query_result");
	String newQuery="";
	if (sorting_options.equals("by_item_condition")) {
		newQuery = s + " ORDER BY item_condition";
	}
	if (sorting_options.equals("by_price")) {
		newQuery = s + " ORDER BY initial_price";
	}
	if (sorting_options.equals("by_type")) {
		newQuery = s + " ORDER BY shoe_type";
	}
	ResultSet result = stmt.executeQuery(newQuery);
	%>
	<form action="itemSort.jsp" method="GET">
		<label for="sort">Sort by the following:</label>
			<label for="sorting_options"></label>
				<select name="sorting_options" id="sorting_options">
				<option value="" disabled selected hidden="true">Select sorting option</option>
				<option value="by_type">By Type</option>
				<option value="by_price">By Price</option>
				<option value="by_item_condition">By Item Condition</option>
				<input type="submit" value="Search">
			</select> 			
			  		</form>
<div>
			  <tr>
			  	<th><b>Title&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</b></th>
			 
			    <th><b>Brand&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</b></th> 
			    <th><b>Size&emsp;&emsp;&ensp;</b></th>
			    <th><b>Initial Price&emsp;&emsp;&emsp;</b></th>
			    <th><b>Item Condition&emsp;&emsp;&emsp;</b></th>
			  <th><b>Status&emsp;&emsp;&emsp;&emsp;&emsp;</b></th>
			  	</tr>
			  </div>
<table style= ""width:50%">
			  
			  <% while (result.next()) { %>
			<div>
				<tr>    
					<td><a href="searchResults.jsp?footwear_item_id=<%= result.getInt("footwear_item_id") %>&shoe_type=<%=result.getString("shoe_type")%>"><%= result.getString("title") %></a></td>
					<td><%= result.getString("brand") %></td>
					<td><%= result.getString("size") %></td>
					<td><%= result.getString("initial_price") %></td>
					<td><%= result.getString("item_condition") %></td>
					<% if (result.getString("sold").equals("1")){ %>
			<td>Sold</td>
		<% }else{ %>
			<td>Not Sold</td>
			<% } %>
				</tr>
				</div>
			
			 	<% 	} %>
			  </table>
	<a href='wishlist.jsp'>Don't see your item? Click here to add it to your wishlist!</a>
	<%  db.closeConnection(con);
	%>
	
</table>

<%} catch (Exception e) {
	out.print(e);
}
%>