

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Past Auctions</title>
</head>
<body bgcolor="#FDFD96"></body>
<body>
<style>

.tab1{
tab-size=50;
}



table, th, td {
  border: 4px solid black;
  border="1"
  border-collapse: collapse;
  padding: 10px;
}
th, td {
padding: 30px;
}
</style>

<%
try {

	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	

	//Create a SQL statement
	Statement stmt = con.createStatement();

	String str = "Select distinct f.title, au.closing_date, w.w_username, w.w_amount, w.status_winner FROM footwear_items f, auctions au, winner w where f.footwear_item_id = au.footwear_sells_id And w.w_footwear_id = f.footwear_item_id And au.footwear_sells_id= w.w_footwear_id order by au.closing_date";


	ResultSet result = stmt.executeQuery(str);
	%>

 <tr><td colspan=2 style="font-size:12pt;" align="center">
<h3>Past Auctions</h3></td></tr>
<table style="background-color:#FDFD96">
<tr>
	<th>Footwear Title: &emsp;&ensp;&emsp;&ensp;</th>
	&emsp;&ensp;&emsp;&ensp;
	<th>Footwear Closing Date: &emsp;&ensp;&emsp;&ensp;</th>
	&emsp;&ensp;&emsp;&ensp;
	<th>Winner:</th>
	<th>Winning Price :</th>
</tr>



	<%
	//parse out the results
		while (result.next()) {
			int deciding = (result.getInt("w.status_winner"));
	%>

<tr>
    <td><%= result.getString("f.title") %> </td>
    <td><%= result.getString("au.closing_date") %> </td>
    
        <td><%if(deciding!=0){ 
    	out.println(result.getString("w.w_username"));
    	}
    else{
    	out.println("No Winner");
    	}%> </td>
    
    <td><%if(deciding!=0){ 
    	out.println(result.getString("w.w_amount"));
    	}
    else{
    	out.println("No Winner");
    	}%> </td>
</tr>

	<% }
	//close the connection.
	db.closeConnection(con);
	%>

</table>
<br>
<br>

<a href="success.jsp"><%= "Click to return back to the home page."%></a>
	

<%} catch (Exception e) {
	out.print(e);
}%>
</body>
</html>
