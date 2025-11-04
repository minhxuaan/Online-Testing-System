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
        String teacherPass = "123@";
        String studentPass = "123";

        String hashedTeacherPass = HashPassword.hashPassword(teacherPass);
        String hashedstudentPass = HashPassword.hashPassword(studentPass);

        System.out.println("Hashed Teacher Password: " + hashedTeacherPass);
        System.out.println("Hashed StudentPass Password: " + hashedstudentPass);
    }
}
