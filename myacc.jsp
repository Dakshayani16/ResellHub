<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, your_package_name.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Account - VJTI Resell Hub</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
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
        .container {
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

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #333;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #555;
        }

        .saved-items {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .item {
            width: calc(33.33% - 10px);
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            box-sizing: border-box;
        }

        .item img {
            width: 100%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .item h4 {
            margin: 0;
            font-size: 16px;
            color: #333;
        }

        .item p {
            margin: 10px 0;
            color: #666;
        }

        .item button {
            width: 48%;
            padding: 8px;
            border: none;
            border-radius: 5px;
            background-color: #333;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
        }

        .item button:hover {
            background-color: #555;
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
                <li><a href="abc.jsp">My Account</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </div>
    </nav>

    <!-- Main Content Section -->
    <div class="container">
        <%
            // Fetch user information from the database
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                int userId = Integer.parseInt(request.getParameter("user_id")); // Get user ID from request
                conn = DriverManager.getConnection("your_database_connection_url", "username", "password");
                String sql = "SELECT * FROM user WHERE user_id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                rs = stmt.executeQuery();
                
                if (rs.next()) {
                    // Create a User object and populate it with fetched data
                    User user = new User();
                    user.setUserId(rs.getInt("user_id"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setMiddleName(rs.getString("middle_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setEmail(rs.getString("email"));
                    user.setContactNo(rs.getString("contact_no"));
                    user.setBranch(rs.getString("branch"));
        %>
        <h2>Welcome, <%= user.getFirstName() %>!</h2>
        
        <!-- Display User Information -->
        <section>
            <h3>User Information</h3>
            <p>First Name: <%= user.getFirstName() %></p>
            <p>Middle Name: <%= user.getMiddleName() %></p>
            <p>Last Name: <%= user.getLastName() %></p>
            <p>Email: <%= user.getEmail() %></p>
            <p>Contact No: <%= user.getContactNo() %></p>
            <p>Branch: <%= user.getBranch() %></p>
        </section>

        <!-- Change Password Section -->
        <section>
            <h3>Change Password</h3>
            <form action="ChangePasswordServlet" method="post"> <!-- Assuming you have a servlet to handle password change -->
                <!-- Your form fields here -->
            </form>
        </section>

        <!-- Recent Activity Section -->
        <section>
            <h3>Recent Activity</h3>
            <!-- Display recent activity, such as listings, purchases, messages, etc. -->
        </section>

        <!-- Saved Items Section -->
        <section>
            <h3>Saved Items</h3>
            <!-- Display saved items here -->
        </section>
        <%
                }
            } catch (Exception e) {
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

    <!-- Footer Section -->
    <%@ include file="footer.jsp" %> <!-- Assuming you have a footer.jsp -->
</body>
</html>
