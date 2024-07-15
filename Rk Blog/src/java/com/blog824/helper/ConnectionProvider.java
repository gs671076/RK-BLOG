package com.blog824.helper;

import java.sql.*;

/**
 *
 * @author gs671
 */
public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/blog824";
                con = DriverManager.getConnection(url, "root", "gaurav@123");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

}
