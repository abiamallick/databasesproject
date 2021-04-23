<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Best Selling</title>
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
//IF ADMIN IS LOGGING IN 
try{
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//Create a SQL statement
	Statement st2 = con.createStatement();
    ResultSet rs2;
    rs2 = st2.executeQuery("SELECT f.shoe_type, COUNT(f.shoe_type), SUM(w.w_amount) FROM FOOTWEAR_ITEMS f Join WINNER w WHERE f.footwear_item_id=w.w_footwear_id GROUP BY f.shoe_type ORDER BY COUNT(f.shoe_type) DESC");
    if (rs2.next()) { %>
    	
    	<h2>Sales Report: Earnings In Order of Best Selling Items</h2>
    	
    	
    	
	<div>
			  <tr>
			  	<th><b>Shoe Type&emsp;</b></th>
			 
			    <th><b>Amount Sold&emsp;&ensp;</b></th> 
			    <th><b>Earnings&emsp;&emsp;&ensp;</b></th> 	    	    
			</tr>	
	</div>
	<table style= ""width:50%">
	
    	
  
			
	<%	do { %>
			<tr>
				<td><%= rs2.getString("f.shoe_type") %></td>
		    	<td><%= rs2.getInt("COUNT(f.shoe_type)") %></td>
		    	<td>$<%= rs2.getFloat("SUM(w.w_amount)") %></td>
			</tr>
    <%	} while (rs2.next()); %>
		    	</table>
		    	<br><a href="salesReports.jsp">Click here to generate more sales reports.</a>
		    	<%	
	
	}
	db.closeConnection(con);
}
catch (Exception ex){
	out.print(ex);
	out.print("No total earnings to show.");
}
%>


</body>
</html>
