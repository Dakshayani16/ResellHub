import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TransactionServlet")
public class TransactionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve data from request parameters
        String productId = request.getParameter("productId");
        String buyerId = request.getParameter("buyerId");
        double closingPrice = Double.parseDouble(request.getParameter("closingPrice"));
        
        // Get current date and time
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentDate = sdf.format(new Date());

        // Database connection parameters
        String url = "jdbc:mariadb://localhost:3305/mydatabase";
        String username = "root";
        String password = "root";

        // SQL INSERT statement
        String sql = "INSERT INTO transaction (Product_id, Buyer_id, Close_price, Date) VALUES (?, ?, ?, ?)";

        try (
            // Establish database connection
            Connection conn = DriverManager.getConnection(url, username, password);
            // Create prepared statement
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            // Set parameters for the INSERT statement
            pstmt.setString(1, productId);
            pstmt.setString(2, buyerId);
            pstmt.setDouble(3, closingPrice);
            pstmt.setString(4, currentDate);

            // Execute the INSERT statement
            pstmt.executeUpdate();

            // Forward the request to a JSP page to display the result
            request.getRequestDispatcher("transaction.jsp").forward(request, response);
        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
            // Forward the request to an error page
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
