<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
        min-height: 400px;
        padding: 20px; /* Add padding for better visualization */
        font-size: 18px; /* Adjust the font size of the text */
        
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
    String product_id = request.getParameter("item");
    
    Connection conn = null;
		ResultSet result=null;
		try{Class.forName("org.mariadb.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");}catch(Exception e){out.print(e+"");}
    
    PreparedStatement ps = conn.prepareStatement("SELECT product_name, seller_id, condition_id, description, price FROM Products WHERE product_id = ?");
    ps.setString(1, product_id);
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
    conn.close();
%>

    <!-- Listings Section -->
    <section id="listings">
  <div class="container">
    <div class="row mb-4">
      <div class="col">
        <h1><%=product_name%></h1>
        
      </div>
    </div>
    <div class="row">
      <!-- Images -->
      <div class="col-md-6">
      <div id="carouselExampleIndicators" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://m.media-amazon.com/images/I/61O1ACXgWhS._AC_UF1000,1000_QL80_.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://m.media-amazon.com/images/I/61O1ACXgWhS._AC_UF1000,1000_QL80_.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://m.media-amazon.com/images/I/61O1ACXgWhS._AC_UF1000,1000_QL80_.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>

    </div>

      </div>
      <!-- Description -->
      <div class="col-md-6">
        <!-- Description content -->
        <h3>Proposed Price: Rs.<%=price%>/-</h3>
        
        <p class="text-container"><%=description%></p>
        <hr>
        <h3>Condition</h3>
        <p><%=condition_description%></p>
        <br>
        <%-- <p>Bought in <%=buy_year%></p> --%>
        <p class="card-text"><small class="text-body-secondary">Used for <%=used_for%> year</small></p><br>
      </div>
    </div>
    <div class="row">
      <!-- Ratings -->
      <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Ratings</h5>
            <!-- Insert your rating mechanism here (e.g., stars or progress bar) -->
            
            <div class="ratings">
              <!-- Example using stars -->
              <span class="fa fa-star checked"></span>
              <span class="fa fa-star checked"></span>
              <span class="fa fa-star checked"></span>
              <span class="fa fa-star"></span>
              <span class="fa fa-star"></span>
            </div>
    
            <!-- Example of a heart icon for marking as favorite -->
            <span class="fa fa-heart"></span>
            
          </div>
        </div>
      </div>
      <!-- Seller -->
      <div class="col-md-6">
        <div class="card mb-3" style="max-width: 540px;">
          <div class="row g-0">
            <h3 class="ps-2">Seller</h3>
            <div class="col-md-4">
              <div class="user-circle">U</div>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title"><%=seller_name%></h5>
                <p class="card-text">VJTI,<%=branch%></p>
                <p class="card-text"><%=contact_no%></p>
                <a href=<%=url%> class="btn btn-primary">Message</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2024 VJTI Resell Hub. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
