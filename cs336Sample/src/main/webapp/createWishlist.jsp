<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<html>
 <body bgcolor="#BA626A"></body>
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
//createwishlist
		 try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String input_username = (String)session.getAttribute("user");
			String input_shoeType = request.getParameter("type");
			Double input_Size = Double.valueOf(request.getParameter("size"));
			String input_Brand = request.getParameter("brand");
			
			
			String insert1 = "INSERT INTO wishlist(wishlistUser,shoe_type,size,brand)"
					+ " VALUES ('" + input_username + "', '" + input_shoeType + "', '" + input_Size + "', '" + input_Brand + "')";
			PreparedStatement ps1 = con.prepareStatement(insert1);
			ps1 = con.prepareStatement(insert1); 
			ps1.executeUpdate();
			
			
			
			con.close();
			out.print("Your new item has been added to your wishlist!");
			
			
		 }catch (Exception e) {
			out.print(e);
		} 
			
			%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>		
			
	<a href="success.jsp"><%= "Click to return back to the home page."%></a>	
	</body>
</html>
			
