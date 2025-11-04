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
public class DeThiDAO {
    private Connection conn;

    public DeThiDAO() {
        conn = DBConnection.getConnection();
    }

    // Thêm đề thi mới
    public boolean addExam(DeThi exam) {
        String sql = "INSERT INTO exams (title, description, created_by, subject_id, duration_minutes) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, exam.getTitle());
            stmt.setString(2, exam.getDescription());
            stmt.setInt(3, exam.getCreatedBy());
            stmt.setInt(4, exam.getSubjectId());
            stmt.setInt(5, exam.getDurationMinutes());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy tất cả đề thi
    public List<DeThi> getAllExams() {
        List<DeThi> list = new ArrayList<>();
        String sql = "SELECT * FROM exams ORDER BY created_at DESC";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                DeThi exam = new DeThi();
                exam.setExamId(rs.getInt("exam_id"));
                exam.setTitle(rs.getString("title"));
                exam.setDescription(rs.getString("description"));
                exam.setCreatedBy(rs.getInt("created_by"));
                exam.setSubjectId(rs.getInt("subject_id"));
                exam.setDurationMinutes(rs.getInt("duration_minutes"));
                exam.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(exam);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Lấy đề thi theo ID
    public DeThi getExamById(int examId) {
        DeThi exam = null;
        String sql = "SELECT * FROM exams WHERE exam_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, examId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    exam = new DeThi();
                    exam.setExamId(rs.getInt("exam_id"));
                    exam.setTitle(rs.getString("title"));
                    exam.setDescription(rs.getString("description"));
                    exam.setCreatedBy(rs.getInt("created_by"));
                    exam.setSubjectId(rs.getInt("subject_id"));
                    exam.setDurationMinutes(rs.getInt("duration_minutes"));
                    exam.setCreatedAt(rs.getTimestamp("created_at"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return exam;
    }

    // Cập nhật đề thi
    public boolean updateExam(DeThi exam) {
        String sql = "UPDATE exams SET title = ?, description = ?, subject_id = ?, duration_minutes = ? WHERE exam_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, exam.getTitle());
            stmt.setString(2, exam.getDescription());
            stmt.setInt(3, exam.getSubjectId());
            stmt.setInt(4, exam.getDurationMinutes());
            stmt.setInt(5, exam.getExamId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xoá đề thi
    public boolean deleteExam(int examId) {
        String sql = "DELETE FROM exams WHERE exam_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, examId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy đề thi theo môn học
    public List<DeThi> getExamsBySubjectId(int subjectId) {
        List<DeThi> list = new ArrayList<>();
        String sql = "SELECT * FROM exams WHERE subject_id = ? ORDER BY created_at DESC";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, subjectId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    DeThi exam = new DeThi();
                    exam.setExamId(rs.getInt("exam_id"));
                    exam.setTitle(rs.getString("title"));
                    exam.setDescription(rs.getString("description"));
                    exam.setCreatedBy(rs.getInt("created_by"));
                    exam.setSubjectId(rs.getInt("subject_id"));
                    exam.setDurationMinutes(rs.getInt("duration_minutes"));
                    exam.setCreatedAt(rs.getTimestamp("created_at"));
                    list.add(exam);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}