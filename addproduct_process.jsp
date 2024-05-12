<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
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
// Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
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

    Part filePart = request.getPart("image");
                if (filePart != null) {
                    // Resize and compress image
                    BufferedImage originalImage = ImageIO.read(filePart.getInputStream());
                    BufferedImage resizedImage = resizeImage(originalImage, 320, 320);
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    ImageIO.write(resizedImage, "jpg", baos);
                    baos.flush();
                    byte[] imageBytes = baos.toByteArray();
                    baos.close();

                    String insertImageQuery = "INSERT INTO images (product_id, image) VALUES (?, ?);";
                    PreparedStatement imageStmt = conn.prepareStatement(insertImageQuery);
                    imageStmt.setInt(1, productId);
                    imageStmt.setBytes(2, imageBytes);
                    imageStmt.executeUpdate();
                    LOGGER.log(Level.INFO, "Image inserted successfully into the database.");
                } else {
                    throw new ServletException("No file uploaded or file size is zero.");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.log(Level.SEVERE, "An error occurred while processing the request.", e);
            throw new ServletException("An error occurred while processing the request.", e);
        } finally {
            // Close resources
            try {
                if (generatedKeys != null) {
                    generatedKeys.close();
                }
                if (productStmt != null) {
                    productStmt.close();
                }
                if (productStmt1 != null) {
                    productStmt1.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "Error closing resources.", e);
                e.printStackTrace();
            }
        }

        // response.setIntHeader("Refresh", 5);
        // response.sendRedirect("index.jsp");
    

    private BufferedImage resizeImage(BufferedImage originalImage, int targetWidth, int targetHeight) {
        BufferedImage resizedImage = new BufferedImage(targetWidth, targetHeight, BufferedImage.TYPE_INT_RGB);
        resizedImage.createGraphics().drawImage(
                originalImage.getScaledInstance(targetWidth, targetHeight, java.awt.Image.SCALE_SMOOTH), 0, 0, null);
        return resizedImage;
    }

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
