<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Rep</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

Fill in the info below to create a new customer representative:





<br>
		<form method="post" action="createAccount.jsp">
		<table>
		<tr>    
		<td>Username</td><td><input type="text" name="username"></td>
		</tr>
		<tr>
		<td>Password</td><td><input type="password" name="password"></td>
		</tr>
		<tr>
		<td>Email</td><td><input type="text" name="email"></td>
		</tr>
		</table>
		<input type="submit" value="Submit!">
		</form>
	<br>
	
	
   </body>
</html>
