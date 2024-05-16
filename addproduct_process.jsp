<%@ page import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*,java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String product_name = request.getParameter("product_name");
int price = Integer.parseInt(request.getParameter("price"));
String description = request.getParameter("description");
int user_id = Integer.parseInt((String) request.getSession().getAttribute("userID"));

Connection conn = null;
PreparedStatement productStmt = null;
PreparedStatement imageStmt = null;

try {
    Class.forName("org.mariadb.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/resell_hub", "root", "root");

    // Insert product
    String insertProductQuery = "INSERT INTO products (product_name, seller_id, description, price) VALUES (?, ?, ?, ?);";
    productStmt = conn.prepareStatement(insertProductQuery);
    productStmt.setString(1, product_name);
    productStmt.setInt(2, user_id);
    productStmt.setString(3, description);
    productStmt.setInt(4, price);
    productStmt.executeUpdate();

    // Retrieve the generated product ID
    ResultSet generatedKeys = productStmt.getGeneratedKeys();
    int productId = 0;
    if (generatedKeys.next()) {
        productId = generatedKeys.getInt(1);
    }

    // Insert image
    Part filePart = request.getPart("image");
    if (filePart != null) {
        InputStream inputStream = filePart.getInputStream();
        String insertImageQuery = "INSERT INTO images (product_id, image) VALUES (?, ?);";
        imageStmt = conn.prepareStatement(insertImageQuery);
        imageStmt.setInt(1, productId);
        imageStmt.setBlob(2, inputStream);
        imageStmt.executeUpdate();
    } else {
        throw new ServletException("No file uploaded or file size is zero.");
    }

    // Redirect to success page
    response.sendRedirect("success.jsp");
} catch (Exception e) {
    e.printStackTrace();
    out.println("An error occurred: " + e.getMessage());
} finally {
    // Close resources
    try {
        if (imageStmt != null) {
            imageStmt.close();
        }
        if (productStmt != null) {
            productStmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
