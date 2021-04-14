<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>



	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Successful Login</title>
	</head>

<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} 
    
    else {
%>
Welcome <%=session.getAttribute("user")%>  




<div  style='text-align:right'>
<a href='logout.jsp'>Log out</a>
</div>

<div  style='text-align:center'>
<a href='Sellers.jsp'>Sell</a>
</div>

<br>

<div  style='text-align:right'>
<a href='Alerts.jsp'>View Alerts Here</a>
</div>



<br>
<form action= "itemSearch.jsp" action="search">
      <table border="0" width="300" align="center" bgcolor="white">
        <tr><td colspan=2 style="font-size:12pt;" align="center">
        <h3>Hi! Are you looking for heels, sandals, or sneakers?</h3></td></tr>
        <tr><td ><b>Search:</b></td>
          <td>: <input  type="text" name="searchItem" id="searchItem">
        </td></tr>      
        <tr><td colspan=2 align="center">
        <input  type="submit" value="Search" ></td></tr>
      </table>
    </form>
<br>

<%
    }
%>













