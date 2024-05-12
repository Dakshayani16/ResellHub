<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Enumeration,java.sql.*" %>

<!DOCTYPE html>
<html>
<body>
	<br><br><br>
	<div class="row" align="center">
	<div class="col12">
		<br>
		<% 
		 Connection con = null;
		ResultSet result=null;
		try{Class.forName("org.mariadb.jdbc.Driver");
        	con = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
			// con = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
		
		}catch(Exception e){out.print(e+"");}
		out.println("<html><body>");
		String first_name=request.getParameter("first_name");
		String last_name=request.getParameter("last_name");
        String middle_name=request.getParameter("middle_name");
		String contact_no=request.getParameter("contact_no");
		String email=request.getParameter("email");
		String branch=request.getParameter("branch");
        String username=request.getParameter("username");
        String password=request.getParameter("password");

		try{PreparedStatement pre= con.prepareStatement("INSERT into user(first_name,middle_name, last_name,email,contact_no,branch,username) values('"+first_name+"','"+middle_name+"','"+last_name+"','"+email+"','"+contact_no+"','"+branch+"','"+username+"');");
		pre.executeUpdate();}catch(Exception e){out.print(e+"");}
        try{PreparedStatement pre2= con.prepareStatement("update credentials set password='"+password+"'where username='"+username+"';");
		pre2.executeUpdate();
		out.print("<b>Your record  was Successfully added!</b>"); }catch(Exception e){out.print(e+"");}
        out.println("</body></html>");
        %>
        <%
        response.setIntHeader("Refresh", 5);
        response.sendRedirect("login.jsp");
    %>
</div></div>
</body>


</html>


