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
    <br>
   <br>
    <br>
   <br>
    <br>
   <br>
    <br>
   <br>
   
   
   Hi! What kind of shoes would you like in your Wishlist
   
   <br>
   <br>
   Please input the following details: 
   
   
   	<br>
		<form method="post" action="createWishlist.jsp">
		<table>
		<tr>    
		<td>Shoe Type</td><td><select name ="type" size=1>
				<option value="Sneakers">Sneakers</option>
				<option value="Boots">Boots</option>
				<option value="Sandals">Sandals</option>
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
				<td>Brand</td><td><select name="brand" size=1>
				<option value="Nike">Nike</option>
				<option value="Adidas">Adidas</option>
				<option value="Reebok">Reebok</option>
				<option value="Under Armour">Under Armour</option>
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
		</table>
		<input type="submit" value="Submit!">
		</form>
   <br>
   <br>
   <br>
   
   
   
   </body>
   
</html>
