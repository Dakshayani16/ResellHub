<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;
PreparedStatement stmt2 = null;
ResultSet rs2 = null;

try {
    Class.forName("org.mariadb.jdbc.Driver");
  //  conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
    conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
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
        String name= rs2.getString("first_name")+rs2.getString("middle_name")+rs2.getString("last_name");
        session.setAttribute("userID", rs2.getString("user_id"));
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        session.setAttribute("name", name );
        session.setAttribute("email", rs2.getString("email"));
        session.setAttribute("contact", rs2.getString("contact_no"));
        session.setAttribute("branch", rs2.getString("branch"));
        response.sendRedirect("index.jsp");
    } else {
        request.setAttribute("message","Invalid username or password. Please try again.");
        response.sendRedirect("login.jsp");
    }
} catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
} finally {
    if (rs != null) rs.close();
    if (stmt != null) stmt.close();
    if (conn != null) conn.close();
}
%>
