<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.io.ByteArrayInputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="javax.servlet.http.Part"%>
<%@ page import="javax.servlet.annotation.MultipartConfig"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>

<html><body>
<%

     boolean isMultipart = ServletFileUpload.isMultipartContent(request);
     if(isMultipart){
        try {
    String product_name = request.getParameter("product_name");
    String priceString = request.getParameter("price");
int price = (priceString != null && !priceString.isEmpty()) ? Integer.parseInt(priceString) : 0;

    String condition_description = request.getParameter("condition_description");
    String buy_yearst = request.getParameter("buy_year");
int buy_year = (buy_yearst != null && !buy_yearst.isEmpty()) ? Integer.parseInt(buy_yearst) : 0;
    String description = request.getParameter("description");
    String[] categories = request.getParameterValues("category[]");
    int condition_id = 0;
    out.print(""+product_name+priceString+condition_description);
    int user_id = Integer.parseInt((String) session.getAttribute("userID"));

    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
    String insertProductConditionQuery = "INSERT INTO condition_of_product (buy_year, description) VALUES (?, ?)";
    PreparedStatement productStmt1 = conn.prepareStatement(insertProductConditionQuery, Statement.RETURN_GENERATED_KEYS);
    productStmt1.setInt(1, buy_year);
    productStmt1.setString(2, condition_description);
    int affectedRows = productStmt1.executeUpdate();

    if (affectedRows > 0) {
        ResultSet generatedKeys = productStmt1.getGeneratedKeys();
        if (generatedKeys.next()) {
            condition_id = generatedKeys.getInt(1);
        } 
    }

    String insertProductQuery = "INSERT INTO products (product_name, seller_id, condition_id, description, price) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement productStmt = conn.prepareStatement(insertProductQuery, Statement.RETURN_GENERATED_KEYS);
    productStmt.setString(1, product_name);
    productStmt.setInt(2, user_id);
    productStmt.setInt(3, condition_id);
    productStmt.setString(4, description);
    productStmt.setInt(5, price);
    productStmt.executeUpdate();

    ResultSet generatedKeys = productStmt.getGeneratedKeys();
    int productId = 0;
    if (generatedKeys.next()) {
        productId = generatedKeys.getInt(1);
    }
    
    Statement stmt = conn.createStatement();
    for (String category : categories) {
        ResultSet rs = stmt.executeQuery("SELECT category_id FROM product_category WHERE category='" + category + "'");
        if (rs.next()) {
            int category_id = rs.getInt("category_id");
            stmt.executeUpdate("INSERT INTO productcategories (product_id, category_id) VALUES (" + productId + "," + category_id + ")");
        }
    }

    Part filePart = request.getPart("image");
    if (filePart != null) {
        BufferedImage originalImage = ImageIO.read(filePart.getInputStream());
        BufferedImage resizedImage = new BufferedImage(320, 320, BufferedImage.TYPE_INT_RGB);
    resizedImage.createGraphics().drawImage(
            originalImage.getScaledInstance(320, 320, java.awt.Image.SCALE_SMOOTH), 0, 0, null);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(resizedImage, "jpg", baos);
        baos.flush();
        byte[] imageBytes = baos.toByteArray();
        baos.close();

        String insertImageQuery = "INSERT INTO images (product_id, image) VALUES (?, ?)";
        PreparedStatement imageStmt = conn.prepareStatement(insertImageQuery);
        imageStmt.setInt(1, productId);
        imageStmt.setBytes(2, imageBytes);
        imageStmt.executeUpdate();
    } else {
        throw new ServletException("No file uploaded or file size is zero.");
    }
     
    // response.setIntHeader("Refresh", 5);
    // response.sendRedirect("index.jsp?message=Product added!");

    conn.close();
} catch (ClassNotFoundException | SQLException | IOException | ServletException e) {
    out.print(""+e);
    e.printStackTrace();
}
}else{

     }
%>


