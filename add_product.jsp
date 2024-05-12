<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product - VJTI Resell Hub</title>
     <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
         a {
    color: inherit; /* Use the color inherited from its parent */
    text-decoration: none; /* Optional: Remove underline */
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
        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        
        .container1 {
            width: 70%;
            margin: 0 auto;
            height: 50%;
        }
        .category-checkboxes {
            margin-bottom: 20px;
        }

        .category-checkboxes label {
            margin-right: 20px;
        }
    </style>
</head>
<body>
<% if(session.getAttribute("username")==null){ 
 
			String url="login.jsp?message="+"Please Login to Continue";
        	response.sendRedirect(url);}
%>
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

    <div class="container1">
        <h2 align="center">Add Product</h2>
        <form action="AddProduct" method="POST" enctype="multipart/form-data">
            <input type="text" name="product_name" placeholder="Product Name" required>
            <input type="number" name="price" placeholder="Price" step="0.01" required>
            <textarea name="description" placeholder="Description" rows="4" required></textarea>
            <div class="category-checkboxes">
                <input type="checkbox" id="stationery" name="category" value="Stationery">
<label for="stationery">Stationery</label><br>

<input type="checkbox" id="electronics" name="category" value="Electronics">
<label for="electronics">Electronics</label><br>

<input type="checkbox" id="clothing" name="category" value="Clothing">
<label for="clothing">Clothing</label><br>

<input type="checkbox" id="lab_equipment" name="category" value="Lab Equipment">
<label for="lab_equipment">Lab Equipment</label><br>

<input type="checkbox" id="books" name="category" value="Books">
<label for="books">Books</label><br>

<input type="checkbox" id="sports_equipment" name="category" value="Sports Equipment">
<label for="sports_equipment">Sports Equipment</label><br>

<input type="checkbox" id="musical_instruments" name="category" value="Musical Instruments">
<label for="musical_instruments">Musical Instruments</label><br>

<input type="checkbox" id="furniture" name="category" value="Furniture">
<label for="furniture">Furniture</label><br>

<input type="checkbox" id="appliances" name="category" value="Appliances">
<label for="appliances">Appliances</label><br>

<input type="checkbox" id="art_supplies" name="category" value="Art Supplies">
<label for="art_supplies">Art Supplies</label><br>

<input type="checkbox" id="shoes" name="category" value="Shoes">
<label for="shoes">Shoes</label><br>

<input type="checkbox" id="bags_backpacks" name="category" value="Bags & Backpacks">
<label for="bags_backpacks">Bags & Backpacks</label><br>

<input type="checkbox" id="cosmetics" name="category" value="Cosmetics">
<label for="cosmetics">Cosmetics</label><br>

<input type="checkbox" id="kitchenware" name="category" value="Kitchenware">
<label for="kitchenware">Kitchenware</label><br>

<input type="checkbox" id="mobile_accessories" name="category" value="Mobile Accessories">
<label for="mobile_accessories">Mobile Accessories</label><br>

<input type="checkbox" id="watches" name="category" value="Watches">
<label for="watches">Watches</label><br>

<input type="checkbox" id="sunglasses" name="category" value="Sunglasses">
<label for="sunglasses">Sunglasses</label><br>

<input type="checkbox" id="fitness_equipment" name="category" value="Fitness Equipment">
<label for="fitness_equipment">Fitness Equipment</label><br>

<input type="checkbox" id="gaming_accessories" name="category" value="Gaming Accessories">
<label for="gaming_accessories">Gaming Accessories</label><br>

<input type="checkbox" id="home_decor" name="category" value="Home Decor">
<label for="home_decor">Home Decor</label><br>

            </div>
            <input type="file" name="image" accept="image/*" class="image-upload" required>

            <br><hr><h2>Give Condition of Product</h2><br>
            <input type="text" name="buy_year" placeholder="Product Bought in year" required>
            <textarea name="condition_description" placeholder="Description of its condition" rows="4" required></textarea>
            <div class="d-grid gap-2 col-6 mx-auto">
  <button class="btn btn-warning" type="submit">Add Product</button>
  <a href="sell.jsp" class="btn btn-dark"><button class="btn btn-dark" type="button">Cancel</button></a>
</div>
            
        </div>
        </form>
        
    </div>
<br><br><br>
    <footer>
        <div class="container1">
            <p>&copy; 2024 VJTI Resell Hub. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
