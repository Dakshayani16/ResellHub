<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset" pageEncoding="UTF-8" %>
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
            background-color: #FFF; /* White background */
            color: #000; /* Black font color */
            padding: 20px 0;
            text-align: right;
            
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
        }
        footer {
            background-color: #FD5F04; 
            height: 100px,
            color: #000;
            text-align: center;
            padding: 100px 0;
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
  .container-c {
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
    a {
    color: inherit; /* Use the color inherited from its parent */
    text-decoration: none; /* Optional: Remove underline */
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
<% if(session.getAttribute("username")==null){ 
 
			String url="login.jsp?message="+"Please Login to Continue";
        	response.sendRedirect(url);
}
%>
<%
    Connection conn = null;
		ResultSet result=null;
		try{Class.forName("org.mariadb.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/resell_hub", "root", "root");
          // conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
        
        }catch(Exception e){out.print(e+"");}
    
    
    String send_message = request.getParameter("send_message");
    String curr_user=  (String) session.getAttribute("userID");
    String conversationId = request.getParameter("convo");

    // Initialize sender_id and buyer_id variables
    String sellerId = "";
    
     String selectQuery2 = "SELECT seller_id FROM conversation WHERE conversation_id = ?;";
    try{ PreparedStatement pstmt = conn.prepareStatement(selectQuery2);
        pstmt.setString(1, conversationId);
        ResultSet rs = pstmt.executeQuery();
      if(rs.next()){
        sellerId=""+rs.getInt("seller_id");
      }
    }catch(Exception e){out.print(e);}

    String receivername="";
    String selectQuery3 = "SELECT first_name,last_name FROM user WHERE user_id = ?;";
    try{ PreparedStatement pstmt2 = conn.prepareStatement(selectQuery3);
        pstmt2.setString(1, sellerId);
        ResultSet rs = pstmt2.executeQuery();
      if(rs.next()){
        receivername=rs.getString("first_name")+" "+rs.getString("last_name");
      }
    }catch(Exception e){out.print(e);}
    
    
    if(send_message!=null){
      String query="INSERT INTO messages (conversation_id, sender_id, receiver_id, message) VALUES ( "+conversationId+","+ curr_user + ", " + sellerId + ", '" + send_message + "' );";
    try {
      
        PreparedStatement pst = conn.prepareStatement(query);
        pst.executeUpdate(); 
       
    } catch (Exception e) {
        out.println("Error: " + query);
    }}
%>

<body>
     <nav>
        <div class="container">
        
        
       
            <h1><a href="index.jsp"> <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"/>
</svg></a><img src="https://t4.ftcdn.net/jpg/03/04/45/39/360_F_304453978_iDgX3VrXdHzgN4GrhLqgRxe1ILgEUUX3.jpg"  width=200 height=190>VJTI Resell Hub</h1>

        
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
    <%
    
		
    // Get the conversation_id from request parameter
    ResultSet rs=null;
     String selectQuery = "SELECT sender_id, receiver_id, message, timestamp FROM messages WHERE conversation_id = ? ORDER BY timestamp ASC";
    try (PreparedStatement pstmt = conn.prepareStatement(selectQuery)) {
        pstmt.setString(1, conversationId);
        rs = pstmt.executeQuery();
        }catch(Exception e){out.print(e);}
        
    
%>



<!-- Chat container -->
 <!-- Listings Section -->
    <div class="container-c">
    <div class="chat-box">
      <div class="chat-header">
        
        <h2><%=receivername%></h2>
      </div>
      <div class="chat-messages">
    <%
        // Loop through the result set and display messages
        while (rs.next()) {
            String senderId = ""+rs.getInt("sender_id");
            String receiverId =""+ rs.getInt("receiver_id");
            String message = rs.getString("message");
            // out.print(""+senderId+receiverId+curr_user);
            if(senderId.equals(curr_user)){
    %>
        <div class="message sent">
          <p><%=message%></p>
        </div>
    <% }else{ %>
        <div class="message received">
          <p><%=message%></p>
        </div>
      <% } %>
      <%-- else end --%>
      <%
        }
    %>
    <%-- while end --%>        
      </div>

      <div class="chat-footer">
      <form method="post">
        <input type="text" width=20 name="send_message" placeholder="Type your message...">
        <input type="submit" class="btn btn-success" value="Send">
      </form>
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
