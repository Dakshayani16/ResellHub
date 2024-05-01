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
        	con = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");}catch(Exception e){out.print(e+"con");}
		out.println("<html><body>");
		String seller_id=request.getParameter("seller_id");
		String buyer_id=(String)session.getAttribute("userID");
		

		try{PreparedStatement pre= con.prepareStatement("INSERT into conversation(buyer_id,seller_id) values("+buyer_id+","+seller_id+" );");
		pre.executeUpdate();}catch(Exception e){out.print(e+"insert");}
        PreparedStatement ps3 = con.prepareStatement("SELECT conversation_id FROM conversation WHERE seller_id = ? and buyer_id=?;");
    	ps3.setString(1, seller_id);
		ps3.setString(2, buyer_id);
    	ResultSet rs3 = ps3.executeQuery();
    
		int conversation_id=0;
		
		if (rs3.next()) {
			conversation_id=rs3.getInt("conversation_id");
		}
		
        %>
        <%
        response.setIntHeader("Refresh", 5);
		String url="chatpage.jsp?convo="+conversation_id;
        response.sendRedirect(url);
    %>
</div></div>
</body>


</html>


