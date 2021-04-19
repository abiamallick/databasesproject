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
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//Get parameters from the HTML form at the index.jsp
		//int n = 1234;
		String input_ShoeType = request.getParameter("type");
		Float input_Size = Float.valueOf(request.getParameter("size"));
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
		String input_Brand = request.getParameter("brand");
		String input_Title = request.getParameter("title");
		
		
 		String insert1 = "INSERT INTO FOOTWEAR_ITEMS(shoe_type,size,item_condition,style,initial_price,brand,title)"
				+ " VALUES ('" + input_ShoeType + "', '" + input_Size + "', '" + input_Condition + "', '" + input_Style + "', '" + input_InitialPrice + "', '" + input_Brand + "', '" + input_Title + "' )";
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
</body>
</html>
