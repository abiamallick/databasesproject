<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>





<%
try{
//IF CUSTOMER REP IS LOGGING IN 
ApplicationDB db = new ApplicationDB();	
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Projectfirst","root", "mint12");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from CUSTOMERREP where crepusername='" + userid + "' and creppassword='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>  Log out</a>");
        response.sendRedirect("CRepHome.jsp");
       } else {
            out.println("Invalid password <a href='login.jsp'>try again</a>");
        }
	db.closeConnection(con);
}
catch (Exception ex){
	out.print(ex);
	out.print("user login failed");
}
%>

    


<%

//IF ADMIN IS LOGGING IN 
try{
ApplicationDB db2 = new ApplicationDB();	

    String userid2 = request.getParameter("username");   
    String pwd2 = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/Projectfirst","root", "Aniagutowska1");
    Statement st2 = con2.createStatement();
    ResultSet rs2;
    rs2 = st2.executeQuery("select * from ADMIN_USER where adminusername='" + userid2 + "'");
    if (rs2.next()) {
        session.setAttribute("user", userid2); // the username will be stored in the session
        out.println("welcome " + userid2);
        out.println("<a href='logout.jsp'>  Log out</a>");
        response.sendRedirect("AdminControl.jsp");
    
	} else {
	    out.println("Invalid password <a href='login.jsp'>try again</a>");
	}
	db2.closeConnection(con2);
}
catch (Exception ex){
	out.print(ex);
	out.print("cust rep login failed");
}

%>


<%
try {
//IF CUSTOMER  IS LOGGING IN 
ApplicationDB db3 = new ApplicationDB();	

    String userid3 = request.getParameter("username");   
    String pwd3 = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/Projectfirst","root", "Aniagutowska1");
    Statement st3 = con3.createStatement();
    ResultSet rs3;
    rs3 = st3.executeQuery("select * from USERS where username='" + userid3 + "' and user_password='" + pwd3 + "'");
    if (rs3.next()) {
        session.setAttribute("user", userid3); // the username will be stored in the session
        out.println("welcome " + userid3);
        out.println("<a href='logout.jsp'>  Log out</a>");
        response.sendRedirect("success.jsp");
    }
	 else {
	    out.println("Invalid password <a href='login.jsp'>try again</a>");
	}
	db3.closeConnection(con3);
}
catch (Exception ex){
	out.print(ex);
	out.print("admin login failed");
}

%>


    
   
