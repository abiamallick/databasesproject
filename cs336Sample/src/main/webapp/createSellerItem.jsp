<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat.*" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
String input_ShoeType="";
Double input_Size = 0.0;
String input_Brand ="";

%>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//Get parameters from the HTML form at the index.jsp
		//int n = 1234;
		input_ShoeType = request.getParameter("type");
		input_Size = Double.valueOf(request.getParameter("size"));
		String input_Condition = request.getParameter("condition");
		String input_Style = request.getParameter("style");
		Double input_InitialPrice = 0.0;
		if(request.getParameter("initialprice").equals(""))
		{
			input_InitialPrice=0.0;
		}
		else
		{
			input_InitialPrice = Double.valueOf(request.getParameter("initialprice"));
		}
		input_Brand = request.getParameter("brand");
		String input_Title = request.getParameter("title");
		int sold_type = 0;
		
		
 		String insert1 = "INSERT INTO FOOTWEAR_ITEMS(shoe_type,size,item_condition,style,initial_price,brand,title, sold)"
				+ " VALUES ('" + input_ShoeType + "', '" + input_Size + "', '" + input_Condition + "', '" + input_Style + "', '" + input_InitialPrice + "', '" + input_Brand + "', '" + input_Title + "', '" + sold_type + "'  )";
		PreparedStatement ps1 = con.prepareStatement(insert1);
		ps1 = con.prepareStatement(insert1); 
		ps1.executeUpdate();
		
		
		
//////////////FOR SELLS TABLE NOW //////////////////////////
		
		
		Random rand = new Random();
		int n = rand.nextInt(100000);

		
		String input_startDate = request.getParameter("startingDate");
		String input_closeDate = request.getParameter("endingDate");
		String input_closeTime = request.getParameter("closingTime");
		
		String CloseDateAndTime = input_closeDate + " " + input_closeTime + ":00";
		
		
		
	    String user = (String)session.getAttribute("user");
		
	    if(input_InitialPrice!=null)
	    {
	    	String insert3 = "INSERT INTO AUCTIONS(auction_id, auction_user, starting_date, closing_date, initial_price_sells)"
					+ " VALUES ('" + n + "', '"  + user + "',   '"  + input_startDate + "', '" + CloseDateAndTime + "', '" + input_InitialPrice + "')";
	    	PreparedStatement ps2 = con.prepareStatement(insert3);
			ps2 = con.prepareStatement(insert3); 
			ps2.executeUpdate();
	 		
	    }
	    else if(input_InitialPrice==null)
	    {
 		String insert2 = "INSERT INTO AUCTIONS(auction_id, auction_user, starting_date, closing_date)"
				+ " VALUES ('" + n + "', '"  + user + "',   '"  + input_startDate + "', '" + CloseDateAndTime + "')";
 		PreparedStatement ps2 = con.prepareStatement(insert2);
		ps2 = con.prepareStatement(insert2); 
		ps2.executeUpdate();
	    }
		


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

<%Integer max_id=0; %>

<%
try {

	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	String entity = request.getParameter("footwear_item_id");
	String str2 = "Select max(footwear_item_id) from footwear_items;";
	
	
	//out.println(str);
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str2);
	
	while (result.next()) {
		
		max_id = result.getInt("max(footwear_item_id)");	
	}
	}catch (Exception e) {
	out.print(e);
	}
%>


<%

try {
//create seller jsp page

	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	String entity = request.getParameter("footwear_item_id");
	String str2 = "SELECT * FROM wishlist";
	
	
	//out.println(str);
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str2);
	
	while (result.next()) {
		
		String wishlist_username = result.getString("wishlistUser");
		String wishlist_shoeType = result.getString("shoe_type");
		Double wishlist_shoeSize = (result.getDouble("size"));
		String wishlist_shoeBrand= result.getString("brand");
		

		
		
		
		if((wishlist_shoeType.compareTo(input_ShoeType)==0) && (wishlist_shoeSize.compareTo(input_Size)==0) && (wishlist_shoeBrand.compareTo(input_Brand)==0) ){
			
			String alertmessageInsert = "Your item is now available to accept bids";
			
			String insert3 = "INSERT into Alerts(alert_message,footwear_item_id, alert_username )"
  					+ " VALUES ('" + alertmessageInsert + "', '" + max_id + "', '" + wishlist_username + "')";
  			PreparedStatement ps = con.prepareStatement(insert3);
			ps = con.prepareStatement(insert3); 
			ps.executeUpdate(); 
			out.println("yay hello");
			
		}
		
	}


	}catch (Exception e) {
	out.print(e);
	}

%>




</body>
</html>
