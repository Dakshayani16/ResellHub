// import java.io.ByteArrayInputStream;
// import java.io.ByteArrayOutputStream;
// import java.io.IOException;
// import java.io.InputStream;
// import java.sql.Connection;
// import java.sql.DriverManager;
// import java.sql.PreparedStatement;
// import java.sql.ResultSet;
// import java.sql.SQLException;
// import java.sql.Statement;
// import jakarta.servlet.ServletException;
// import jakarta.servlet.annotation.WebServlet;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.Part;

// @WebServlet("/AddProduct")
// public class AddProduct extends HttpServlet {
//     protected void doPost(HttpServletRequest request, HttpServletResponse response)
//             throws ServletException, IOException {
// String product_name = request.getParameter("product_name");
// int price = Integer.parseInt(request.getParameter("price"));
// String condition_description = "dcfvgbhjnk";
// condition_description = request.getParameter("condition_description");
// condition_description = "dcfvgbhjnk";
// int buy_year = 0;
// String buyYearParam = request.getParameter("buy_year");
// if (buyYearParam != null && !buyYearParam.isEmpty()) {
// buy_year = Integer.parseInt(buyYearParam);
// }
// String description = request.getParameter("description");
// String[] categories = request.getParameterValues("category");
// int condition_id = 0;
// int user_id = Integer.parseInt((String)
// request.getSession().getAttribute("userID"));

// try {
//     Class.forName("org.mariadb.jdbc.Driver");
//     Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");

// String insertProductQuery = "INSERT INTO products
// (product_name,seller_id,condition_id, description, price) VALUES (?,
// ?,?,?,?);";
// PreparedStatement productStmt = conn.prepareStatement(insertProductQuery,
// Statement.RETURN_GENERATED_KEYS);
// productStmt.setString(1, product_name);
// productStmt.setInt(2, user_id);
// productStmt.setInt(3, condition_id);
// productStmt.setString(4, description);
// productStmt.setInt(5, price);
// productStmt.executeUpdate();

// ResultSet generatedKeys = productStmt.getGeneratedKeys();
// int productId = 0;
// if (generatedKeys.next()) {
// productId = generatedKeys.getInt(1);
// }
// PreparedStatement imageStmt = null;
// try {
//     Part filePart = request.getPart("image");
//     InputStream is = filePart.getInputStream();
//     ByteArrayOutputStream buffer = new ByteArrayOutputStream();
//     byte[] imageData = new byte[4096]; // or any other suitable buffer size
//     int bytesRead;
//     while ((bytesRead = is.read(imageData)) != -1) {
//         buffer.write(imageData, 0, bytesRead);
//     }
//     imageData = buffer.toByteArray();

//     // Assuming you have obtained the product ID from earlier database operations
//     int productId = 10;
//     String insertImageQuery = "INSERT INTO images (product_id, image) VALUES (?, ?);";
//     PreparedStatement imageStmt = conn.prepareStatement(insertImageQuery);
//     imageStmt.setInt(1, productId);
//     imageStmt.setBinaryStream(2, new ByteArrayInputStream(imageData), imageData.length);
//     imageStmt.executeUpdate();
// } catch (IOException | ServletException | SQLException e) {
//     e.printStackTrace();
// }

// String insertProductConditionQuery = "INSERT INTO condition_of_product
// (buy_year, description) VALUES (?, ?)";
// PreparedStatement productStmt1 =
// conn.prepareStatement(insertProductConditionQuery,
// Statement.RETURN_GENERATED_KEYS);
// productStmt1.setInt(1, buy_year);
// productStmt1.setString(2, condition_description);
// int affectedRows = productStmt1.executeUpdate();

// if (affectedRows > 0) {
// ResultSet generatedKeys = productStmt1.getGeneratedKeys();
// if (generatedKeys.next()) {
// condition_id = generatedKeys.getInt(1);
// }
// }

// Statement stmt = conn.createStatement();
// for (String category : categories) {
// ResultSet rs = stmt
// .executeQuery("SELECT category_id FROM product_category WHERE category='" +
// category + "'");
// if (rs.next()) {
// int category_id = rs.getInt("category_id");
// stmt.executeUpdate("INSERT INTO product_category (product_id, category_id)
// VALUES (" + productId
// + "," + category_id + ")");
// }
// }

//     conn.close();
// } catch (Exception e) {
//     e.printStackTrace();
// }
// response.setIntHeader("Refresh", 5);
// response.sendRedirect("index.jsp");
// }
// }
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/AddProduct")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 20) // Add MultipartConfig annotation
public class AddProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement imageStmt = null;

        try {
            // Verify if Part is retrieved
            Part filePart = request.getPart("image");
            if (filePart != null) {
                System.out.println("Part retrieved successfully. Content Type: " + filePart.getContentType()
                        + ", Size: " + filePart.getSize());

                // Establish database connection
                Class.forName("org.mariadb.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");

                // Prepare and execute SQL statement
                String insertImageQuery = "INSERT INTO images (product_id, image) VALUES (?, ?);";
                imageStmt = conn.prepareStatement(insertImageQuery);
                imageStmt.setInt(1, 8); // Assuming product_id is 8
                imageStmt.setBinaryStream(2, filePart.getInputStream(), (int) filePart.getSize());
                imageStmt.executeUpdate();

                System.out.println("Image inserted successfully into the database.");
            } else {
                throw new ServletException("No file uploaded or file size is zero.");
            }
        } catch (ClassNotFoundException | SQLException | ServletException | IOException e) {
            e.printStackTrace();
            throw new ServletException("An error occurred while processing the request.", e);
        } finally {
            // Close resources
            try {
                if (imageStmt != null) {
                    imageStmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Set response headers and redirect
        response.setIntHeader("Refresh", 5);
        response.sendRedirect("index.jsp");
    }
}
