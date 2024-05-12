<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration,java.sql.*" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VJTI Resell Hub - Home</title>
    <!-- Include Bootstrap CSS and Font Awesome -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
<% if(session.getAttribute("username")==null){ 
 
			String url="login.jsp?message="+"Please Login to Continue";
        	response.sendRedirect(url);
}
%>

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
                <% }else{ %><li><a href="conversations.jsp">Chats</a></li><li><a href="logout_process.jsp">Logout</a></li><% }%>
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
                   // conn= DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
                    conn= DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
                    String userID = (String)session.getAttribute("userID");
                    PreparedStatement pstmtFavourites = conn.prepareStatement("SELECT product_id FROM favourites WHERE user_id = ?");
                    pstmtFavourites.setString(1, userID);
                    ResultSet rsFavourites = pstmtFavourites.executeQuery();
  %> <div class="row mb-4"> <%
                    while (rsFavourites.next()) {
                        int productId = rsFavourites.getInt("product_id");

                        PreparedStatement pstmtProductDetails = conn.prepareStatement("SELECT product_name, price, description FROM Products WHERE product_id = ?");
                        pstmtProductDetails.setInt(1, productId);
                        ResultSet rsProductDetails = pstmtProductDetails.executeQuery();

                        if (rsProductDetails.next()) {
                            String productName = rsProductDetails.getString("product_name");
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
                            <h5 class="card-title"><%= productName %></h5>
                            <p class="card-text"><%= description %><a href="" class="btn btn-link">more</a></p>
                            <a href="singleItem.jsp?item=<%= productId %>" class="btn btn-primary">Rs. <%= price %></a>
                        </div>
                    </div>
                </div>
            
            <%  
                    }
                }
            } catch (Exception e) {
                out.print(e);
                e.printStackTrace();
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
            %></div>
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
