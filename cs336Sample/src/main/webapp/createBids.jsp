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


<%	double highest = 0.0;
	Boolean hasInserted = false;%>
	
	
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
	//	out.println(input_footwearid);
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
				out.println("Please enter a bid increment. ");
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
			//out.println("old highest = " + highest);
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
		hasInserted=true;
		
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
		hasInserted=true;
		
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
		//	out.println("new" + highest);
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
				
					if(newinsr < user_UL && hasInserted== true){
					
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



<%boolean willExec = true; %>

<%
	try {
		//setting the user with the highest upper limit as the alpha
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		Integer input_footwearid = Integer.parseInt(request.getParameter("footwearid"));
		Integer countChecker = 0;

		String checker2= "SELECT COUNT(distinct bid_username) FROM bids where bid_footwear_item_id= '" + input_footwearid + "' And isAutomatic = 1";

		ResultSet result = stmt.executeQuery(checker2);
		
		while (result.next()) {
			countChecker = (result.getInt("COUNT(distinct bid_username)"));	
			
		}
		if( countChecker >=2){
			willExec = true;
		}
		else{
			willExec = false;
		}
		
	
		con.close();
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>



<% double secondToLast = 0.0; %>
<%
	try {

		//Get the database connection
		//finding the second to largest UL
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		Integer input_footwearid = Integer.parseInt(request.getParameter("footwearid"));

		String checker2= "SELECT max(Upper_limit) FROM bids Where bid_footwear_item_id= '" + input_footwearid + "' And isAutomatic = 1 And Upper_limit < (SELECT max(Upper_limit)FROM bids)";

		ResultSet result = stmt.executeQuery(checker2);
		
		while (result.next()) {
			secondToLast = (result.getDouble("max(Upper_limit)"));
		//	out.println("new" + highest);
		}
		
		con.close();
		
		//FROM THAT WE WERE ABLE TO GET THE second to largest bid UL
			
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>





<%
	try {
		//setting all users equal to their upper limit in case of a collision
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		Integer input_footwearid = Integer.parseInt(request.getParameter("footwearid"));
		Integer is_auto = 1;

		String checker2= "SELECT bid_username, upper_limit, bid_increment FROM bids Where bid_footwear_item_id= '" + input_footwearid + "' And isAutomatic = 1 And upper_limit <  (select MAX(upper_limit) from bids) GROUP BY BID_USERNAME, upper_limit, bid_increment";

		ResultSet result = stmt.executeQuery(checker2);
		
		while (result.next()) {
			String out_user = (result.getString("bid_username"));
			double out_UL = result.getDouble("upper_limit");
			double out_bidincr = result.getDouble("bid_increment");
			
			if (out_UL > highest && willExec ==true){
			String insert3 = "INSERT IGNORE INTO BIDS(bid_username, bid_footwear_item_id, bid_amount, isAutomatic, upper_limit, bid_increment)"
  					+ " VALUES ('" + out_user + "', '" + input_footwearid + "', '" + out_UL + "', '" + is_auto + "', '" + out_UL + "', '" + out_bidincr + "' )";
  			PreparedStatement ps = con.prepareStatement(insert3);
			ps = con.prepareStatement(insert3); 
			ps.executeUpdate(); 
			}
		
		}
		
		con.close();
		
		
			
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>


<%
	try {
		//setting the user with the highest upper limit as the alpha
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		Integer input_footwearid = Integer.parseInt(request.getParameter("footwearid"));
		Integer is_auto = 1;

		String checker2= "select bid_username, max(bid_amount), bid_increment, upper_limit from bids Where bid_footwear_item_id= '" + input_footwearid + "' And isAutomatic = 1 And upper_limit = (Select max(upper_limit) from bids) group by bid_username, bid_increment, upper_limit;";

		ResultSet result = stmt.executeQuery(checker2);
		
		while (result.next()) {
			String out_user = (result.getString("bid_username"));
			double out_UL = result.getDouble("upper_limit");
			double out_bidincr = result.getDouble("bid_increment");
			double newVal = secondToLast + out_bidincr;
			
			if(willExec== true ){ 
			
				String insert3 = "INSERT IGNORE INTO BIDS(bid_username, bid_footwear_item_id, bid_amount, isAutomatic, upper_limit, bid_increment)"
	  					+ " VALUES ('" + out_user + "', '" + input_footwearid + "', '" + newVal + "', '" + is_auto + "', '" + out_UL + "', '" + out_bidincr + "' )";
	  			PreparedStatement ps = con.prepareStatement(insert3);
				ps = con.prepareStatement(insert3); 
				ps.executeUpdate(); 
			}
		
		}
		
		con.close();
		
		
			
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>



<%Double alertHighest = 0.0;
String alertUser = " ";%>

<%
	try {//GETTING USER WITH THE LARGEST VALUE IN THE DB FOR PARTICULAR ITEM
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		Integer input_footwearid = Integer.parseInt(request.getParameter("footwearid"));
		

		String checker2= "SELECT * FROM bids WHERE bid_amount IN (SELECT max(bid_amount) FROM bids Where bid_footwear_item_id= '" + input_footwearid + "');";

		ResultSet result = stmt.executeQuery(checker2);
		
		while (result.next()) {
			alertUser = (result.getString("bid_username"));
			alertHighest = result.getDouble("bid_amount");
		}
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>




<%
	try {
		//setting all users equal to their upper limit in case of a collision
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		Integer input_footwearid = Integer.parseInt(request.getParameter("footwearid"));
		String alertMessage = alertUser + " has bid higher than you";

		String checker2= "select distinct bid_username from bids where bid_footwear_item_id =1001 And bid_username <>'" + alertUser + "'";

		ResultSet result = stmt.executeQuery(checker2);
		
		while (result.next()) {
			String insertAlert_user = (result.getString("bid_username"));
			
			if (hasInserted=true){
			String insert3 = "INSERT INTO Alerts(alert_message, footwear_item_id, alert_username)"
  					+ " VALUES ('" + alertMessage + "', '" + input_footwearid + "', '" + insertAlert_user + "')";
  			PreparedStatement ps = con.prepareStatement(insert3);
			ps = con.prepareStatement(insert3); 
			ps.executeUpdate(); 
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