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
<%
//IF ADMIN IS LOGGING IN 
try{
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//Create a SQL statement
	Statement st2 = con.createStatement();
    ResultSet rs2;
    rs2 = st2.executeQuery("SELECT shoe_type, COUNT(shoe_type), SUM(initial_price) FROM FOOTWEAR_ITEMS WHERE sold=1 GROUP BY shoe_type ORDER BY COUNT(shoe_type) DESC");
    if (rs2.next()) { %>
    	<h2>Sales Report:</h2>
    	<br>
    	<h2>Earnings In Order of Best Selling Items:</h2>
		<table>
			<tr> 
					<th>Shoe Type</th>
		    		<th>Amount Sold</th>
		    		<th>Earnings</th>
			</tr>	
			
	<%	do { %>
			<tr>
				<td><%= rs2.getString("shoe_type") %></td>
		    	<td><%= rs2.getInt("COUNT(shoe_type)") %></td>
		    	<th>$</th>
		    	<td><%= rs2.getFloat("SUM(initial_price)") %></td>
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
