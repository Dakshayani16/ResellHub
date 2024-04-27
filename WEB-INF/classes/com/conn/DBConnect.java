package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    private static Connection conn = null;

    public static Connection getConn() {
        try {
            // Load the MariaDB JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            // Establish the database connection
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/resell_hub", "root", "AnishaNemade");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
