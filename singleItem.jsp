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
        .row{
    justify-content: center;
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
        .text-container {
        min-width: 200px; /* Minimum width for the div */
        min-height: 273px;
        padding: 20px; /* Add padding for better visualization */
        font-size: 18px; /* Adjust the font size of the text */
        
    }
    a {
    color: inherit; /* Use the color inherited from its parent */
    text-decoration: none; /* Optional: Remove underline */
}
        .user-circle {
        width: 80px; /* Adjust the size of the circle */
        height: 80px; /* Adjust the size of the circle */
        border-radius: 50%; /* Make it a circle */
        background-color: #ff5733; /* Change the color as desired */
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 24px; /* Adjust the font size of the letter */
        color: white; /* Color of the letter */
        font-weight: bold; /* Make the letter bold */
        margin-left: 20px;
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
                <% }else{ %><li><a href="logout_process.jsp">Logout</a></li><% }%>
            </ul>
        </div>
    </nav>

    <!-- Banner Section -->
    <%
    String product_id = (String)request.getParameter("item");
    String addFav = request.getParameter("addFav");
    String userrated = (String)request.getParameter("userrate");
    String curr_user= (String)session.getAttribute("userID");
    boolean fav=false;
    Connection conn = null;
		ResultSet result=null;
		try{
      Class.forName("org.mariadb.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
        	// conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
        
        }catch(Exception e){out.print(e+"");}
    if(addFav!=null){
          String favquery="INSERT INTO favourites (user_id,product_id) VALUES (?,?);";
         
        try {
          
            PreparedStatement fpst = conn.prepareStatement(favquery);
             fpst.setString(1,curr_user);
          fpst.setString(2,product_id);
           fpst.executeUpdate(); 
          
        } catch (Exception e) {
            out.println("Error: " + e);
      }}

      if(userrated!=null){
          String ratedquery="INSERT INTO reviews (posted_by,product_id, rating) VALUES (?,?,?);";
         
        try {
          
            PreparedStatement rppst = conn.prepareStatement(ratedquery);
             rppst.setString(1,curr_user);
          rppst.setString(2,product_id);
          rppst.setString(3,userrated);
           rppst.executeUpdate(); 
          
        } catch (Exception e) {
            out.println("Error: " + e);
      }}

    PreparedStatement ps = conn.prepareStatement("SELECT product_name, seller_id, condition_id, description, price FROM Products WHERE product_id = ?");
    ps.setString(1, ""+product_id);
    ResultSet rs = ps.executeQuery();
    
    String product_name = "";
    String seller_id = "";
    int condition_id = 0;
    String description = "";
    double price = 0.0;
    
    if (rs.next()) {
        product_name = rs.getString("product_name");
        seller_id = rs.getString("seller_id");
        condition_id = rs.getInt("condition_id");
        description = rs.getString("description");
        price = rs.getDouble("price");
    }
    
    PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM user WHERE user_id = ?");
    ps2.setString(1, seller_id);
    ResultSet rs2 = ps2.executeQuery();
    
    String seller_name = "";
    String email = "";
    String contact_no = "";
    String branch= "";
    
    
    if (rs2.next()) {
        seller_name = rs2.getString("first_name") +" "+ rs2.getString("last_name");
        email = rs2.getString("email");
        contact_no = rs2.getString("contact_no");
        branch= rs2.getString("branch");
        
    }
    
    PreparedStatement ps3 = conn.prepareStatement("SELECT buy_year, used_for, description FROM condition_of_product WHERE condition_id = ?");
    ps3.setInt(1, condition_id);
    ResultSet rs3 = ps3.executeQuery();
    
    String buy_year = "";
    String used_for = "";
    String condition_description = "";
    
    if (rs3.next()) {
        buy_year = ""+rs3.getInt("buy_year");
        used_for = rs3.getString("used_for");
        condition_description = rs3.getString("description");
    }
    String url="start_convo_process.jsp?seller_id="+seller_id;

    // Rating
     String ratquery = "SELECT AVG(rating) AS average_rating FROM reviews WHERE product_id = ?";
     PreparedStatement rstmt = conn.prepareStatement(ratquery);
         rstmt.setString(1, ""+product_id);
        
        // Execute the query
        ResultSet rs4 = rstmt.executeQuery();
        int averageRating=0;
        // Retrieve the average rating from the result set
        if (rs4.next()) {
            averageRating = (int) Math.floor(rs4.getDouble("average_rating"));
        }


        String ratquery2 = "SELECT rating FROM reviews WHERE posted_by= ? and product_id = ?";
     PreparedStatement rstmt2 = conn.prepareStatement(ratquery2);
         rstmt2.setString(1, ""+curr_user);
        rstmt2.setString(2, ""+product_id);
        // Execute the query
        ResultSet rs6 = rstmt2.executeQuery();
        int user_rate=0;
        boolean rated=false;
        // Retrieve the average rating from the result set
        if (rs6.next()) {
            user_rate=rs6.getInt("rating");
            rated=true;
        }



        String queryfav = "SELECT COUNT(*) AS count FROM favourites WHERE user_id = ? AND product_id = ?";
        PreparedStatement psfav = conn.prepareStatement(queryfav);
        psfav.setString(1, curr_user);
        psfav.setString(2, product_id);
        ResultSet rs5 = psfav.executeQuery();

        // Check if the result set contains any rows
        if (rs5.next()) {
            int count = rs5.getInt("count");
            fav = (count > 0);
        }


    PreparedStatement pstmtImage = conn.prepareStatement("SELECT image FROM Images WHERE product_id = ?");
    int productId = Integer.parseInt(product_id);
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

    conn.close();
%>

    <!-- Listings Section -->
    <!-- Listings Section -->
<section id="listings">
  <div class="container">

    

    
    <div class="row">
      <!-- Ratings -->
      <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Ratings</h5>
            <!-- Insert your rating mechanism here (e.g., stars or progress bar) -->
            
            <div class="ratings">
                 <%-- Display filled stars for i times --%>
                <% for (int j = 0; j < averageRating; j++) { %>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                      <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                    </svg>
                <% } %>
                
                <%-- Display lined stars for (5 - i) times --%>
                <% for (int j = 0; j < (5 - averageRating); j++) { %>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                      <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
                    </svg>
                <% } %>
              </div>
            <!-- Example of a heart icon for marking as favorite -->
           <% if(fav){ %>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
              </svg>
           <% }else{ %>
           <a href="singleItem.jsp?addFav=k&item=<%= product_id %>">
           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
              <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
            </svg></a>
               <% } %>         
      <div class="row">
          <div class="col-md-12">
              <!-- Product Name -->
              <h1><%=product_name%></h1>
          </div>
      </div>
      <div class="row">
          <!-- Images -->
          <div class="col-md-6">
              <div class="card mb-3">
                  <img src="data:image/png;base64, <%= imgBase64 %>" class="card-img-top" alt="Product Image">
              </div>
              <div class="card mb-3">
                  <div class="card-body">
                      <h5 class="card-title">Ratings</h5>
                      <div class="ratings">
                          <!-- Example using stars -->
                          <span class="fa fa-star checked"></span>
                          <span class="fa fa-star checked"></span>
                          <span class="fa fa-star checked"></span>
                          <span class="fa fa-star"></span>
                          <span class="fa fa-star"></span>
                      </div>
                  </div>
              </div>
          </div>
          <!-- Description and Seller -->
          <div class="col-md-6">
              <div class="card mb-3">
                  <div class="card-body">
                      <h3 class="card-text">Proposed Price: Rs.<%=price%>/-</h3>
                      <p class="card-text text-container"><%=description%></p>
                    
                      <h3 class="card-text">Condition</h3>
                      <p class="card-text"><%=condition_description%></p>
                      <p class="card-text"><small class="text-muted">Used for <%=used_for%> year</small></p>
                  </div>
              </div>
              <div class="card mb-3">
                  <div class="card-body">
                      <h3 class="ps-2 card-title">Seller</h3>
                      <div class="row g-0">
                          <div class="col-md-4">
                              <div class="user-circle">U</div>
                          </div>
                          <div class="col-md-8">
                              <div class="card-body">
                                  <h5 class="card-title"><%=seller_name%></h5>
                                  <p class="card-text">VJTI, <%=branch%></p>
                                  <p class="card-text"><%=contact_no%></p>
                                  <a href="<%=url%>" class="btn btn-primary">Message</a>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
    </div>
    <div class="row">
      <!-- Ratings -->
      
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Your rating for the product</h5>
            <!-- Insert your rating mechanism here (e.g., stars or progress bar) -->
            <% if(rated){ %>
            <div class="ratings">
                 <%-- Display filled stars for i times --%>
                <% for (int j = 0; j < user_rate; j++) { %>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                      <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                    </svg>
                <% } %>
                
                <%-- Display lined stars for (5 - i) times --%>
                <% for (int j = 0; j < (5 - user_rate); j++) { %>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                      <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
                    </svg>
                <% } %>
              </div>
              <% }else{ %>
                   <% for (int j = 0; j < 5; j++) { %>
                    <a href="singleItem.jsp?userrate=<%= j+1 %>&item=<%=product_id%>" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                      <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
                    </svg></a>
                <% } }%>

          </div>
        </div>
      
      
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
