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
    String userid2 = request.getParameter("username");   
    String pwd2 = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/Projectfirst","root", "Bullsraptors02");
    Statement st2 = con2.createStatement();
    ResultSet rs2;
    rs2 = st2.executeQuery("select * from ADMIN_USER where adminusername='" + userid2 + "'");
    if (rs2.next()) {
        session.setAttribute("user", userid2); // the username will be stored in the session
        out.println("welcome " + userid2);
        out.println("<a href='logout.jsp'>  Log out</a>");
        response.sendRedirect("AdminControl.jsp");
    
	} else {
	    out.println("Invalid password <a href='AdminLoginPage.jsp'>try again</a>");
	}
	db2.closeConnection(con2);
}
catch (Exception ex){
	out.print(ex);
	out.print("Admin login failed");
}
%>


</body>
</html>
