<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="java.io.ByteArrayOutputStream, java.io.IOException, java.util.Base64" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Account - VJTI Resell Hub</title>
    <!-- Font Import -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- CSS Styles -->
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff
        }
        /* Navigation Bar Styles */
        nav {
            background-color: #FFF; /* White background */
            color: #000; /* Black font color */
            padding: 20px 0;
            text-align: right;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
        }
        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        nav ul li {
            display: inline;
            margin-left: 20px; /* Adjusted from margin-right to margin-left */
        }
        nav ul li:first-child {
            margin-left: 0; /* No margin for the first child */
        }
        nav ul li a {
            color: #000; /* Black font color */
            text-decoration: none;
        }
        nav h1 {
            margin: 0;
            display: inline;
            float: left; /* Aligning the logo to the left */
        }
        .container-c {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        section {
            margin-bottom: 30px;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        /* Card Grid Styles */
        .card-grid {
            display: grid;
            /* Adjust column width based on available space */
            gap: 20px; /* Spacing between cards */
        }
        /* Card Styles */
        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex; /* Ensure elements inside the card align properly */
            flex-direction: column; /* Stack the image and details vertically */
        }
        footer {
            background-color: #FD5F04; 
            height: 100px,
            color: #000;
            text-align: center;
            padding: 100px 0;
        }
        .card img {
            width: 100%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .card h5 {
            margin: 0;
            font-size: 16px;
            color: #333;
        }
        .card p {
            margin: 10px 0;
            color: #666;
        }
        /* Sold Out Button Styles */
        .sold-out-button {
            padding: 10px 20px;
            background-color: #ff4d4d;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: not-allowed;
            transition: background-color 0.3s ease;
        }
        .sold-out-button:hover {
            background-color: #e60000;
        }
        /* Dialog Styles */
        .dialog {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            width: 450px; /* Adjust the width as needed */
            height: 280px;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            z-index: 1000; /* Ensure dialog is on top of other content */
        }
        .dialog label {
            display: block;
            margin-bottom: 10px;
        }
        .close-icon {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            cursor: pointer;
        }
        .dialog input {
            width: 87%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .dialog button {
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-warning {
            color: #ffffff; /* Text color */
            background-color: #FD5F04 !important; /* Orange background color */
            border-color: #FD5F04 !important; /* Orange border color */
        }
        /* Hover state */
        .btn-warning:hover {
            color: #000000; /* Text color on hover */
            background-color: #fe4d00 !important; /* Darker orange background color on hover */
            border-color: #cc4d00 !important; /* Darker orange border color on hover */
        }
        .dialog button:hover {
            background-color: #555;
        }
    </style>
    
</head>
<% if(session.getAttribute("username")==null){ 
    String url="login.jsp?message="+"Please Login to Continue";
    response.sendRedirect(url);
}%>
<body>
    <!-- Navigation Bar -->
    <nav>
        <div class="container">
            <h1><img src="https://t4.ftcdn.net/jpg/03/04/45/39/360_F_304453978_iDgX3VrXdHzgN4GrhLqgRxe1ILgEUUX3.jpg" width=200 height=190>VJTI Resell Hub</h1>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="explore.jsp">Explore</a></li>
                <li><a href="add_product.jsp">Post</a></li>
                <li><a href="profile.jsp">My Account</a></li>
                <% if(session.getAttribute("username")==null){ %>
                    <li><a href="login.jsp">Login</a></li>
                <% }else{ %>
                    <li><a href="conversations.jsp">Chats</a></li>
                    <li><a href="favourites.jsp">Favourites</a></li>
                    <li><a href="logout_process.jsp">Logout</a></li>
                <% }%>
            </ul>
        </div>
    </nav>
    <br><br><br><br><br><br><br>
    <div class="container">
        <section>
            <h3 align="center">Recent Activities</h3><br><hr>
        </section>
    </div>


    <!-- Main Content Section -->
    <div class="container-c">
        <%
            // Fetch user information from the database
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                String user_id = (String) session.getAttribute("userID"); // Cast to String
              //  conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
                conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/resell_hub", "root", "root");
                String sql = "SELECT category, no_of_items FROM product_category";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();
                // Lists to store category and no_of_items
                List<String> categories = new ArrayList<>();
                List<Integer> itemCounts = new ArrayList<>();
                // Fetching data from result set
                while (rs.next()) {
                    categories.add(rs.getString("category"));
                    itemCounts.add(rs.getInt("no_of_items"));
                }
        %>
        <div class="container-c">
            <%
                // Fetch user information from the database
                Connection conn1 = null;
                PreparedStatement stmt1 = null;
                ResultSet rs1 = null;
                try {
                    String sellerId = (String) session.getAttribute("userID"); // Cast to String
                    // Establish connection to the database
                    Class.forName("org.mariadb.jdbc.Driver"); // Load the MariaDB JDBC driver
                    conn1 = DriverManager.getConnection("jdbc:mariadb://localhost:3305/resell_hub", "root", "root");
        
                    // Query to fetch total number of products
                    String totalProductsQuery = "SELECT COUNT(*) AS total FROM products";
                    stmt1 = conn1.prepareStatement(totalProductsQuery);
                    rs1 = stmt1.executeQuery();
                    int totalProducts = 0;
                    if (rs1.next()) {
                        totalProducts = rs1.getInt("total");
                    }
        
                    // Query to fetch number of products posted by the seller
                    String sellerProductsQuery = "SELECT COUNT(*) AS seller_products FROM products WHERE seller_id = ?";
                    stmt1 = conn1.prepareStatement(sellerProductsQuery);
                    stmt1.setString(1, sellerId);
                    rs1 = stmt1.executeQuery();
                    int sellerProducts = 0;
                    if (rs1.next()) {
                        sellerProducts = rs1.getInt("seller_products");
                    }
            %>
            <div id="chart_div"></div>
        
            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
            <script type="text/javascript">
                google.charts.load("current", {packages:["corechart"]});
                google.charts.setOnLoadCallback(drawChart);
        
                function drawChart() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Seller');
                    data.addColumn('number', 'Number of Products');
                    data.addRow(['Seller Products', <%= sellerProducts %>]);
                    data.addRow(['Other Products', <%= totalProducts - sellerProducts %>]);
        
                    var options = {
                        'title': 'Products Posted by Seller vs. Other Products',
                        'width': 600,
                        'height': 400,
                        is3D: true
                    };
        
                    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
            </script>
            <% } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close connections
                try {
                    if (rs1 != null) rs1.close();
                    if (stmt1 != null) stmt1.close();
                    if (conn1 != null) conn1.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } %>
        </div>
        
        <%
            String sql2 = "SELECT * FROM user WHERE user_id = ?";
            stmt = conn.prepareStatement(sql2);
            stmt.setString(1, user_id);
            rs = stmt.executeQuery();
            if (rs.next()) {
        %>
        <h2>Transaction Table for Seller ID: <%= session.getAttribute("userID") %></h2>
    <table>
        <tr>
            <th>Transaction ID</th>
            <th>Buyer ID</th>
            <th>Product ID</th>
            <!-- Add more columns as needed -->
        </tr>
        <%
            Connection conn3 = null;
            PreparedStatement stmt3 = null;
            ResultSet rs3 = null;
            try {
                // Establish connection to the database
                Class.forName("org.mariadb.jdbc.Driver");
                conn3 = DriverManager.getConnection("jdbc:mariadb://localhost:3305/resell_hub", "root", "root");

                // Query to fetch transactions for the seller ID
                String sellerId = (String) session.getAttribute("userID");
                String sql3 = "SELECT * FROM transactions1 WHERE seller_id = ?";
                stmt3 = conn3.prepareStatement(sql3);
                stmt3.setString(1, sellerId);
                rs3 = stmt3.executeQuery();

                // Iterate through the result set and display data in table rows
                while (rs3.next()) {
        %>
        <tr>
            <td><%= rs3.getString("transaction_id") %></td>
            <td><%= rs3.getString("buyer_id") %></td>
            <td><%= rs3.getString("product_id") %></td>
            <!-- Add more columns as needed -->
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close connections
                try {
                    if (rs3 != null) rs3.close();
                    if (stmt3 != null) stmt3.close();
                    if (conn3 != null) conn3.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
        <!-- Display User Information -->
        <section>
            <h3 align="center">User Information</h3><br><hr>
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" class="form-control" id="firstName" value="<%= rs.getString("first_name") %>" disabled>
            </div>
            <div class="form-group">
                <label for="middleName">Middle Name:</label>
                <input type="text" class="form-control" id="middleName" value="<%= rs.getString("middle_name") %>" disabled>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" class="form-control" id="lastName" value="<%= rs.getString("last_name") %>" disabled>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" value="<%= rs.getString("email") %>" disabled>
            </div>
            <div class="form-group">
                <label for="contactNo">Contact No:</label>
                <input type="text" class="form-control" id="contactNo" value="<%= rs.getString("contact_no") %>" disabled>
            </div>
            <div class="form-group">
                <label for="branch">Branch:</label>
                <input type="text" class="form-control" id="branch" value="<%= rs.getString("branch") %>" disabled>
            </div>
        </section>
    </div>
    <br><br>
    <!-- Change Password Section -->
    <div class="container">
        <!-- Recent Activity Section -->
        <section>
            <h3 align="center">Your Products</h3><br><hr>
            <% 
                // Fetch recent activity (products) where the seller_id matches the user's ID
                String productsSQL = "SELECT * FROM products WHERE seller_id = ? AND sold_out = false";
                PreparedStatement productsStmt = conn.prepareStatement(productsSQL);
                productsStmt.setString(1, user_id);
                ResultSet productsRS = productsStmt.executeQuery();
            %>
            <div class="row">
                <% 
                    while (productsRS.next()) {
                        int productId = productsRS.getInt("product_id"); // Get product ID for each product
                        PreparedStatement pstmtImage = conn.prepareStatement("SELECT image FROM Images WHERE product_id = ? ");
                        pstmtImage.setInt(1, productId);
                        ResultSet rsImage = pstmtImage.executeQuery();
                        String imgBase64 = "";
                        if (rsImage.next()) {
                            Blob imageBlob = rsImage.getBlob("image");
                            if (imageBlob != null) {
                                byte[] imgData = imageBlob.getBytes(1, (int) imageBlob.length());
                                imgBase64 = Base64.getEncoder().encodeToString(imgData);
                            }
                        }
                        String description = productsRS.getString("description");
                        if (description.length() > 20) {
                            description = description.substring(0, 20) + "...";
                        }
                %>
                <div class="col-md-3 mb-2">
                    <div class="card" style="width: 18rem;">
                        <img src="data:image/png;base64, <%= imgBase64 %>" class="card-img-top" alt="Product Image">
                        <div class="card-body">
                            <h5 class="card-title"><%= productsRS.getString("product_name") %></h5>
                            <p class="card-text">Product ID: <%= productsRS.getInt("product_id") %></p>
                            <p class="card-text"><%= description %><a href="" class="btn btn-link">more</a></p>
                            <p class="card-text">Price: $<%= productsRS.getDouble("price") %></p>
                            <button class="btn btn-warning sold-out-button" onclick="showSoldOutDialog('<%= productId %>', <%= productsRS.getDouble("price") %>);">Sold Out</button>
                        </div>
                    </div>
                </div>
                <% } // End of while loop %>
            </div>
        </section>
        <br><br>
        <!-- Recent Activity Section -->
        <!-- Saved Items Section -->
        <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        %>
    </div>
    <div id="soldOutDialog" class="dialog">
        <span class="close-icon" onclick="closeSoldOutDialog()">&#10006;</span> <!-- Close icon -->
        <form action="transaction_process.jsp" method="POST" id="soldOutForm">
            <label for="product">Product ID:</label>
            <input type="text" id="productId" name="productId" required>
            <label for="buyerId">Buyer ID:</label>
            <input type="text" id="buyerId" name="buyerId" required>
            <label for="closingPrice">Closing Price:</label>
            <input type="text" id="closingPrice" name="closingPrice" required>
            <button type="submit">Submit</button>
        </form>
    </div>
    <script>
        function showSoldOutDialog(productId, price) {
            if (productId == null || productId === "") {
                console.log("Product ID is invalid:", productId);
                return;
            }
            if (price == null || price === "") {
                console.log("Price is invalid:", price);
                return;
            }
            var parsedProductId = parseInt(productId);
            var parsedPrice = parseFloat(price);
            if (isNaN(parsedProductId)) {
                console.log("Failed to parse Product ID:", productId);
                return;
            }
            if (isNaN(parsedPrice)) {
                console.log("Failed to parse Price:", price);
                return;
            }
            document.getElementById('productId').value = parsedProductId;
            document.getElementById('closingPrice').value = parsedPrice;
            document.getElementById('soldOutDialog').style.display = 'block';
        }

        function closeSoldOutDialog() {
            document.getElementById('soldOutDialog').style.display = 'none';
        }
    </script>
</body>
</html>
