<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>\
<%@ page import="java.util.Base64" %>

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
        }

        #search button {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            height: 50%;
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
        }

        nav h1 {
            margin: 0;
            display: inline;
            float: left; /* Aligning the logo to the left */
        }

        /* Banner Section Styles */
        #banner {
            background-color: #f4f4f4;
            padding: 50px 0;
            text-align: center;
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
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <div class="container">
            <h1>VJTI Resell Hub</h1>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="explore.jsp">Explore</a></li>
                <li><a href="add_product.jsp">Post</a></li>
                <li><a href="profile.jsp">My Account</a></li>
                <% if(session.getAttribute("username")==null){ %>
                <li><a href="login.jsp">Login</a></li>
                <% }else{ %><li><a href="logout_process.jsp">Logout</a></li><% }%>
            </ul>
        </div>
    </nav>

    <!-- Banner Section -->
    <section id="banner">
        <div class="container">
            <h2>Welcome to VJTI Resell Hub</h2>
            <p>Buy and sell items near you. Discover great deals!</p>
        </div>
    </section>

    <section id="search">
        <div class="container">
            <form action="#" method="GET">
                <input type="text" name="search" placeholder="Search...">
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>
    </section>

    <!-- Listings Section -->
    <section id="listings">
        <div class="container">
            <% 
            Connection conn = null;
            try {
                Class.forName("org.mariadb.jdbc.Driver");
                // conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
                 conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
            } catch (Exception e) {
                out.print(e);
            }
            
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                pstmt = conn.prepareStatement("SELECT p.product_id, p.product_name, p.price, p.description, i.image FROM Products p INNER JOIN Images i ON p.product_id = i.product_id WHERE p.product_id IN (SELECT product_id FROM productcategories WHERE category_id = ?) LIMIT 2");
                
                // Iterate through product categories
                while (rs.next()) {
                    int categoryId = rs.getInt("category_id");
                    String categoryName = rs.getString("category");
                    int numItems = rs.getInt("no_of_items");
                    
                    // Display category details
                    %>
                    <div class="row mb-4">
                        <div class="col">
                            <h1><%= categoryName %></h1>
                            <h3>Over <%= numItems %> items</h3>
                        </div>
                    </div>
                    <div class="row">
                    <% 
                    
                    // Set category ID parameter for prepared statement
                    pstmt.setInt(1, categoryId);
                    ResultSet rsProducts = pstmt.executeQuery();
                    
                    // Iterate through products for the category
                    while (rsProducts.next()) {
                        String productName = rsProducts.getString("product_name");
                        int price = rsProducts.getInt("price");
                        String description = rsProducts.getString("description");
                        Blob imageBlob = rsProducts.getBlob("image");
                        
                        // Convert image blob to base64
                        byte[] imgData = imageBlob.getBytes(1, (int) imageBlob.length());
                        String imgBase64 = Base64.getEncoder().encodeToString(imgData);
                        
                        // Display product details
                        %>
                        <div class="col-md-3 mb-2">
                            <div class="card" style="width: 18rem;">
                                <img src="data:image/jpeg;base64, <%= imgBase64 %>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%= productName %></h5>
                                    <p class="card-text"><%= description.substring(0, Math.min(description.length(), 20)) %>...<a href="" class="btn btn-link">more</a></p>
                                    <a href="#" class="btn btn-primary">Rs. <%= price %></a>
                                </div>
                            </div>
                        </div>
                        <% 
                    }
                    
                    // Close products result set
                    rsProducts.close();
                    %>
                    </div>
                    <div class="row justify-content-end">
                        <div class="col-auto">
                            <a href="listing.jsp?category=<%= categoryId %>" class="btn btn-link">More</a>
                        </div>
                    </div>
                    <% 
                }
                
                // Close categories result set
                rs.close();
            } catch (Exception e) {
                out.print(e);
            } finally {
                // Close connection in finally block
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    out.print(e);
                }
            }
            %>
        </div>
    </section>
    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2024 VJTI Resell Hub. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
