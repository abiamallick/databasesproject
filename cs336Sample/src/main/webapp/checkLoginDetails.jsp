<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>






<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Projectfirst","root", "luv2love");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from USERS where username='" + userid + "' and user_password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid );
        out.println("<a href='logout.jsp'>  Log out</a>");
        if (userid.equals("tmedina")) { 				//if the user is the admin
            response.sendRedirect("AdminControl.jsp");
        } else if (!userid.equals("tmedina")) {			//if not the admin (just regular customer)
        response.sendRedirect("success.jsp");
   	    } else {										//wrong password
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
    }
%>
