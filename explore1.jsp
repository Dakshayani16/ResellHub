<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Explore Products</title>
</head>
<body>
    <h1>Explore Products</h1>
    <%
        // Dummy product data for demonstration
        List<String[]> products = (List<String[]>) request.getAttribute("products");
        for (String[] product : products) {
    %>
        <div>
            <h2><%= product[0] %></h2>
            <p>Description: <%= product[1] %></p>
            <p>Price: <%= product[2] %></p>
            <%-- Assume product[3] contains image data --%>
            <img src="data:image/jpeg;base64, <%= Base64.getEncoder().encodeToString(product[3].getBytes()) %>" alt="Product Image" style="max-width: 200px;">
            <!-- Add more fields as needed -->
            <hr>
        </div>
    <%
        }
    %>
</body>
</html>
