<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    /* Basic styling */
    body {
      font-family: Arial, sans-serif;
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
    .container {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
    }
    .chat-box {
      border: 1px solid #ccc;
      border-radius: 5px;
      overflow: hidden;
    }
    .chat-header {
      padding: 10px;
      border-bottom: 1px solid #ccc;
      display: flex;
      align-items: center;
    }
    .chat-header img {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      margin-right: 10px;
    }
    .chat-header h2 {
      margin: 0;
    }
    .chat-messages {
      padding: 20px;
      height: 300px; /* Set a fixed height or use overflow-y: auto; for scrolling */
      overflow-y: auto;
    }
    .message {
      margin-bottom: 20px;
    }
    .message.sent {
      text-align: right;
    }
    .message.received {
      text-align: left;
    }
    .message p {
      background-color: #f2f2f2;
      padding: 10px;
      border-radius: 10px;
      display: inline-block;
      max-width: 70%;
    }
    .message.sent p {
      background-color: #4CAF50;
      color: white;
    }
    .message.received p {
      background-color: #ddd;
    }
    .chat-footer {
      padding: 10px;
      border-top: 1px solid #ccc;
      display: flex;
      align-items: center;
    }
    .chat-footer input[type="text"] {
      flex: 1;
      padding: 10px;
      border-radius: 5px;
      border: 1px solid #ccc;
    }
    .chat-footer button {
      padding: 10px 20px;
      border: none;
      background-color: #4CAF50;
      color: white;
      border-radius: 5px;
      cursor: pointer;
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
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </div>
    </nav>

    <!-- Banner Section -->
    

    <!-- Listings Section -->
    <div class="container">
    <div class="chat-box">
      <div class="chat-header">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0khaUcbpblqXKUuxIpxyGB9VqRKmENQZWjbk8uXGEIg&s" alt="Receiver Profile Picture">
        <h2>Receiver Name</h2>
      </div>
      <div class="chat-messages">
        <div class="message sent">
          <p>Hey, how are you?</p>
        </div>
        <div class="message received">
          <p>I'm good, thanks! How about you?</p>
        </div>
        <!-- More chat messages here -->
      </div>
      <div class="chat-footer">
        <input type="text" placeholder="Type your message...">
        <button>Send</button>
      </div>
    </div>
  </div>
    

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2024 VJTI Resell Hub. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
