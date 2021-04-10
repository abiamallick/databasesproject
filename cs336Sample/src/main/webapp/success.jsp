<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>



	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Successful Login</title>
	</head>

<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("user")%>  
<div  style='text-align:right'>
<a href='logout.jsp'>Log out</a>
</div>

<div  style='text-align:center'>
<a href='Sellers.jsp'>Sell</a>
</div>

<br>
<br>

<div class="topnav;"  style='text-align:center'>
  <input type="text" placeholder="Search..">
</div>


<%
    }
%>