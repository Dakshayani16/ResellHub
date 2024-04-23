<%@ page import="java.io.*,java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.sql.Connection"%>
<%
// Database connection parameters
String url = "jdbc:mariadb://localhost:3305/mydatabase";
String user = "root";
String password = "root";

// Connection object
Connection conn = null;

try {
    // Create a connection to the database
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);

    // Get the uploaded file
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    List<FileItem> items = upload.parseRequest(request);

    // Iterate through the form items
    for (FileItem item : items) {
        if (!item.isFormField()) {
            // Process file upload
            String fileName = new File(item.getName()).getName();
            InputStream inputStream = item.getInputStream();

            // Insert the image into the database
            String sql = "INSERT INTO images (product_id, image) VALUES (?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, productId); // Set the product ID
            statement.setBinaryStream(2, inputStream);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                out.println("Image uploaded successfully.");
            } else {
                out.println("Failed to upload image.");
            }
        }
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    try {
        if (conn != null) {
            conn.close();
        }
    } catch (SQLException ex) {
        out.println("Error: " + ex.getMessage());
    }
}
%>
