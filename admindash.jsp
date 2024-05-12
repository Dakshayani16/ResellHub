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

        .container1 {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .chart-container {
            width: 1000px;
            height: 400px;
            margin: 10px;
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
        .container {
            display: flex;
        }

        .column {
            flex: 1;
            padding: 10px;
            
            box-sizing: border-box;
        }

        .content {
            max-width: 100%;
            max-height: 100%;
         
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
            background-color: #FD5F04; 
            height: 100px,
            color: #000;
            text-align: center;
            padding: 100px 0;
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
    // conn = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
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
      'width': 450,
      'height': 400,
      is3D: true,
      chartArea: {left:0}
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
PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
        // Initialize a map to store branch-wise user data
        Map<String, Integer> branchUsers = new HashMap<>();
        int transactionCount=0, userCount=0,productCount=0;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            // conn1 = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
conn1 = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
            String sql2 = "SELECT branch, COUNT(*) AS total_users FROM user GROUP BY branch";
            stmt = conn1.createStatement();
            rs1 = stmt.executeQuery(sql2);

            // Iterate through the result set and populate the branchUsers map
            while (rs1.next()) {
                String branch = rs1.getString("branch");
                int totalUsers = rs1.getInt("total_users");
                branchUsers.put(branch, totalUsers);
            }
        
            String transactionQuery = "SELECT COUNT(*) AS transaction_count FROM transactions";
        preparedStatement = conn1.prepareStatement(transactionQuery);
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            transactionCount = resultSet.getInt("transaction_count");
        }

        // Query to get user count
        String userQuery = "SELECT COUNT(*) AS user_count FROM user";
        preparedStatement = conn1.prepareStatement(userQuery);
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            userCount = resultSet.getInt("user_count");
        }

        // Query to get product count
        String productQuery = "SELECT COUNT(*) AS product_count FROM products";
        preparedStatement = conn1.prepareStatement(productQuery);
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            productCount = resultSet.getInt("product_count");
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
                width: 450,
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
    // conn2 = DriverManager.getConnection("jdbc:mariadb://localhost:3305/mydatabase", "root", "root");
conn2 = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
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
            width: 600,
            height: 500,
            curveType: 'function',
            legend: { position: 'bottom',
             },
             
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
            <h1><img src="https://t4.ftcdn.net/jpg/03/04/45/39/360_F_304453978_iDgX3VrXdHzgN4GrhLqgRxe1ILgEUUX3.jpg"  width=200 height=190>VJTI Resell Hub</h1>

        
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
    <%-- <section id="banner">
        <div class="container">
            <h2>Welcome Admin</h2>
            <p>Get insights on Resell Hub working!</p>
        </div>

    </section> --%>
    <script>
function convertToPdfAndDownload() {
  const contentDiv = document.getElementById('content');
contentDiv.style.width = '1200px'; // Adjust width as needed
  contentDiv.style.height = '800px';
  const options = {
    filename: 'output.pdf',
    html2canvas: { scale: 2 },
    jsPDF: { format: 'a4', orientation: 'landscape' } // Set orientation to 'landscape' for wider page
  };

  // Use html2pdf with custom configuration
  html2pdf()
    .from(contentDiv)
    .set(options)
    .save();
    
}
</script>

    <div class="container" id="content">
        <div class="column">
            <div class="content">
                <div id="chart_div"></div>
            
                <!-- Bar Chart -->
                <div id="columnchart_values"></div>
            </div>
        </div>
        <div class="column">
        <div class="row">
        <div class="col">
             <div class="card text-bg-light mb-3" style="max-width: 10rem;">
            <div class="card-header">No. of Products</div>
            <div class="card-body">
                <h2 align="center" class="card-title"><%= productCount%></h2>
                
            </div>
            </div>
        </div>
        <div class="col">
                    <div class="card text-bg-light mb-3" style="max-width: 10rem;">
            <div class="card-header">No. of Users</div>
            <div class="card-body">
                <h2 align="center" class="card-title"><%= userCount%></h2> </div>
            </div>
        </div>
        <div class="col">
                    <div class="card text-bg-light mb-3" style="max-width: 15rem;">
            <div class="card-header">No. of Transactions</div>
            <div class="card-body">
               <h2 align="center" class="card-title"><%= transactionCount %></h2> </div>
            </div>
        </div>
        </div>
             <div id="curve_chart"></div>
        </div>
    </div>
  
   <br><br><br>
<%-- Dashboard --%>
 <div class="d-grid gap-2 col-6 mx-auto">   
<button class="btn btn-warning" onclick="convertToPdfAndDownload()">Download PDF</button>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
<br><br>
    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2024 VJTI Resell Hub. All rights reserved.</p>
        </div>
    </footer>
    
    
</body>
</html>
