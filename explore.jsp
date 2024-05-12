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
    /* Add your custom CSS styles here */

.dropdown-menu {
    display: none;
    font-family: 'Poppins', sans-serif;
    height: 40px; /* Set the height */
    margin: 4px; /* Set the margin */
}

.dropdown-menu.show {
    display: block;
}

.dropdown-submenu:hover .dropdown-menu {
    display: block;
    position: absolute;
    top: 0;
    left: 100%;
}

.dropdown-submenu .dropdown-submenu:hover .dropdown-menu {
    top: 0;
    left: 100%;
}

/* Global Styles */
body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
}

/* Navigation Bar Styles */
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

        /* Banner Section Styles */
        #banner {
            background-color: #FD5F04; /* Orange background color */
            padding: 50px 0;
            text-align: center;
            color: #FFF; /* White font color */
        }
        #banner h2 {
            margin: 0;
            font-size: 36px;
        }
        #banner p {
            margin-top: 20px;
            font-size: 18px;
        }

        /* Search Section Styles */
        #search {
            background-color: #FD5F04; /* Orange background color */
            padding: 20px 0;
            text-align: center;
            color: #FFF; /* White font color */
        }
        #search form {
            display: inline-block;
        }
        #search input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 1px solid #fff; /* White border */
            border-radius: 5px;
            font-size: 16px;
            margin: 4px;
            font-family: 'Poppins', sans-serif;
        }
        #search button {
            background-color: #FFF; /* White background */
            color: #FD5F04; /* Orange font color */
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-family: 'Poppins', sans-serif;
            margin-right: 4px;
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
    <section id="banner">
        <div class="container">
            <h2>Welcome to VJTI Resell Hub</h2>
            <p>Buy and sell items near you. Discover great deals!</p>
        </div>
    </section>

   <!-- Search Section -->
<section id="search">
    <div class="container">
        <div class="row">
            <div class="col-md-12"> <!-- Adjust column width as needed -->
                <form id="searchForm" action="filteredExplore.jsp" method="GET">
                    <input type="hidden" name="category" id="category" value="All">
                    <input type="hidden" name="priceRange" id="priceRange" value="All">
                    
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <button class="btn btn-outline-secondary dropdown-toggle" type="button" name="category" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="allDropdownBtn">All</button>
                            <div class="dropdown-menu">
                                
                                <!-- Dropdown options here -->
                                <a class="dropdown-item category" name="category" href="#" data-category="All">All</a>
<a class="dropdown-item category" name="category" href="listings.jsp" data-category="Stationery">Stationery</a>
<a class="dropdown-item category" name="category" href="#" data-category="Electronics">Electronics</a>
<a class="dropdown-item category" name="category" href="#" data-category="Clothing">Clothing</a>
<a class="dropdown-item category" name="category" href="#" data-category="Lab Equipment">Lab Equipment</a>
<a class="dropdown-item category" name="category" href="#" data-category="Books">Books</a>
<a class="dropdown-item category" name="category" href="#" data-category="Sports Equipment">Sports Equipment</a>
<a class="dropdown-item category" name="category" href="#" data-category="Musical Instruments">Musical Instruments</a>
<a class="dropdown-item category" name="category" href="#" data-category="Furniture">Furniture</a>
<a class="dropdown-item category" name="category" href="#" data-category="Appliances">Appliances</a>
<a class="dropdown-item category" name="category" href="#" data-category="Art Supplies">Art Supplies</a>
<a class="dropdown-item category" name="category" href="#" data-category="Shoes">Shoes</a>
<a class="dropdown-item category" name="category" href="#" data-category="Bags & Backpacks">Bags & Backpacks</a>
<a class="dropdown-item category" name="category" href="#" data-category="Cosmetics">Cosmetics</a>
<a class="dropdown-item category" name="category" href="#" data-category="Kitchenware">Kitchenware</a>
<a class="dropdown-item category" name="category" href="#" data-category="Mobile Accessories">Mobile Accessories</a>
<a class="dropdown-item category" name="category" href="#" data-category="Watches">Watches</a>
<a class="dropdown-item category" name="category" href="#" data-category="Sunglasses">Sunglasses</a>
<a class="dropdown-item category" name="category" href="#" data-category="Fitness Equipment">Fitness Equipment</a>
<a class="dropdown-item category" name="category" href="#" data-category="Gaming Accessories">Gaming Accessories</a>
<a class="dropdown-item category" name="category" href="#" data-category="Home Decor">Home Decor</a>

                               
                            </div>
                        </div>
                        <input type="text" class="form-control" name="search" id="searchInput" placeholder="Search...">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="submit"><i class="fas fa-search"></i></button>
                        </div>
                        <div class="dropdown"> <!-- Add margin-top -->
                            <button id="filterIcon" class="btn btn-outline-secondary dropdown-toggle" type="button" name="priceRange" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-filter"></i>
                            </button>
                            <div id="filterDropdowns" class="dropdown-menu" aria-labelledby="filterIcon">
                                <div class="dropdown-item" data-category="All" href="#">By Price - All</div>
                                
                                <a class="dropdown-item subprice" name="priceRange" href="#" data-category="0,50">Price up to ₹50</a>
                                <a class="dropdown-item subprice" name="priceRange" href="#" data-category="50,100">Price ₹50 - ₹100</a>
                                <a class="dropdown-item subprice" name="priceRange" href="#" data-category="100,200">Price ₹100 - ₹200</a>
                                <a class="dropdown-item subprice" name="priceRange" href="#" data-category="200,500">Price ₹200 - ₹500</a>
                                <a class="dropdown-item subprice" name="priceRange" href="#" data-category="500,500000">Price more than ₹500</a>
                                
                                
                                    <!-- Add more subprices as needed -->
                                
                            </div>
                        </div>
                    </div>
                </form>
            </div>
          
        </div>
    </div>
</section>



   <!-- Listings Section -->
   <section id="listings">
       <div class="container">
           <%  
               Connection conn = null;
               try {
                   Class.forName("org.mariadb.jdbc.Driver");
                  conn= DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
                    // conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
                   
                   Statement stmt = conn.createStatement();
                   ResultSet rs = stmt.executeQuery("SELECT category_id, category, no_of_items FROM product_category");
                
                   while (rs.next()) {
                       int categoryId = rs.getInt("category_id");
                       String categoryName = rs.getString("category");
                       int numofitem = rs.getInt("no_of_items");
                    //    out.print("k");
                    if(numofitem>0){

           %>
           <div class="row mb-4">
               <div class="col">
                   <h1><%= categoryName %></h1>
                   <h3>Over <%= numofitem %> items</h3>
               </div>
           </div>
           <div class="row">
               <%  
                   PreparedStatement pstmtProducts = conn.prepareStatement("SELECT product_id FROM productcategories WHERE category_id = ? LIMIT 4");
                   pstmtProducts.setInt(1, categoryId);
                   ResultSet rsProducts = pstmtProducts.executeQuery();

                   while (rsProducts.next()) {
                       int productId = rsProducts.getInt("product_id");

                       PreparedStatement pstmtProductDetails = conn.prepareStatement("SELECT product_name, price, description FROM Products WHERE product_id = ? AND sold_out = false");
pstmtProductDetails.setInt(1, productId);

                       ResultSet rsProductDetails = pstmtProductDetails.executeQuery();

                       if (rsProductDetails.next()) {
                           String productname = rsProductDetails.getString("product_name");
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
                        <h5 class="card-title"><%= productname %></h5>
                        <p class="card-text"><%= description %><a href="" class="btn btn-link">more</a></p>
                        <a href="singleItem.jsp?item=<%= productId %>" class="btn btn-warning">Rs. <%= price %></a>
                    </div>
                </div>
            </div>
            
               <%  
                       }
                   }               %>
           </div>
           <div class="row justify-content-end">
               <div class="col-auto">
                   <a href="listings.jsp?category=<%= categoryId %>" class="btn btn-link">More</a>
               </div>
           </div>
           <%  
                     } }
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
           %>
       </div>
   </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2024 VJTI Resell Hub. All rights reserved.</p>
        </div>
    </footer>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            $(".subprice").click(function(){
                var selectedSubprice = $(this).text();
                $("#filterIcon").html(selectedSubprice + ' <i class="fas fa-filter"></i>');
                // $("#allDropdownBtn").html(selectedSubprice);
                $("#filterDropdowns").removeClass("show");
            });
        });
        
    </script>
    <script>
        $(document).ready(function(){
            $(" .category").click(function(){
                // Get the text of the clicked dropdown item
                var selectedOption = $(this).text();
                
                // Update the text of the "All" dropdown button and the filter icon
                $("#allDropdownBtn").html(selectedOption + ' <i class="fas fa-filter"></i>');
                // $("#filterIcon").html(selectedOption + ' <i class="fas fa-filter"></i>');
                
                // Show the sub-options of the "All" dropdown and hide others
                $("#allDropdown").addClass("show");
                $("#priceDropdown, #brandDropdown, #categoryDropdown").removeClass("show");
            });
        });
        
    </script>
    <script>
        $(document).ready(function(){
            $(".category").click(function(e){
                e.preventDefault(); // Prevent the default behavior of the link
                
                // Get the category value from the data-category attribute
                var selectedCategory = $(this).data('category');
                
                // Update the category input value
                $("#category").val(selectedCategory);
            });
        });
   
    
        $(document).ready(function(){
    $(".subprice").click(function(e){
        e.preventDefault(); // Prevent the default behavior of the link
        
        // Get the price range category from the data-category attribute
        var selectedPriceRange = $(this).data('category');
        
        // Update the price range input value
        $("#priceRange").val(selectedPriceRange);
        
        // Optionally, you can submit the form here if needed
        // $("#searchForm").submit();
    });
});



</script>
<script>
    function redirectToCategory(categoryName) {
        const encodedCategoryName = encodeURIComponent(categoryName);
        window.location.href = `listings.jsp?category=${encodedCategoryName}`;
    }

    document.addEventListener("DOMContentLoaded", function () {
        // Attach event listener to all elements with class "category"
        const dropdownItems = document.querySelectorAll(".category");
        dropdownItems.forEach(item => {
            item.addEventListener("click", function (e) {
                e.preventDefault(); // Prevent the default behavior of the link
                
                // Get the category name from the data-category attribute
                const categoryName = this.getAttribute("data-category");
                
                // Redirect to listings.jsp with the selected category name
                redirectToCategory(categoryName);
            });
        });
    });
  
</script>

</body>
</html>