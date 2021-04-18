<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//IF ADMIN IS LOGGING IN 
try{
	ApplicationDB db2 = new ApplicationDB();	
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//Create a SQL statement
	Statement st2 = con.createStatement();
    ResultSet rs2;
    rs2 = st2.executeQuery("SELECT SUM(initial_price) FROM FOOTWEAR_ITEMS WHERE sold=1");
    if (rs2.next()) { %>
    	<h2>Sales Report:</h2>
		<table>
			<tr>
				<th>Total Earnings</th>
			</tr>	
			
	<%	do { %>
			<tr>
				<th>$</th>
				<td><%= rs2.getFloat("SUM(initial_price)")%></td>
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
