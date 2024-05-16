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
            try {
                Class.forName("org.mariadb.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
            } catch(Exception e) {
                out.print(e);
            }
            out.println("<html><body>");
            String userID = (String) session.getAttribute("userID");
            String first_name = request.getParameter("firstName");
            String last_name = request.getParameter("lastName");
            String middle_name = request.getParameter("middleName");
            String contact_no = request.getParameter("contactNo");
            String email = request.getParameter("email");
            String branch = request.getParameter("branch");
            out.print(first_name+last_name+middle_name+branch+email);
            

            try {
                PreparedStatement pre = con.prepareStatement("UPDATE user SET first_name=?, middle_name=?, last_name=?, email=?, contact_no=?, branch=? WHERE user_id=?");
                pre.setString(1, first_name);
                pre.setString(2, middle_name);
                pre.setString(3, last_name);
                pre.setString(4, email);
                pre.setString(5, contact_no);
                pre.setString(6, branch);
                pre.setString(7, userID);
                pre.executeUpdate();
            } catch(Exception e) {
                out.print(e);
            }

            // try {
            //     PreparedStatement pre2 = con.prepareStatement("UPDATE credentials SET password=? WHERE username=?");
            //     pre2.setString(1, password);
            //     pre2.setString(2, username);
            //     pre2.executeUpdate();
            //     out.print("<b>Your record was successfully updated!</b>");
            // } catch(Exception e) {
            //     out.print(e);
            // }
            out.println("</body></html>");
            %>

            <%
            // Update session attributes
            String name= first_name+middle_name+last_name;
                    session.setAttribute("userID", userID);
                    session.setAttribute("name", name );
                    session.setAttribute("email", email);
                    session.setAttribute("contact", contact_no);
                    session.setAttribute("branch", branch);
            response.setIntHeader("Refresh", 5);
            response.sendRedirect("profile.jsp");
            %>
        </div>
    </div>
</body>
</html>
