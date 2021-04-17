<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<html>
<body>
<style>

.tab1{
tab-size=50;
}



table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
  padding: 10px;
}
th, td {
padding: 30px;
}
</style>

<%
	ArrayList<String> paramList = new ArrayList<String>();
	Map<String, String> searchParams = new HashMap<String, String>();
	String paramValue = "";
		int index = 0;
	for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
		//paramList.add(params.nextElement());
		String paramName = params.nextElement();
		paramValue = request.getParameter(paramName);
		if (!paramValue.isEmpty() && paramValue != null) {
			paramList.add(paramName);
			//System.out.println(paramList.get(index));
			//System.out.println(paramValue);				
			searchParams.put(paramList.get(index), paramValue);
			index++;
		}
	}
		 try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			//Connection con = db.getConnection();	
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Projectfirst","root", "luv2love");

			//Create a SQL statement
			Statement stmt = con.createStatement();
			StringBuilder searchQuery = new StringBuilder("");
			//Get the selected search item
				if (paramValue.isEmpty() || paramValue == null) {
					ResultSet result = stmt.executeQuery("SELECT * FROM footwear_items");
				}
				else {
					searchQuery = new StringBuilder("SELECT * FROM footwear_items WHERE ");
					String condition = null;
					for (int i = 0; i < searchParams.size(); i++) {
						// Check for numeric parameter so we can format the SQL query correctly
						if ((paramList.get(i)).equals("size")) {
							condition = paramList.get(i) + " = " + searchParams.get(paramList.get(i));
						} else if ((paramList.get(i)).equals("brand")) {
							condition = paramList.get(i) + " LIKE \'" + searchParams.get(paramList.get(i)) + "\'";
						} else {
							condition = paramList.get(i) + " LIKE \'" + searchParams.get(paramList.get(i)) + "\'";	
						}
						// Only want to include AND when we have more than one parameter
						if (i == 0) {
							searchQuery.append(condition);	
						} else if (i > 0) {
							searchQuery.append(" AND " + condition);
						}	
					}
					//System.out.println(searchQuery);
				}
			ResultSet result = stmt.executeQuery(searchQuery.toString()); %>
			
			<div>
			  <tr>
			    <th>&emsp;&emsp;&emsp;&emsp;Title&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</th>
			    <th>Brand&emsp;&emsp;&emsp;</th> 
			    <th>Size&emsp;&emsp;</th>
			    <th>Initial Price&emsp;&emsp;&emsp;&emsp;&emsp;</th>
			  </tr>
			  </div>
			  
			  <% while (result.next()) { %>
			<table>
			<div>
				<tr>    
					<td><a href="searchResults.jsp?footwear_item_id=<%= result.getInt("footwear_item_id") %>&shoe_type=<%=result.getString("shoe_type")%>"><%= result.getString("title") %></a></td>
					<td><%= result.getString("brand") %></td>
					<td><%= result.getString("size") %></td>
					<td><%= result.getString("initial_price") %></td>
				</tr>
				</div>
			</table>
			 	<% 	}
				
			//close the connection.
			db.closeConnection(con);
			

			
		
		 }catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>
