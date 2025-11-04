/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ketnoi;

/**
 *
 * @author Admin
 */
public class TestHash {
     public static void main(String[] args) {
        String adminPass = "123@";
        String studentPass = "123";

        String hashedAdminPass = HashPassword.hashPassword(adminPass);
        String hashedstudentPass = HashPassword.hashPassword(studentPass);

        System.out.println("Hashed Admin Password: " + hashedAdminPass);
        System.out.println("Hashed Customer Password: " + hashedstudentPass);
    }
}
