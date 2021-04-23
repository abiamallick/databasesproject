<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Earnings Per Item </title>
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
    rs2 = st2.executeQuery("SELECT w.w_footwear_id, w.w_amount, f.title, f.footwear_item_id FROM winner w JOIN footwear_items f WHERE status_winner=1 AND f.footwear_item_id=w.w_footwear_id");
    if (rs2.next()) { %> 
	<h2>Sales Report: Earnings Per Item</h2>	
	
	
	
	<div>
			  <tr>
			  	<th><b>Item&emsp;&emsp;&ensp;&emsp;&emsp;&emsp;&ensp;&emsp;&ensp;&ensp;&emsp;&emsp;&ensp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</b></th>
			 
			    <th><b>Earnings&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</b></th> 	    
			</tr>	
	</div>
	<table style= ""width:50%">
	
	<%	do { %>
	<div>
			<tr>
				
				<td><%= rs2.getString("f.title")%></td>
				
				<td>$<%= rs2.getFloat("w_amount") %></td>
			</tr>
	</div>
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
