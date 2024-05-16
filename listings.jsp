<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration,java.sql.*" %>
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
        /* Add your custom CSS styles here */
        .dropdown-menu {
            display: none;
            font-family: 'Poppins', sans-serif;
            height: 40px; /* Set the height */
            margin: 4px; /* Set the margin */
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

        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
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

        /* Search Section Styles */
        #search {
            background-color: #f4f4f4;
            padding: 20px 0;
            text-align: center;
        }

        #searchForm {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #searchInput,
        #search button {
            height: 40px; /* Set the height */
            margin: 4px; /* Set the margin */
            margin-top: 4px;
        }

        #searchInput {
            padding: 10px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
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
            margin-top: 4px;
        }

        .row{
            align-items: center;
            justify-content: center;
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

<section id="listings">
    <div class="container">
        <%  
        Connection conn = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            // conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/resell_hub", "root", "root");
        
            String categoryName = "";
            int categoryId = 0;
        
            String categoryIdParam = request.getParameter("category");
            String categoryNameParam = request.getParameter("categoryName");
        
            if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                categoryId = Integer.parseInt(categoryIdParam);
        
                PreparedStatement stmt = conn.prepareStatement("SELECT category FROM product_category WHERE category_id = ?");
                stmt.setInt(1, categoryId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    categoryName = rs.getString("category");
                }
            } else if (categoryNameParam != null && !categoryNameParam.isEmpty()) {
                categoryName = java.net.URLDecoder.decode(categoryNameParam, "UTF-8");
        
                PreparedStatement stmt1 = conn.prepareStatement("SELECT category_id FROM product_category WHERE category = ?");
                stmt1.setString(1, categoryName);
                ResultSet rs = stmt1.executeQuery();
                if (rs.next()) {
                    categoryId = rs.getInt("category_id");
                }
            }
        
          
                
        %>
        <div class="row mb-4">
            <div class="col">
                <h1>Search result for category "<%= categoryName %>"</h1>
<h3></h3>
            </div>
        </div>
        <div class="row">
            <%  
                PreparedStatement pstmtProducts = conn.prepareStatement("SELECT product_id FROM productcategories WHERE category_id = ?");
                pstmtProducts.setInt(1, categoryId);
                ResultSet rsProducts = pstmtProducts.executeQuery();

                while (rsProducts.next()) {
                    int productId = rsProducts.getInt("product_id");

                    PreparedStatement pstmtProductDetails = conn.prepareStatement("SELECT product_name, price, description FROM Products WHERE product_id = ?");
                    pstmtProductDetails.setInt(1, productId);
                    ResultSet rsProductDetails = pstmtProductDetails.executeQuery();

                    if (rsProductDetails.next()) {
                        String productname = rsProductDetails.getString("product_name");
                        int price = rsProductDetails.getInt("price");
                        String description = rsProductDetails.getString("description");
                        if (description.length() > 20) {
                            description = description.substring(0, 20) + "...";
                        }

                        PreparedStatement pstmtImage = conn.prepareStatement("SELECT image FROM Images WHERE product_id = ?");
                        pstmtImage.setInt(1, productId);
                        ResultSet rsImage = pstmtImage.executeQuery();
                        String imgBase64 = "";
                        if (rsImage.next()) {
                            Blob imageBlob = rsImage.getBlob("image");
                            if(imageBlob!=null){
                                byte[] imgData = imageBlob.getBytes(1, (int) imageBlob.length());
                                imgBase64 = Base64.getEncoder().encodeToString(imgData);
                            }
                            
                        }
            %>
            <!-- Card for product -->
            <div class="col-md-3 mb-2">
                <div class="card" style="width: 18rem;">
                    <img src="data:image/png;base64, <%= imgBase64 %>" class="card-img-top" alt="Product Image">
                    <div class="card-body">
                        <h5 class="card-title"><%= productname %></h5>
                        <p class="card-text"><%= description %><a href="" class="btn btn-link">more</a></p>
                        <a href="singleItem.jsp?item=<%= productId %>" class="btn btn-primary">Rs. <%= price %></a>
                    </div>
                </div>
            </div>
            
            <%  
                    }
                }
            %>
        </div>
      
        <%  
                
            } catch (Exception e) {
                out.print(e);
                e.printStackTrace();
            } finally { // Add this finally block
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
