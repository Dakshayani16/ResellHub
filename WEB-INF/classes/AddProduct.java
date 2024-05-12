import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import javax.imageio.ImageIO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;

@WebServlet("/AddProduct")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 20)
public class AddProduct extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(AddProduct.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String product_name = request.getParameter("product_name");
        int price = Integer.parseInt(request.getParameter("price"));
        String condition_description = request.getParameter("condition_description");
        int buy_year = 0;
        String buyYearParam = request.getParameter("buy_year");
        if (buyYearParam != null && !buyYearParam.isEmpty()) {
            buy_year = Integer.parseInt(buyYearParam);
        }
        // Get the current year
        int currentYear = LocalDate.now().getYear();

        // Calculate the number of years the product has been used
        int usedFor = currentYear - buy_year;
        String description = request.getParameter("description");
        String[] categories = request.getParameterValues("category");
        int condition_id = 0;
        int user_id = Integer.parseInt((String) request.getSession().getAttribute("userID"));

        Connection conn = null;
        PreparedStatement productStmt = null;
        PreparedStatement productStmt1 = null;
        PreparedStatement productStmt2 = null;
        ResultSet generatedKeys = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "root");
            // conn =
            // DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub",
            // "root", "AnishaNemade");
            LOGGER.log(Level.INFO, "Database connection established successfully.");

            String insertProductQuery = "INSERT INTO products (product_name, seller_id,description, price) VALUES (?, ?, ?, ?);";
            productStmt = conn.prepareStatement(insertProductQuery, Statement.RETURN_GENERATED_KEYS);
            productStmt.setString(1, product_name);
            productStmt.setInt(2, user_id);
            // productStmt.setInt(3, condition_id);
            productStmt.setString(3, description);
            productStmt.setInt(4, price);
            productStmt.executeUpdate();

            LOGGER.log(Level.INFO, "Product inserted successfully.");

            generatedKeys = productStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int productId = generatedKeys.getInt(1);

                String insertProductConditionQuery = "INSERT INTO condition_of_product (buy_year,Used_for,description) VALUES (?,?, ?)";
                productStmt1 = conn.prepareStatement(insertProductConditionQuery, Statement.RETURN_GENERATED_KEYS);
                productStmt1.setInt(1, buy_year);
                productStmt1.setInt(2, usedFor);
                productStmt1.setString(3, condition_description);
                int affectedRows = productStmt1.executeUpdate();
                ResultSet generatedKey = productStmt1.getGeneratedKeys();
                if (generatedKeys.next()) {
                    condition_id = generatedKey.getInt(1);
                }
                LOGGER.log(Level.INFO, "Condition of product inserted successfully.");

                if (affectedRows > 0) {
                    generatedKeys = productStmt1.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        condition_id = generatedKeys.getInt(1);
                    }
                }

                // ResultSet generatedKeys = productStmt1.getGeneratedKeys();
                // if (generatedKeys.next()) {
                // condition_id = generatedKeys.getInt(1);
                // }

                String updateProductConditionQuery = "UPDATE products SET condition_id = ? WHERE product_id = ?";
                productStmt2 = conn.prepareStatement(updateProductConditionQuery);
                productStmt2.setInt(1, condition_id);
                productStmt2.setInt(2, productId);
                productStmt2.executeUpdate();

                Statement stmt = conn.createStatement();
                for (String category : categories) {
                    ResultSet rs = stmt.executeQuery("SELECT category_id FROM product_category WHERE category='" +
                            category + "'");
                    if (rs.next()) {
                        int category_id = rs.getInt("category_id");
                        stmt.executeUpdate("INSERT INTO productcategories (product_id, category_id) VALUES ("
                                + productId + "," + category_id + ")");
                    }
                }

                LOGGER.log(Level.INFO, "Product categories inserted successfully.");

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
    }

    private BufferedImage resizeImage(BufferedImage originalImage, int targetWidth, int targetHeight) {
        BufferedImage resizedImage = new BufferedImage(targetWidth, targetHeight, BufferedImage.TYPE_INT_RGB);
        resizedImage.createGraphics().drawImage(
                originalImage.getScaledInstance(targetWidth, targetHeight, java.awt.Image.SCALE_SMOOTH), 0, 0, null);
        return resizedImage;
    }
}

// }
// import java.io.IOException;
// import java.io.InputStream;
// import java.sql.Connection;
// import java.sql.DriverManager;
// import java.sql.PreparedStatement;
// import java.sql.SQLException;
// import jakarta.servlet.ServletException;
// import jakarta.servlet.annotation.MultipartConfig;
// import jakarta.servlet.annotation.WebServlet;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.Part;

// @WebServlet("/AddProduct")
// @MultipartConfig(maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024
// * 20) // Add MultipartConfig annotation
// public class AddProduct extends HttpServlet {
// protected void doPost(HttpServletRequest request, HttpServletResponse
// response)
// throws ServletException, IOException {
// Connection conn = null;
// PreparedStatement imageStmt = null;

// try {
// // Verify if Part is retrieved
// Part filePart = request.getPart("image");
// if (filePart != null) {
// System.out.println("Part retrieved successfully. Content Type: " +
// filePart.getContentType()
// + ", Size: " + filePart.getSize());

// // Establish database connection
// Class.forName("org.mariadb.jdbc.Driver");
// conn =
// DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase",
// "root", "root");

// // Prepare and execute SQL statement
// String insertImageQuery = "INSERT INTO images (product_id, image) VALUES (?,
// ?);";
// imageStmt = conn.prepareStatement(insertImageQuery);
// imageStmt.setInt(1, 8); // Assuming product_id is 8
// imageStmt.setBinaryStream(2, filePart.getInputStream(), (int)
// filePart.getSize());
// imageStmt.executeUpdate();

// System.out.println("Image inserted successfully into the database.");
// } else {
// throw new ServletException("No file uploaded or file size is zero.");
// }
// } catch (ClassNotFoundException | SQLException | ServletException |
// IOException e) {
// e.printStackTrace();
// throw new ServletException("An error occurred while processing the request.",
// e);
// } finally {
// // Close resources
// try {
// if (imageStmt != null) {
// imageStmt.close();
// }
// if (conn != null) {
// conn.close();
// }
// } catch (SQLException e) {
// e.printStackTrace();
// }
// }

// // Set response headers and redirect
// response.setIntHeader("Refresh", 5);
// response.sendRedirect("index.jsp");
// }
// }
