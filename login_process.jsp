<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    PreparedStatement stmt2 = null;
    ResultSet rs2 = null;

    if(username.equals("admin")&&password.equals("admin@123")){
        response.sendRedirect("admindash.jsp");
    }else{


            try {
                Class.forName("org.mariadb.jdbc.Driver");
          conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
            // conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
                stmt = conn.prepareStatement("SELECT * FROM credentials WHERE username = ? AND password = ?");
                stmt.setString(1, username);
                stmt.setString(2, password);
                rs = stmt.executeQuery();
                stmt2 = conn.prepareStatement("SELECT * FROM user WHERE username = ?;");
                stmt2.setString(1, username);
                // stmt2.setString(2, password);
                rs2 = stmt2.executeQuery();

                if (rs.next() && rs2.next()) {
                    // HttpSession session = request.getSession();
                    String userId=""+rs2.getInt("user_id");
                    String name= rs2.getString("first_name")+rs2.getString("middle_name")+rs2.getString("last_name");
                    session.setAttribute("userID", userId);
                    session.setAttribute("username", username);
                    session.setAttribute("password", password);
                    session.setAttribute("name", name );
                    session.setAttribute("email", rs2.getString("email"));
                    session.setAttribute("contact", rs2.getString("contact_no"));
                    session.setAttribute("branch", rs2.getString("branch"));
                    response.sendRedirect("index.jsp");
                } else {
                    // request.setAttribute("message",);
                    response.sendRedirect("login.jsp?message="+"Invalid username or password. Please try again.");
                }
            } catch (Exception e) {
                out.println("An error occurred: " + e.getMessage());
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }

    }
%>
