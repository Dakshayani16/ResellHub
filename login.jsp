<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> --%>
<%@ page import="java.util.Enumeration,java.sql.*" %>

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
        body {
            font-family: 'Poppins', sans-serif; /* Use Poppins font */
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
        footer {
            background-color: #FD5F04; 
            height: 100px,
            color: #000;
            text-align: center;
            padding: 100px 0;
        }
#login-form {
    margin: 50px auto;
    width: 400px;
    padding-top: 20px;
    padding-right: 1px;
    padding-bottom: 20px;
    padding-left: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}


#login-form h2 {
    margin-top: 0;
    margin-bottom: 20px;
}

#login-form input[type="text"],
#login-form input[type="password"],
#login-form input[type="submit"] {
    box-sizing: border-box; /* Include padding and border in the width */
    width: calc(100% - 22px); /* Adjusted width */
    margin-bottom: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
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

#login-form input[type="submit"] {
    background-color: #333;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
}


        
    </style>
</head>
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

   
<div class="container">
    <form id="login-form" action="login_process.jsp" method="post">
        <h2>Login</h2>
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" class="btn btn-warning" value="Login">
        <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
    </form>
    
</div>
<%   String message= (String) request.getParameter("message"); %>

<%

    if(message!=null){ %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>Alert!</strong> <%= message %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>
    <footer>
        <div class="container">
            <p>&copy; 2024 VJTI Resell Hub. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
