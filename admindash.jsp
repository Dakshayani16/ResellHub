<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
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

        /* Footer Styles */
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            font-family: 'Poppins', sans-serif;
        }
    </style>
    <!-- Include Google Charts library -->



    <%
// Java code to fetch category and no_of_items from product_category table
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("org.mariadb.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");

    // SQL query to retrieve category and no_of_items from product_category table
    String sql = "SELECT category, no_of_items FROM product_category";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    // Lists to store category and no_of_items
    List<String> categories = new ArrayList<>();
    List<Integer> itemCounts = new ArrayList<>();

    // Fetching data from result set
    while (rs.next()) {
        categories.add(rs.getString("category"));
        itemCounts.add(rs.getInt("no_of_items"));
    }
%>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    // Create the data table
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Category');
    data.addColumn('number', 'No. of Items');

    // Populate data rows using Java variables
    <% for (int i = 0; i < categories.size(); i++) { %>
        data.addRow(['<%= categories.get(i) %>', <%= itemCounts.get(i) %>]);
    <% } %>

    // Set chart options
    var options = {
      'title': 'Number of Items in Each Category',
      'width': 600,
      'height': 400,
      is3D: true,
    };

    // Instantiate and draw the chart
    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }

</script>
<%
}
catch (Exception e) {
    e.printStackTrace();
} finally{
    // Close resources
    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
}
%>


<!-- HTML for the chart -->


<%
Connection conn1 = null;
Statement stmt = null;
ResultSet rs1 = null;

        // Initialize a map to store branch-wise user data
        Map<String, Integer> branchUsers = new HashMap<>();

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn1 = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");

            String sql2 = "SELECT branch, COUNT(*) AS total_users FROM user GROUP BY branch";
            stmt = conn1.createStatement();
            rs1 = stmt.executeQuery(sql2);

            // Iterate through the result set and populate the branchUsers map
            while (rs1.next()) {
                String branch = rs1.getString("branch");
                int totalUsers = rs1.getInt("total_users");
                branchUsers.put(branch, totalUsers);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs1 != null) rs1.close();
            if (stmt != null) stmt.close();
            if (conn1 != null) conn1.close();
        }
    %>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", {packages:['corechart']});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = new google.visualization.DataTable();
        data.addColumn('string', 'Branch');
        data.addColumn('number', 'Total Users');

        // Populate data rows using Java variables
        <% for (Map.Entry<String, Integer> entry : branchUsers.entrySet()) { %>
            data.addRow(['<%= entry.getKey() %>', <%= entry.getValue() %>]);
        <% } %>

            var options = {
                title: "Number of Users in Each Branch",
                width: 600,
                height: 400,
                bar: {groupWidth: "95%"},
                legend: { position: "none" },
            };
            var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
            chart.draw(data, options);
        }
    </script>


<!-- -------------------------------- -->
<%
Connection conn2 = null;
Statement stmt2 = null;
ResultSet rs2 = null;

// Initialize a map to store date-wise product count data
Map<String, Integer> productCounts = new HashMap<>();

try {
    Class.forName("org.mariadb.jdbc.Driver");
    conn2 = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");

    String sql2 = "SELECT DATE(posted_at) AS date, COUNT(*) AS total_product FROM products GROUP BY DATE(posted_at)";
    stmt2 = conn2.createStatement();
    rs2 = stmt2.executeQuery(sql2);

    // Iterate through the result set and populate the productCounts map
    while (rs2.next()) {
        String date = rs2.getString("date");
        int totalProduct = rs2.getInt("total_product");
        productCounts.put(date, totalProduct);
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // Close resources
    try {
        if (rs2 != null) rs2.close();
        if (stmt2 != null) stmt2.close();
        if (conn2 != null) conn2.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
}
%>



<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawLineChart);

    function drawLineChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Date');
        data.addColumn('number', 'Total Products');

        <% for (Map.Entry<String, Integer> entry : productCounts.entrySet()) { %>
            data.addRow(['<%= entry.getKey() %>', <%= entry.getValue() %>]);
        <% } %>

        var options = {
            title: 'Total Products Posted Over Time',
            width: 800,
            height: 600,
            curveType: 'function',
            legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
        chart.draw(data, options);
    }
</script>

</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <div class="container">
            <h1>VJTI Resell Hub</h1>
            <ul>
                <li><a href="admindash.jsp">Dashboard</a></li>
                <li><a href="adminuserdata.jsp">Users</a></li>
                <li><a href="adminproductdata.jsp">Products</a></li>

                <li><a href="admintransactiondata.jsp">Transactions</a></li>
                <li><a href="logout_process.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>

    <!-- Banner Section -->
    <section id="banner">
        <div class="container">
            <h2>Welcome Admin</h2>
            <p>Get insights on Resell Hub working!</p>
        </div>

    </section>
    <div classes="container">
        <div id="chart_div"></div>
        <div id="columnchart_values" style="width: 900px; height: 300px;"></div>
        <div id="curve_chart" style="width: 100%; height: 500px;"></div>

    </div>
   
   
<%-- Dashboard --%>
    

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2024 VJTI Resell Hub. All rights reserved.</p>
        </div>
    </footer>
    
    
</body>
</html>
