<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>





<%

//IF CUSTOMER REP IS LOGGING IN 
    String userid2 = request.getParameter("username");   
    String pwd2 = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/Projectfirst","root", "Aniagutowska1");
    Statement st2 = con2.createStatement();
    ResultSet rs2;
    rs2 = st2.executeQuery("select * from CUSTOMERREP where crepusername='" + userid2 + "' and creppassword='" + pwd2 + "'");
    if (rs2.next()) {
        session.setAttribute("user", userid2); // the username will be stored in the session
        out.println("welcome " + userid2);
        out.println("<a href='logout.jsp'>  Log out</a>");
        response.sendRedirect("CRepHome.jsp");
        }
    else if (userid2.equals("tmedina") || userid2.equals("Tmedina")) { 
    	//if the user is the admin
    	session.setAttribute("user", userid2); // the username will be stored in the session
        out.println("welcome " + userid2);
        out.println("<a href='logout.jsp'>  Log out</a>");
        response.sendRedirect("AdminControl.jsp");
    } else {
    	session.setAttribute("user", userid2); // the username will be stored in the session
        out.println("welcome " + userid2);
        out.println("<a href='logout.jsp'>  Log out</a>");
    	 response.sendRedirect("success.jsp");
    }
    
    
%>
