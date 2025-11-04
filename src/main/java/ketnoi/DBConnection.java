/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ketnoi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class DBConnection {
        
    private static final String URL = "jdbc:mysql://localhost:3306/quizsystem"; 
    private static final String USER = "root";
    private static final String PASSWORD = "123456"; 

    
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("SUCCESS!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return conn;
    }
    public static void closeConnection(Connection con) {
    if (con != null) {
        try {
            con.close();
            System.out.println("Closed connect database!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

}
