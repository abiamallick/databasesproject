<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>




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
		<td>Color</td><td><select name ="color" size=1>
				<option value="blue">Blue</option>
				<option value="pink">Pink</option>
				<option value="black">Black</option>
				<option value="brown">Brown</option>
				<option value="tan">Tan</option>
				<option value="red">Red</option>
				<option value="turquoise">Turquoise</option>
				<option value="white">White</option>
				<option value="green">Green</option>
				<option value="cream">Cream</option>
				<option value="orange">Orange</option>
				<option value="yellow">Yellow</option>
				<option value="purple">Purple</option>
				<option value="coffee">Coffee</option>
				<option value="lime">Lime</option>
				<option value="dark blue">Dark Blue</option>
				<option value="others">Others</option>
		</select>
		</tr>
		<tr>    
		<td>Type</td><td><select name ="type" size=1>
				<option value="sneakers">Sneakers</option>
				<option value="boots">Boots</option>
				<option value="sandals">Sandals</option>
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