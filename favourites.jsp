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
        .bg-orange {
            background-color: #FD5F04 !important; /* Orange background color */
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
            background-color: #FD5F04; 
            height: 100px,
            color: #000;
            text-align: center;
            padding: 100px 0;
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
        
        
        
            <h1><img src="https://t4.ftcdn.net/jpg/03/04/45/39/360_F_304453978_iDgX3VrXdHzgN4GrhLqgRxe1ILgEUUX3.jpg"  width=200 height=190>VJTI Resell Hub</h1>

        
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="explore.jsp">Explore</a></li>
                <li><a href="add_product.jsp">Post</a></li>

                <li><a href="profile.jsp">My Account</a></li>

                <% if(session.getAttribute("username")==null){ %>
                <li><a href="login.jsp">Login</a></li>
                <% }else{ %><li><a href="conversations.jsp">Chats</a></li><li><a href="favourites.jsp">Favourites</a></li><li><a href="logout_process.jsp">Logout</a></li><% }%>
            </ul>

        
        </div>
    </nav>
<br><br><br><br><br><br><br>


    <!-- Banner Section -->
   <header class="bg-orange py-2">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white mb-2">Mark them for later!</h1>
                                <p class="lead fw-normal text-white-50 mb-4">Go back to items you liked earlier....</p>
                                
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" fill="currentColor" class="bi bi-hearts" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M4.931.481c1.627-1.671 5.692 1.254 0 5.015-5.692-3.76-1.626-6.686 0-5.015m6.84 1.794c1.084-1.114 3.795.836 0 3.343-3.795-2.507-1.084-4.457 0-3.343M7.84 7.642c2.71-2.786 9.486 2.09 0 8.358-9.487-6.268-2.71-11.144 0-8.358"/>
</svg>
                    </div>
                </div>
            </header>
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
                            <a href="singleItem.jsp?item=<%= productId %>" class="btn btn-warning">Rs. <%= price %></a>
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
