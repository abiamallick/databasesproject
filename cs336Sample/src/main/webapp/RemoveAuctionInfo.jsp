<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<%
	try {

		//Get the database connection
		//ApplicationDB db = new ApplicationDB();	
		//Connection con = db.getConnection();

		//Create a SQL statement
		//Statement stmt = con.createStatement();
		Class.forName("com.mysql.jdbc.Driver");
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
	    Statement st = con.createStatement();
		//Get parameters from the HTML form at the index.jsp
		String auction_id = request.getParameter("auction_id");

		
		String insert = "Delete FROM Auctions WHERE auction_id='" + auction_id + "'";
		
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		ps = con.prepareStatement(insert); 
		
		//Run the query against the DB
		ps.executeUpdate();
		

		//Run the query against the DB
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Auction has been successfully deleted." ); %>

		  <a href="CRepHome.jsp"><%= "Click to return back to the customer rep home page."%></a>
		
		
	<% } catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>