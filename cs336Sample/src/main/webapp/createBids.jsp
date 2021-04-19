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

<%	double highest = 0.0; %>
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
		String input_bidtype = request.getParameter("bidtype");
		//Boolean is_working = false;
		int input_isAuto = 0;
		Double input_bidamt = 0.0;
		Double input_bidIncrement = 0.0;
		Double input_bidUL = 0.0;
		
		if (input_bidtype.equals("Manual")){
			input_isAuto = 0; //0 if manual
			
			if(request.getParameter("manualbidamount").equals(""))
			{
				out.println("Please enter a bid increment");
			}
			else
			{
				input_bidamt = Double.valueOf(request.getParameter("manualbidamount"));
//				is_working = true;
			}
			
			
		}
		//NOW CHECKING IF THEY CLICKED AUTOMATIC
		else{
			input_isAuto = 1; //1 if automatic
			input_bidIncrement = Double.valueOf(request.getParameter("bidincrprice"));
			//check if bid increment price is empty
			if(request.getParameter("bidincrprice").equals("") || request.getParameter("bidUL").equals("") || !request.getParameter("manualbidamount").equals("") ){
//				is_working=false;
			}
//			is_working=true;
			if(request.getParameter("bidincrprice").equals(""))
			{
				out.println("Please enter a bid increment");
			}
			else
			{
				input_bidIncrement = Double.valueOf(request.getParameter("bidincrprice"));
			}
			//check if bid upperlimit price is empty
			if(request.getParameter("bidUL").equals(""))
			{
				out.println("Please enter an upper limit");
			}
			else
			{
				input_bidUL = Double.valueOf(request.getParameter("bidUL"));
			}
			
		}
		
		
//this is the next part, i.e. getting the max bid amount to do the inserts		
		String checker= "select max(bid_amount) from Bids Where bid_footwear_item_id= '" + input_footwearid + "'";

		ResultSet result = stmt.executeQuery(checker);
		
		while (result.next()) {
			highest = (result.getDouble("max(bid_amount)"));
			out.println("old highest = " + highest);
		}
		
		
		//if automatic, then their input_bidamt would be highest + the bid increment
		
		
		if(input_isAuto == 1){ //1 means is automatic
			input_bidamt = highest + input_bidIncrement;
		}
		
		//NOW WE CAN START INSERTING	
  		if(input_bidamt > highest){
  			
  		//FIRST INSERT THIS WAY IF ITS MANUAL	
 		if(input_isAuto == 0){ 
 		String insert = "INSERT INTO BIDS (bid_username, bid_footwear_item_id, bid_amount, isAutomatic)"
				+ " VALUES ('" + input_username + "', '" + input_footwearid + "', '" + input_bidamt + "', '" + input_isAuto + "' )";
		
		PreparedStatement ps = con.prepareStatement(insert);
		ps = con.prepareStatement(insert); 
		ps.executeUpdate(); 
		
		out.print("Your bid has been placed!");
		out.println("<a href='success.jsp'>   click here to go back to the home page </a>");
  		}
  		
  		//NOW LETS DO AUTOMATIC
  		else{
  			
  		String insert2 = "INSERT INTO BIDS(bid_username, bid_footwear_item_id, bid_amount, isAutomatic, upper_limit, bid_increment)"
  					+ " VALUES ('" + input_username + "', '" + input_footwearid + "', '" + input_bidamt + "', '" + input_isAuto + "', '" + input_bidUL + "', '" + input_bidIncrement + "' )";
  		PreparedStatement ps = con.prepareStatement(insert2);
		ps = con.prepareStatement(insert2); 
		ps.executeUpdate(); 
		
		out.print("Your bid has been placed!");
		out.println("<a href='success.jsp'>   click here to go back to the home page </a>");	
  		
  		
  		}
  		
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

<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		Integer input_footwearid = Integer.parseInt(request.getParameter("footwearid"));

		String checker2= "select max(bid_amount) from Bids Where bid_footwear_item_id= '" + input_footwearid + "'";

		ResultSet result = stmt.executeQuery(checker2);
		
		while (result.next()) {
			highest = (result.getDouble("max(bid_amount)"));
			out.println("new" + highest);
		}
		
		con.close();
		
		//FROM THAT WE WERE ABLE TO GET THE NEW HIGHEST VALUE IN THE TABLE AFTER DOING THE INSERT
			
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>


<%
//NOW WE ATTEMPT TO FIND ANOTHER AUTOMATIC BIDDER AND PLACE THEM ABOVE WHAT JUST GOT INSERTED
	try {
		
		//highest ==113

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		String input_username = (String)session.getAttribute("user");
		Integer input_footwearid = Integer.parseInt(request.getParameter("footwearid"));
		
		String checker3= "select max(bid_amount), bid_username, isAutomatic, upper_limit, bid_increment from Bids Where bid_footwear_item_id= '" + input_footwearid + "' and bid_username <> '" + input_username + "' Group by bid_username, isAutomatic, upper_limit, bid_increment";
		//out.println(checker3);
		
		
		
		ResultSet result = stmt.executeQuery(checker3);
		
		while (result.next()){
			int is_auto= result.getInt("isAutomatic");
			String user= result.getString("bid_username");
			double user_max = result.getDouble("max(bid_amount)");
			
			
			if (result.getInt("isAutomatic") == 1){ //IF SOME USER DOES HAVE AN AUTOMATIC BID ON THIS ITEM
				double user_UL = result.getDouble("upper_limit");
				double user_bidincr = result.getDouble("bid_increment");
				double newinsr = highest + user_bidincr;
				
				if(newinsr < user_UL){
					
					String insert3 = "INSERT INTO BIDS(bid_username, bid_footwear_item_id, bid_amount, isAutomatic, upper_limit, bid_increment)"
		  					+ " VALUES ('" + user + "', '" + input_footwearid + "', '" + newinsr + "', '" + is_auto + "', '" + user_UL + "', '" + user_bidincr + "' )";
		  			PreparedStatement ps = con.prepareStatement(insert3);
					ps = con.prepareStatement(insert3); 
					ps.executeUpdate(); 
					
					
				}
				else{//if it can't increment anymore bc they reached their upperlimit
					out.println(""); //just do nothing
				}
				
		
				
			}
			else{
				out.println("");
			}
	
		}
		
		
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>







</body>
</html>