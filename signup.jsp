<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration - VJTI Resell Hub</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script>
        function validateForm() {
    var firstName = document.getElementsByName('first_name')[0].value;
    var lastName = document.getElementsByName('last_name')[0].value;
    var email = document.getElementsByName('email')[0].value;
    var username = document.getElementsByName('username')[0].value;
    var password = document.getElementsByName('password')[0].value;
    var confirmPassword = document.getElementsByName('confpassword')[0].value;

    // Check if any required field is empty
    if (firstName.trim() === '' || lastName.trim() === '' || email.trim() === '' || username.trim() === '' || password.trim() === '' || confirmPassword.trim() === '') {
        alert('Please fill in all required fields.');
        return false;
    }

    // Check if password and confirm password match
    if (password !== confirmPassword) {
        alert('Password and Confirm Password do not match.');
        return false;
    }

    // Check if password is at least 6 characters long and contains at least one special character
    if (password.length < 6 || !/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
        alert('Password must be at least 6 characters long and contain at least one special character.');
        return false;
    }

    return true;
}
    </script>
    
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
    </style>
</head>
<body>
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
        <h2 align="center">Registration</h2>
        <form action="registration_process.jsp" method="POST" onsubmit="return validateForm()">
        <form action="registration_process.jsp" method="POST" onsubmit="return validateForm()">
            <input type="text" class="form-control" name="first_name" placeholder="First Name" required>
            <input type="text" class="form-control" name="middle_name" placeholder="Middle Name">
            <input type="text" name="last_name" class="form-control" placeholder="Last Name" required>
            <input type="email" name="email" class="form-control" placeholder="Email Address" required><br>
            <input type="tel" name="contact_no" class="form-control" placeholder="Contact Number"><br>
            <input type="text" name="branch" class="form-control" placeholder="Branch" required><br><hr>
            <input type="text" name="username" class="form-control" placeholder="Username" required>
            <input type="password" name="password" class="form-control" placeholder="Password" required><br>
            <input type="password" name="confpassword" class="form-control" placeholder="Confirm Password" required><br>
             <div class="d-grid gap-2 col-6 mx-auto">
  <button class="btn btn-warning" type="submit">Register</button>
  <a href="index.jsp" class="btn btn-dark"><button class="btn btn-dark" type="button">Cancel</button></a>
</div>
        </form></div>
        <br><br>
        <div class="row">
        <div class="col-md-5"></div>
        <div class="col-4">
            Already have an account? <a href="login.jsp" style="color: blue">Log in</a>
</div>
 <div class="col-md-3"></div></div>
        
        
   
   <br><br><br>
    <footer>
        <div class="container1">
            <p>&copy; 2024 VJTI Resell Hub. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
