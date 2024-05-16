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
        	con = DriverManager.getConnection("jdbc:mariadb://localhost:3305/resell_hub", "root", "root");
			// con = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
		
		}catch(Exception e){out.print(e+"");}
		out.println("<html><body>");
		String product_id=request.getParameter("productId");
		String buyer_id=request.getParameter("buyerId");
        String close_price=request.getParameter("closingPrice");
		

		try{PreparedStatement pre= con.prepareStatement("INSERT into transactions(product_id,buyer_id, close_price) values("+product_id+","+buyer_id+","+close_price+");");
		pre.executeUpdate();}catch(Exception e){out.print(e+"k");}
        try{PreparedStatement pre2= con.prepareStatement("update products set sold_out=true where product_id="+product_id+";");
		pre2.executeUpdate();
		out.print("<b>Your record  was Successfully added!</b>"); }catch(Exception e){out.print(e+"j");}
        out.println("</body></html>");
        %>
        <%-- <%
        response.setIntHeader("Refresh", 5);
        response.sendRedirect("profile.jsp");
    %> --%>
</div></div>
</body>


</html>


