<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>






<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyMe","root", "mint12");

String username = (session.getAttribute("user")).toString();
String question = (request.getParameter("questionAsked")).trim();
String answer = "Please wait for an answer from customer representative";
if(question != null && !question.isEmpty()){
	String insert = "INSERT INTO Questions (q_username, question, answer)" + 
			" VALUES ('" + username + "', '" + question + "', '" + answer + "' )";
	out.print(insert);

	PreparedStatement ps = con.prepareStatement(insert);
	ps = con.prepareStatement(insert); 
	ps.executeUpdate();
	out.print("Your question has been successfully submitted.");
} 
else { 
	out.print("Please enter a valid question.");
	 response.sendRedirect("success.jsp");
} 
%>