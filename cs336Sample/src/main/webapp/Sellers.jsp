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
		<td>Brand</td><td><select name="brand" size=1>
				<option value="3.0">Nike</option>
				<option value="5.0">Adidas</option>
				<option value="8.0">Reebox</option>
				<option value="8.0">Under Armour</option>
				<option value="8.0">Vans</option>
				<option value="8.0">Converse</option>
				<option value="8.0">Uggs</option>
				<option value="8.0">Sperry</option>
				<option value="8.0">Bearclaw</option>
				<option value="8.0">Hunter</option>
				<option value="8.0">Doc Martens</option>
				<option value="8.0">Crocs</option>
			</select>
		</tr>
		<tr>
		<td>Size</td><td><select name ="size" size=1>
				<option value="3.0">4.0</option>
				<option value="5.0">4.5</option>
				<option value="8.0">5.0</option>
				<option value="8.0">5.5</option>
				<option value="8.0">6.0</option>
				<option value="8.0">6.5</option>
				<option value="8.0">7.0</option>
				<option value="8.0">7.5</option>
				<option value="8.0">8.0</option>
				<option value="8.0">8.5</option>
				<option value="8.0">9.0</option>
				<option value="8.0">9.5</option>
				<option value="8.0">10.0</option>
				<option value="8.0">10.5</option>
				<option value="8.0">11.0</option>
				<option value="8.0">11.5</option>
				<option value="8.0">12.0</option>
			</select>
		</tr>
		<tr>
		<td>Color</td><td><select name ="color" size=1>
				<option value="5.0">Blue</option>
				<option value="8.0">Pink</option>
				<option value="8.0">Black</option>
				<option value="8.0">Brown</option>
				<option value="8.0">Tan</option>
				<option value="8.0">Red</option>
				<option value="8.0">Turquoise</option>
				<option value="8.0">White</option>
				<option value="8.0">Green</option>
				<option value="8.0">Cream</option>
				<option value="8.0">Orange</option>
				<option value="8.0">Yellow</option>
				<option value="8.0">Purple</option>
				<option value="8.0">Coffee</option>
				<option value="8.0">Lime</option>
				<option value="8.0">Dark Blue</option>
		</select>
		</tr>
		<tr>    
		<td>Type</td><td><select name ="type" size=1>
				<option value="8.0">Sneakers</option>
				<option value="8.0">Boots</option>
				<option value="8.0">Sandals</option>
			</select>
		</tr>
		<tr>    
		<td>Condition</td><td><select name ="condition" size=1>
				<option value="8.0">New</option>
				<option value="8.0">Very Used</option>
				<option value="8.0">Slightly Used</option>
			</select>
		</tr>
		<tr>    
		<td>Initial Price</td><td><input type="text" name="initialprice"></td>
		</tr>
		</table>
		<input type="submit" value="Submit!">
		</form>
   <br>
   <br>
   <br>
   
   
   
   </body>
   
</html>