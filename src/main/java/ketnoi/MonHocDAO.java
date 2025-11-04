/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ketnoi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class MonHocDAO {
    private Connection conn;

    public MonHocDAO() {
        conn = DBConnection.getConnection();
    }

    // Lấy tất cả môn học
    public List<MonHoc> getAllSubjects() {
        List<MonHoc> list = new ArrayList<>();
        String sql = "SELECT * FROM subjects";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                MonHoc subject = new MonHoc();
                subject.setSubjectId(rs.getInt("subject_id"));
                subject.setName(rs.getString("name"));
                list.add(subject);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Lấy môn học theo ID
    public MonHoc getSubjectById(int subjectId) {
        MonHoc subject = null;
        String sql = "SELECT * FROM subjects WHERE subject_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, subjectId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    subject = new MonHoc();
                    subject.setSubjectId(rs.getInt("subject_id"));
                    subject.setName(rs.getString("name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return subject;
    }

    // Thêm môn học mới
    public boolean addSubject(MonHoc subject) {
        String sql = "INSERT INTO subjects (name) VALUES (?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, subject.getName());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Xoá môn học
    public boolean deleteSubject(int subjectId) {
        String sql = "DELETE FROM subjects WHERE subject_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, subjectId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Cập nhật tên môn học
    public boolean updateSubject(MonHoc subject) {
        String sql = "UPDATE subjects SET name = ? WHERE subject_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, subject.getName());
            stmt.setInt(2, subject.getSubjectId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}