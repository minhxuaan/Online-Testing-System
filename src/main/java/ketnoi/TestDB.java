/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ketnoi;

import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class TestDB {
    public static void main(String[] args) throws SQLException {
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            System.out.println("SUCCESS!");
        } else {
            System.out.println("Error!");
        }
    }
}
