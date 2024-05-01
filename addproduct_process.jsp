<%-- <%@ page import="java.sql.*" %> --%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %><%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>



<html>
<body>

<%
String product_name = request.getParameter("product_name");
int price = Integer.parseInt(request.getParameter("price"));
String condition_description = request.getParameter("condition_description");
int buy_year = Integer.parseInt(request.getParameter("buy_year"));
String description = request.getParameter("description");
String[] categories = request.getParameterValues("category[]");
int condition_id=0;

int user_id=Integer.parseInt((String) session.getAttribute("userID"));
try {
    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
    String insertProductConditionQuery = "INSERT INTO condition_of_product (buy_year, description) VALUES (?, ?)";
    PreparedStatement productStmt1 = conn.prepareStatement(insertProductConditionQuery, Statement.RETURN_GENERATED_KEYS);
    productStmt1.setInt(1, buy_year);
    productStmt1.setString(2, condition_description);
    int affectedRows = productStmt1.executeUpdate();

if (affectedRows > 0) {
    ResultSet generatedKeys = productStmt1.getGeneratedKeys();
    if (generatedKeys.next()) {
        condition_id = generatedKeys.getInt(1);
    } 
}
    String insertProductQuery = "INSERT INTO products (product_name,seller_id,condition_id, description, price) VALUES (?, ?, ?,?,?);";
    PreparedStatement productStmt = conn.prepareStatement(insertProductQuery, Statement.RETURN_GENERATED_KEYS);
    productStmt.setString(1, product_name);
    productStmt.setInt(2, user_id);
    productStmt.setInt(3, condition_id);
    productStmt.setString(4, description);
    productStmt.setInt(5, price);
    productStmt.executeUpdate();

    ResultSet generatedKeys = productStmt.getGeneratedKeys();
    int productId = 0;
    if (generatedKeys.next()) {
        productId = generatedKeys.getInt(1);
    }
        Statement stmt = conn.createStatement();
    out.print("li"+categories[0]);
    for (String category : categories) {
        out.print(category);
        ResultSet rs = stmt.executeQuery("SELECT category_id FROM product_category WHERE category='" + category + "'");
        if (rs.next()) {
            int category_id = rs.getInt("category_id");
            stmt.executeUpdate("INSERT INTO productcategories (product_id, category_id) VALUES (" + productId+ ","+ category_id + ")");
        }
    }

    // Part filePart = request.getPart("image");
    // InputStream fileContent = filePart.getInputStream();
    // String insertImageQuery = "INSERT INTO images (product_id, image) VALUES (?, ?);";
    // PreparedStatement imageStmt = conn.prepareStatement(insertImageQuery);
    // imageStmt.setInt(1, productId);
    // imageStmt.setBlob(2, fileContent);
    // imageStmt.executeUpdate();

    conn.close();
} catch (Exception e) {
    out.print(e);
}
%>
<%
        response.setIntHeader("Refresh", 5);
        response.sendRedirect("index.jsp?message=Product added!");
    %>

</body>


</html>
