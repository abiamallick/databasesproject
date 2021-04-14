<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>


<%
	    		    Class.forName("com.mysql.jdbc.Driver");
	    		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyMe","root", "mint12");
				
					String user = session.getAttribute("user").toString();
					int footwear_item_id = Integer.parseInt(request.getParameter("footwear_item_id"));
					//int access_level = (Integer) session.getAttribute("access_level");
					String productQuery = "SELECT * FROM footwear_items WHERE footwear_item_id= " + "'" + footwear_item_id + "'";
					System.out.println(footwear_item_id);
					
					
					//ps1 = conn.prepareStatement(productQuery);
					//ps1.setInt(1, productId);
					
					//rs = ps1.executeQuery();
%>