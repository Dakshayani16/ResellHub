<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Account - VJTI Resell Hub</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h2 {
            text-align: center;
        }

        section {
            margin-bottom: 30px;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #333;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #555;
        }

        .saved-items {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .item {
            width: calc(33.33% - 10px);
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            box-sizing: border-box;
        }

        .item img {
            width: 100%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .item h4 {
            margin: 0;
            font-size: 16px;
            color: #333;
        }

        .item p {
            margin: 10px 0;
            color: #666;
        }

        .item button {
            width: 48%;
            padding: 8px;
            border: none;
            border-radius: 5px;
            background-color: #333;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
        }

        .item button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <!-- Your navigation bar content here -->
    </nav>

    <!-- Main Content Section -->
    <div class="container">
        <h2>Welcome, [User's Name]!</h2>
        
        <!-- Change Password Section -->
        <section>
            <h3>Change Password</h3>
            <form action="change_password_process.jsp" method="POST">
                <label for="old_password">Old Password:</label>
                <input type="password" id="old_password" name="old_password" required>
                <label for="new_password">New Password:</label>
                <input type="password" id="new_password" name="new_password" required>
                <label for="confirm_password">Confirm New Password:</label>
                <input type="password" id="confirm_password" name="confirm_password" required>
                <button type="submit">Change Password</button>
            </form>
        </section>

        <!-- Recent Activity Section -->
        <section>
            <h3>Recent Activity</h3>
            <!-- Display recent activity, such as listings, purchases, messages, etc. -->
        </section>

        <!-- Saved Items Section -->
        <section>
            <h3>Saved Items</h3>
            <div class="saved-items">
                <div class="item">
                    <img src="item1.jpg" alt="Item 1">
                    <h4>Product Name 1</h4>
                    <p>Description of the saved item 1.</p>
                    <button>View</button>
                    <button>Remove</button>
                </div>
                <div class="item">
                    <img src="item2.jpg" alt="Item 2">
                    <h4>Product Name 2</h4>
                    <p>Description of the saved item 2.</p>
                    <button>View</button>
                    <button>Remove</button>
                </div>
                <div class="item">
                    <img src="item3.jpg" alt="Item 3">
                    <h4>Product Name 3</h4>
                    <p>Description of the saved item 3.</p>
                    <button>View</button>
                    <button>Remove</button>
                </div>
            </div>
        </section>
    </div>

    <!-- Footer Section -->
    <footer>
        <!-- Your footer content here -->
    </footer>
</body>
</html>
