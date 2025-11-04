/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ketnoi;
import org.mindrot.jbcrypt.BCrypt;
/**
 *
 * @author Admin
 */
public class HashPassword {
public static String hashPassword(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt(12)); 
    }
public static boolean checkPassword(String plainPassword, String hashedPassword) {
        if (hashedPassword == null || !hashedPassword.startsWith("$2a$")) {
            throw new IllegalArgumentException("Mật khẩu mã hóa không hợp lệ");
        }
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}
