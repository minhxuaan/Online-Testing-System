/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ketnoi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class KetQuaDAO {
    private Connection conn;

    public KetQuaDAO() {
        conn = DBConnection.getConnection();
    }

    // Thêm kết quả mới
    public boolean addResult(KetQua result) {
        String sql = "INSERT INTO results (user_id, exam_id, score) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, result.getUserId());
            stmt.setInt(2, result.getExamId());
            stmt.setFloat(3, result.getScore());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy danh sách kết quả của một user
    public List<KetQua> getResultsByUserId(int userId) {
        List<KetQua> list = new ArrayList<>();
        String sql = "SELECT * FROM results WHERE user_id = ? ORDER BY submitted_at DESC";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    KetQua result = new KetQua();
                    result.setResultId(rs.getInt("result_id"));
                    result.setUserId(rs.getInt("user_id"));
                    result.setExamId(rs.getInt("exam_id"));
                    result.setScore(rs.getFloat("score"));
                    result.setSubmittedAt(rs.getTimestamp("submitted_at"));
                    list.add(result);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Lấy tất cả kết quả
    public List<KetQua> getAllResults() {
        List<KetQua> list = new ArrayList<>();
        String sql = "SELECT * FROM results ORDER BY submitted_at DESC";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                KetQua result = new KetQua();
                result.setResultId(rs.getInt("result_id"));
                result.setUserId(rs.getInt("user_id"));
                result.setExamId(rs.getInt("exam_id"));
                result.setScore(rs.getFloat("score"));
                result.setSubmittedAt(rs.getTimestamp("submitted_at"));
                list.add(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Xoá kết quả theo ID
    public boolean deleteResult(int resultId) {
        String sql = "DELETE FROM results WHERE result_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, resultId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    //Lưu điểm và trả về kết quả theo Result_ID
    public int saveResult(int userId, int examId, int score) {
    int resultId = -1;
    String sql = "INSERT INTO results (user_id, exam_id, score, submitted_at) VALUES (?, ?, ?, NOW())";

    try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        stmt.setInt(1, userId);
        stmt.setInt(2, examId);
        stmt.setInt(3, score);
        stmt.executeUpdate();

        try (ResultSet rs = stmt.getGeneratedKeys()) {
            if (rs.next()) {
                resultId = rs.getInt(1); // Lấy result_id mới tạo
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return resultId;
}
    public KetQua getResultById(int resultId) {
    KetQua ketQua = null;
    String sql = "SELECT * FROM results WHERE result_id = ?";

    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, resultId);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                ketQua = new KetQua();
                ketQua.setResultId(rs.getInt("result_id"));
                ketQua.setUserId(rs.getInt("user_id"));
                ketQua.setExamId(rs.getInt("exam_id"));
                ketQua.setScore(rs.getFloat("score"));
                ketQua.setSubmittedAt(rs.getTimestamp("submitted_at"));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return ketQua;
}

}
