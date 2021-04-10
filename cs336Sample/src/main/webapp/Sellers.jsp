<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>




<!DOCTYPE html>
<html>
   <head>
      <title>Sellers Form</title>
   </head>
   
   
   <body>
   
   Hi! What kind of shoes would you like to sell today?
   
   <br>
   <br>
   Please input the following details: 
   
   
   	<br>
		<form method="post" action="createSellerItem.jsp">
		<table>
		<tr>    
		<td>Brand</td><td><input type="text" name="brand"></td>
		</tr>
		<tr>
		<td>Size</td><td><input type="text" name="size"></td>
		</tr>
		<tr>
		<td>Color </td><td><input type="text" name="color"></td>
		</tr>
		<tr>    
		<td>Type</td><td><input type="text" name="type"></td>
		</tr>
		<tr>    
		<td>Condition</td><td><input type="text" name="condition"></td>
		</tr>
		<tr>    
		<td>Initial Price</td><td><input type="text" name="initial price"></td>
		</tr>
		</table>
		<input type="submit" value="Submit!">
		</form>
	<br>
	
   <br>
   <br>
   
   
   
   </body>
   
</html>