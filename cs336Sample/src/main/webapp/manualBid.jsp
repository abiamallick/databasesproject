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
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String input_username = (String)session.getAttribute("user");
		Integer input_footwearid = Integer.parseInt(request.getParameter("footwearid"));
		out.println(input_footwearid);
		Double input_bidamt = Double.valueOf(request.getParameter("manualbidamount"));
		int input_isAuto = 0;
		Double highest = 0.0;
		
		

		String checker= "select max(bid_amount) from Bids Where bid_footwear_item_id= '" + input_footwearid + "'";

		ResultSet result = stmt.executeQuery(checker);
		
		while (result.next()) {
			highest = (result.getDouble("max(bid_amount)"));
		//	out.println(highest);
		}
	
		if(input_bidamt > highest){
 		
 		String insert = "INSERT INTO BIDS (bid_username, bid_footwear_item_id, bid_amount, isAutomatic)"
				+ " VALUES ('" + input_username + "', '" + input_footwearid + "', '" + input_bidamt + "', '" + input_isAuto + "' )";
		
		PreparedStatement ps = con.prepareStatement(insert);
		ps = con.prepareStatement(insert); 
		ps.executeUpdate(); 
		
		
		
		
		
		
		out.print("Your bid has been placed!");
		out.println("<a href='success.jsp'>   click here to go back to the home page </a>");
		}
		else{
			out.println("Bid was unsuccessful bid. You must put a higher bid");
		}
		
		

		
		con.close();
			
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html>