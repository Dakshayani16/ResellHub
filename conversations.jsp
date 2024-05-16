<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
                                <h1 class="display-5 fw-bolder text-white mb-2">Chat with ease!</h1>
                                <p class="lead fw-normal text-white-50 mb-4">Get Exciting deals with negotiations...</p>
                                
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>
  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9 9 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.4 10.4 0 0 1-.524 2.318l-.003.011a11 11 0 0 1-.244.637c-.079.186.074.394.273.362a22 22 0 0 0 .693-.125m.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6-3.004 6-7 6a8 8 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a11 11 0 0 0 .398-2"/>
</svg></div>
                    </div>
                </div>
            </header>

    <!-- Listings Section -->
    <section id="listings">
        <div class="container">
            <div class="row">
                <%
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("org.mariadb.jdbc.Driver");
                        //conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
                         conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/resell_hub", "root", "root");
                        // Get current user's ID from session
                        String currUserID = (String) session.getAttribute("userID");

                        // Fetch conversations where the current user is either the seller or the buyer
                        String query = "SELECT conversation_id, seller_id, buyer_id FROM conversation WHERE seller_id = ? OR buyer_id = ?";
                        pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, currUserID);
                        pstmt.setString(2, currUserID);
                        rs = pstmt.executeQuery();

                        // Iterate through each conversation
                        while (rs.next()) {
                            // out.print("k");
                            String conversationID = rs.getString("conversation_id");
                            String sellerID = rs.getString("seller_id");
                            String buyerID = rs.getString("buyer_id");

                            // Get the name of the other party (buyer or seller)
                            String otherPartyName = null;
                            if (sellerID.equals(currUserID)) {
                                PreparedStatement pstmtBuyer = conn.prepareStatement("SELECT first_name, last_name FROM user WHERE user_id = ?");
                                pstmtBuyer.setString(1, buyerID);
                                ResultSet rsBuyer = pstmtBuyer.executeQuery();
                                if (rsBuyer.next()) {
                                    otherPartyName = rsBuyer.getString("first_name") + " " + rsBuyer.getString("last_name");
                                }
                            } else {
                                PreparedStatement pstmtSeller = conn.prepareStatement("SELECT first_name, last_name FROM user WHERE user_id = ?");
                                pstmtSeller.setString(1, sellerID);
                                ResultSet rsSeller = pstmtSeller.executeQuery();
                                if (rsSeller.next()) {
                                    otherPartyName = rsSeller.getString("first_name") + " " + rsSeller.getString("last_name");
                                }
                            }
                                // out.print(otherPartyName);
                            // Display the conversation information
                            if (otherPartyName != null) { 
                %>
                <div class="col-md-4">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title"><%= otherPartyName %></h5><br><hr>
                            <!-- <p class="card-text">Conversation ID: <%= conversationID %></p> -->
                            <a href="chatpage.jsp?convo=<%= conversationID %>" class="btn btn-warning">View Conversation</a>
                        </div>
                    </div>
                </div>
                <%
                            }
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
                        if (pstmt != null) {
                            try {
                                pstmt.close();
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
            </div>
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
