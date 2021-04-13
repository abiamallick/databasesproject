<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>
<%@page import="java.util.*" %>
<%
Random rand = new Random();
int n = rand.nextInt(5000);
%>




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
		
		//Get parameters from the HTML form at the index.jsp
		//int n = 1234;
		String input_Brand = request.getParameter("brand");
		Float input_Size = Float.valueOf(request.getParameter("size"));
		String input_Color = request.getParameter("color");
		String input_Type = request.getParameter("type");
		String input_Condition = request.getParameter("condition");
		Float input_InitialPrice = Float.valueOf(request.getParameter("initialprice"));
		
		
 		String insert = "INSERT INTO FOOTWEAR_ITEMS(footwear_item_id, Brand, Size, Color, item_Type, item_Condition, initial_price)"
				+ " VALUES ('" + n + "', '" + input_Brand + "', '" + input_Size + "', '" + input_Color + "', '" + input_Type + "', '" + input_Condition + "', '" + input_InitialPrice + "' )";
		PreparedStatement ps = con.prepareStatement(insert);
		ps = con.prepareStatement(insert); 
		ps.executeUpdate();
		
		

		
/* 		
		String insert = "INSERT INTO FOOTWEAR_ITEMS(footwear_item_id, Brand, Size, Color, item_Type, item_Condition, initial_price)" + 
		"VALUES (?, ?, ?. ?, ?, ?, ?)";
		out.print(insert);
		PreparedStatement ps = con.prepareStatement(insert);
		ps = con.prepareStatement(insert);
		ps.setInt(1, n);
		ps.setString(2, input_Brand);
		ps.setFloat(3, input_Size);
		ps.setString(4, input_Color);
		ps.setString(5, input_Type);
		ps.setString(6, input_Condition);
		ps.setFloat(7, input_InitialPrice);
		ps.executeUpdate(); */
		
		
		
		
		
		//ps = con.prepareStatement(insert); 

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
/* 		ps.setString(1, input_username);
		ps.setString(2, input_password);
		ps.setString(3, input_email); */
		//set strings are just for question marks
		
		//Run the query against the DB
		//Run the query against the DB
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Your new item has been added to the auction");
		
		
	} 
	catch (NumberFormatException e) {
		out.print("input a numerical value");
	}catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}

%>
</body>
</html>