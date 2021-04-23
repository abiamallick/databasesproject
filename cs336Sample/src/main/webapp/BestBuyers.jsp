<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Best Buyers</title>
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
    rs2 = st2.executeQuery("SELECT w_username, COUNT(w_username), SUM(w_amount) FROM WINNER WHERE status_winner=1 GROUP BY w_username ORDER BY COUNT(w_username) DESC");
    if (rs2.next()) { %>
    	<br>
    	<h2>Earnings In Order of Best Buyers:</h2>
    	
    	
    	
	<div>
			  <tr>
			  	<th><b>Buyer&emsp;&emsp;&emsp;&emsp;</b></th>
			 
			    <th><b>Auctions Won&emsp;</b></th> 
			    <th><b>Total Spent&emsp;&emsp;&ensp;</b></th> 	    	    
			</tr>	
	</div>
	<table style= ""width:50%">
	
			
	<%	do { %>
			<tr>
				<td><%= rs2.getString("w_username") %></td>
		    	<td><%= rs2.getInt("COUNT(w_username)") %></td>
		    	<td>$<%= rs2.getFloat("SUM(w_amount)") %></td>
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
