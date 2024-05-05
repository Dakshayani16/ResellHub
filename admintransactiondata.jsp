<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VJTI Resell Hub - Home</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Add your custom CSS styles here */
        .dropdown-menu {
            display: none;
            font-family: 'Poppins', sans-serif;
        }
        .dropdown-menu.show {
            display: block;
        }
        .dropdown-submenu:hover .dropdown-menu {
            display: block;
            position: absolute;
            top: 0;
            left: 100%;
        }
        .dropdown-submenu .dropdown-submenu:hover .dropdown-menu {
            top: 0;
            left: 100%;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <style>
        /* Global Styles */
        /* Search Section Styles */
        #search {
            background-color: #f4f4f4;
            padding: 20px 0;
            text-align: center;
        }

        #search form {
            display: inline-block;

        }

        #search input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            margin: 4px;
            font-family: 'Poppins', sans-serif;
        }

        #search button {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-family: 'Poppins', sans-serif;
            margin: 4px;
        }

        /* Navigation Bar Styles */
        nav {
            background-color: #333;
            color: #fff;
            padding: 30px 0;
            text-align: right;
            font-family: 'Poppins', sans-serif;
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
            color: #fff;
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
        }
        nav h1 {
            margin: 0;
            display: inline;
            float: left; /* Aligning the logo to the left */
            font-family: 'Poppins', sans-serif;
        }

        /* Banner Section Styles */
        #banner {
            background-color: #f4f4f4;
            padding: 50px 0;
            text-align: center;
            font-family: 'Poppins', sans-serif;
        }
        #banner h2 {
            margin: 0;
            font-size: 36px;
        }
        #banner p {
            margin-top: 20px;
            font-size: 18px;
        }

        /* Listings Section Styles */
        #listings {
            padding: 50px 0;
            font-family: 'Poppins', sans-serif;
        }
        .listings-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            grid-gap: 20px;
        }
        .listing-item img {
            max-width: 100%;
            height: auto;
        }
        .listing-item h3 {
            margin-top: 10px;
        }
        .listing-item p {
            margin-top: 5px;
        }

        /* Footer Styles */
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body>
 <!-- Navigation Bar -->
    <nav>
        <div class="container">
            <h1>VJTI Resell Hub</h1>
            <ul>
                <li><a href="admindash.jsp">Dashboard</a></li>
                <li><a href="adminuserdata.jsp">Users</a></li>
                <li><a href="adminproductdata.jsp">Products</a></li>

                <li><a href="admintransactiondata.jsp">Transactions</a></li>
                <li><a href="logout_process.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>

    <!-- Banner Section -->
    <section id="banner">
        <div class="container">
        
            <h2>Welcome Admin</h2>
            <p>Get insights on Resell Hub working!</p>
        </div>
    </section>

    <div class="container">
    <br>
        <h1>Transaction Management</h1>
        <hr><br>
        <!-- Display User Table -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>Buyer Name</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Close Price</th>
                    <th>Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Fetch and display user records -->
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Connect to the database
                        Class.forName("org.mariadb.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");

                        // Execute the query to fetch user records
                        String query = "SELECT * FROM transactions";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(query);

                        // Display user records in a table
                        while (rs.next()) {
                            int transaction_id = rs.getInt("transaction_id");
                            int product_id = rs.getInt("product_id");
                            int buyer_id = rs.getInt("buyer_id");
                            double close_price = rs.getDouble("close_price");
                            String date= rs.getString("date");
                            
                            String sellerName = "";
                            PreparedStatement sellerStmt = conn.prepareStatement("SELECT CONCAT(first_name, ' ', last_name) AS seller_name FROM user WHERE user_id = ?");
                            sellerStmt.setInt(1, buyer_id);
                            ResultSet sellerRS = sellerStmt.executeQuery();
                            if (sellerRS.next()) {
                                sellerName = sellerRS.getString("seller_name");
                            }

                            String pname = "";
                            PreparedStatement pstmt = conn.prepareStatement("SELECT product_name AS seller_name FROM products WHERE product_id = ?");
                            pstmt.setInt(1, product_id);
                            ResultSet prs = pstmt.executeQuery();
                            if (prs.next()) {
                                pname = prs.getString("seller_name");
                            }

                %>
                <tr>
                    <td><%= transaction_id %></td>
                    <td><%= sellerName %></td>
                    <td><%= product_id %></td>
                    <td><%= pname %></td>
                    <td><%= close_price %></td>
                    <td><%= date %></td>
                    
                    <td>
                        <!-- Delete button -->
                        <form method="post" action="deleteUser.jsp">
                            <input type="hidden" name="userID" value="<%= transaction_id %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                        <!-- Update button -->
                        <form method="post" action="updateUser.jsp">
                            <input type="hidden" name="userID" value="<%= transaction_id %>">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.print(e);
                    } finally {
                        // Close resources
                        if (rs != null) {
                            try {
                                rs.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (stmt != null) {
                            try {
                                stmt.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (conn != null) {
                            try {
                                conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <footer>
        <div class="container">
            <p>&copy; 2024 VJTI Resell Hub. All rights reserved.</p>
        </div>
    </footer>
    
</body>
</html>
