<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product - VJTI Resell Hub</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        nav {
            background-color: #333;
            color: #fff;
            padding: 30px 0;
            text-align: right;
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

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }

        h2 {
            margin-top: 0;
            margin-bottom: 20px;
            text-align: center;
        }

        form {
            width: 100%;
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
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }
        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #333;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #555;
        }

        .login-link {
            text-align: center;
        }

        .login-link a {
            color: #333;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        /* Image Upload Styles */
        .image-upload {
            margin-bottom: 20px;
        }

        .image-preview {
            width: 100%;
            height: auto;
            margin-bottom: 20px;
        }
        .container1 {
            width: 80%;
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

        <div class="container1">
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

    <div class="container">
        <h2>Add Product</h2>
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
            <button type="submit">Add Product</button>
        </form>
        <div class="login-link">
            <a href="sell.jsp">Cancel</a>
        </div>
    </div>

    <footer>
        <div class="container1">
            <p>&copy; 2024 VJTI Resell Hub. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
