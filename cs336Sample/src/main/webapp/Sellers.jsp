<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.time.LocalDate"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>




<!DOCTYPE html>
<html>
	<body bgcolor="#A4E5DC"></body>
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
		<td>Shoe Type</td><td><select name ="type" size=1>
				<option value="sneakers">Sneakers</option>
				<option value="boots">Boots</option>
				<option value="sandals">Sandals</option>
			</select>
		</tr>
		<tr> 
		<td>Size</td><td><select name ="size" size=1>
				<option value="4.0">4.0</option>
				<option value="4.5">4.5</option>
				<option value="5.0">5.0</option>
				<option value="5.5">5.5</option>
				<option value="6.0">6.0</option>
				<option value="6.5">6.5</option>
				<option value="7.0">7.0</option>
				<option value="7.5">7.5</option>
				<option value="8.0">8.0</option>
				<option value="8.5">8.5</option>
				<option value="9.0">9.0</option>
				<option value="9.5">9.5</option>
				<option value="10.0">10.0</option>
				<option value="10.5">10.5</option>
				<option value="11.0">11.0</option>
				<option value="11.5">11.5</option>
				<option value="12.0">12.0</option>
			</select>
		</tr>
		<tr>
			<td>Condition</td><td><select name ="condition" size=1>
				<option value="new">New</option>
				<option value="very used">Very Used</option>
				<option value="slightly used">Slightly Used</option>
			</select>
		</tr>
		<tr> 
				<td>Style</td><td><select name ="style" size=1>
				<option value="casual">Casual</option>
				<option value="athletic">Athletic</option>
				<option value="fancy">Fancy</option>
			</select>
		</tr>
		<tr> 
		<td>Initial Price</td><td><input type="text" name="initialprice"placeholder="Optional"></td>
		</tr>
		<tr>
				<td>Brand</td><td><select name="brand" size=1>
				<option value="nike">Nike</option>
				<option value="adidas">Adidas</option>
				<option value="reebok">Reebok</option>
				<option value="under armour">Under Armour</option>
				<option value="vans">Vans</option>
				<option value="converse">Converse</option>
				<option value="uggs">Uggs</option>
				<option value="sperry">Sperry</option>
				<option value="bearclaw">Bearclaw</option>
				<option value="hunter">Hunter</option>
				<option value="doc martens">Doc Martens</option>
				<option value="crocs">Crocs</option>
			</select>
		</tr>
		<tr>
		<tr> 
		<td>Title</td><td><input type="text" name="title"></td>
		</tr> 				
		<tr> 
		<td>Starting Date 
			<td><p><input type="date" value="<?php echo date('Y-m-d'); ?>" min="2021-04-25" name="startingDate"placeholder="Enter as YYYY-MM-DD"></p></td>
		</tr>
		<tr>
		<tr> 
		<td>Closing Time 
		<td><p><input type="text" name="closingTime"placeholder="Enter as military time"></p></td>
		</tr>
		<tr>
		<td>Closing Date 
		<td><p><input type="date" value="<?php echo date('Y-m-d'); ?>" min="2021-04-25" name="endingDate"placeholder="Enter as YYYY-MM-DD"></p></td>
		</tr> 
		</table>
		<input type="submit" value="Submit!">
		</form>
   <br>
   <br>
   <br>
   
   
   
   </body>
   
</html>
