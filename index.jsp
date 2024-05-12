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
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }
        .dropdown-menu {
            display: none;
            font-family: 'Poppins', sans-serif;
        }
        .dropdown-menu.show {
            display: block;
        }
        .dropdown-submenu:hover .dropdown-menu {
            display: block;
            top: 0;
            left: 100%;
        }
        .dropdown-submenu .dropdown-submenu:hover .dropdown-menu {
            top: 0;
            left: 100%;
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
        .cloud-image {
            width: 300px; /* Adjust the width of the image */
            height: auto;
            mask-image: url('https://i.imgur.com/PO2p4hc.png'); /* Cloud-shaped mask image */
            -webkit-mask-image: url('https://i.imgur.com/PO2p4hc.png'); /* For Safari */
            mask-size: contain;
            -webkit-mask-size: contain; /* For Safari */
            mask-repeat: no-repeat;
            -webkit-mask-repeat: no-repeat; /* For Safari */
            mask-position: center;
            -webkit-mask-position: center; /* For Safari */
            background-color: #f0f0f0; /* Background color behind the image */
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
        .banner {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            background-color: #FD5F04; /* Orange background color */
            color: #FFF; /* White font color */
            padding: 20px;
        }
        .banner h1 {
            margin-top: 0;
            font-size: 36px;
        }
        .banner p {
            font-size: 20px;
            line-height: 1.5;
        }
        .banner img {
            max-width: 100%;
            height: auto;
            border-radius: 10px; /* Rounded corners for the image */
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
<header class="bg-orange py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white mb-2">Welcome to Resell Hub</h1>
                                <p class="lead fw-normal text-white-50 mb-4">Discover a wide range of products at amazing prices.</p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-dark btn-lg px-4 me-sm-3" href="signup.jsp">Register</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="login.jsp">Login</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="https://img.freepik.com/free-vector/shopping-paper-bags-icon-isolated_18591-82221.jpg" alt="..." /></div>
                    </div>
                </div>
            </header>
            <!-- Features section-->
            <section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">A better way to start selling.</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-collection"></i></div>
                                    <h2 class="h5">Resell your stuff</h2>
                                    <p class="mb-0">Dive into our platform's user-friendly interface to effortlessly list your items for resale, reaching eager buyers in no time.</p>
                                </div>
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-building"></i></div>
                                    <h2 class="h5">Buy cheaper</h2>
                                    <p class="mb-0"> Discover unbeatable deals on a plethora of products, from electronics to fashion, allowing you to save big on every purchase.</p>
                                </div>
                                <div class="col mb-5 mb-md-0 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                                    <h2 class="h5">Explore</h2>
                                    <p class="mb-0"> Embark on a journey through our diverse array of categories, catering to every need and interest imaginable, ensuring something for everyone.</p>
                                </div>
                                <div class="col h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                                    <h2 class="h5">Connect</h2>
                                    <p class="mb-0"> Forge meaningful connections with sellers from all corners, fostering a dynamic marketplace where transactions flourish seamlessly.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Testimonial section-->
            <div class="py-5 bg-light">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-10 col-xl-7">
                            <div class="text-center">
                                <div class="fs-4 mb-4 fst-italic">"We want this Project to be useful to the community and connect the consumers with sellers accross the campus!"</div>
                                <div class="d-flex align-items-center justify-content-center">
                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                    <div class="fw-bold">
                                        Dakshayani
                                        <span class="fw-bold text-primary mx-1">/</span>
                                        Anisha
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
    <!-- Footer -->
    <footer>
        <div class="container">
            <p style="color:#000">&copy; 2024 VJTI Resell Hub. All rights reserved.</p>
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
