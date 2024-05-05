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
</head>
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
            <div class="row">
                <%
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("org.mariadb.jdbc.Driver");
                        //conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
                        conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/mydatabase", "root", "root");
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
                            <h5 class="card-title"><%= otherPartyName %></h5>
                            <p class="card-text">Conversation ID: <%= conversationID %></p>
                            <a href="chatpage.jsp?convo=<%= conversationID %>" class="btn btn-primary">View Conversation</a>
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
