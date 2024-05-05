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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Add your custom CSS styles here */
        .dropdown-menu {
            display: none;
            font-family: 'Poppins', sans-serif;
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
    </style>
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
            margin: 4px;
            font-family: 'Poppins', sans-serif;
        }

        #search button {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-family: 'Poppins', sans-serif;
            margin: 4px;
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
            font-family: 'Poppins', sans-serif;
        }
        nav h1 {
            margin: 0;
            display: inline;
            float: left; /* Aligning the logo to the left */
            font-family: 'Poppins', sans-serif;
        }

        /* Banner Section Styles */
        #banner {
            background-color: #f4f4f4;
            padding: 50px 0;
            text-align: center;
            font-family: 'Poppins', sans-serif;
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
            font-family: 'Poppins', sans-serif;
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
        a {
    color: inherit; /* Use the color inherited from its parent */
    text-decoration: none; /* Optional: Remove underline */
}
        /* Footer Styles */
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            font-family: 'Poppins', sans-serif;
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
                <% }else{ %><li><a href="conversations.jsp">Chats</a></li><li><a href="logout_process.jsp">Logout</a></li><% }%>
            </ul>
        </div>
    </nav>

  <section id="banner">
    <div class="container">
        <div class="row align-items-center"> <!-- Align items vertically in the middle -->
         <div class="col-md-4"> </div>
            <div class="col-md-6"> <!-- Take 9 columns for the text -->
                <div class="d-flex align-items-center"> <!-- Align items horizontally in the middle -->
                    <div>
                        <h2>Welcome Admin</h2>
                        <p>Get insights on Resell Hub working!</p>
                    </div>
                </div>
            </div>
            <div class="col-md-2 text-end"> <!-- Take 3 columns for the heart icon and align it to the end -->
                <a href="conversations.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-chat-left-text-fill" viewBox="0 0 16 16">
  <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793zm3.5 1a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 2.5a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 2.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1z"/>
</svg><!-- Medium-sized heart icon --></a><a href="favourites.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/></a>
</svg>
            </div>
        </div>
    </div>
</section>

    <!-- Search Section -->
    <section id="search">
        <div class="container">
            <form id="searchForm" action="#" method="GET">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="allDropdownBtn">All</button>
                        <div class="dropdown-menu">
                            <!-- Dropdown options here -->
                            
                            <a class="dropdown-item category" href="#">Stationery</a>
                            <a class="dropdown-item category" href="#">Electronics</a>
                            <a class="dropdown-item category" href="#">Clothing</a>
                            <a class="dropdown-item category" href="#">Lab Equipment</a>
                            <a class="dropdown-item category" href="#">Books</a>
                            <a class="dropdown-item category" href="#">Sports Equipment</a>
                            <a class="dropdown-item category" href="#">Musical Instruments</a>
                            <a class="dropdown-item category" href="#">Furniture</a>
                            <a class="dropdown-item category" href="#">Appliances</a>
                            <a class="dropdown-item category" href="#">Art Supplies</a>
                            <a class="dropdown-item category" href="#">Shoes</a>
                            <a class="dropdown-item category" href="#">Bags & Backpacks</a>
                            <a class="dropdown-item category" href="#">Cosmetics</a>
                            <a class="dropdown-item category" href="#">Kitchenware</a>
                            <a class="dropdown-item category" href="#">Mobile Accessories</a>
                            <a class="dropdown-item category" href="#">Watches</a>
                            <a class="dropdown-item category" href="#">Sunglasses</a>
                            <a class="dropdown-item category" href="#">Fitness Equipment</a>
                            <a class="dropdown-item category" href="#">Gaming Accessories</a>
                            <a class="dropdown-item category" href="#">Home Decor</a>
                            
                        </div>
                    </div>
                    <input type="text" class="form-control" name="search" id="searchInput" placeholder="Search...">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit"><i class="fas fa-search"></i></button>
                        <div class="dropdown">
                            <button id="filterIcon" class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-filter"></i>
                            </button>
                            <div id="filterDropdowns" class="dropdown-menu" aria-labelledby="filterIcon">
                                <div class="dropdown-item" href="#">By Price - All</div>
                                
                                <a class="dropdown-item subprice" href="#">Price up to ₹50.1</a>
                                <a class="dropdown-item subprice" href="#">Price ₹50.1 - ₹100.2</a>
                                <a class="dropdown-item subprice" href="#">Price ₹100.2 - ₹200.3</a>
                                <a class="dropdown-item subprice" href="#">Price ₹200.3 - ₹500.4</a>
                                <a class="dropdown-item subprice" href="#">Price more than ₹500</a>
                                
                                    <!-- Add more subprices as needed -->
                                
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <!-- Listings Section -->
    <section id="listings">
        <div class="container">
            <div id="carouselExampleCaptions" class="carousel slide">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://www.bigissuenorth.com/wp-content/uploads/2019/05/lyc-campaigns-1600_0_bigissuenorth.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Find Clothes</h5>
                            <p>Some representative placeholder content for the first slide.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdtA5D7MjfSp3YdsSiMHPWDIULKrtk-1ANhzgNMAdTtnyvpd7mZGyu10ysljakLB7pJ9M&usqp=CAU" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Second slide label</h5>
                            <p>Some representative placeholder content for the second slide.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="https://5.imimg.com/data5/QU/LU/FF/SELLER-3590701/office-stationary-wholesale-500x500.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Third slide label</h5>
                            <p>Some representative placeholder content for the third slide.</p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
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
    
</body>
</html>
