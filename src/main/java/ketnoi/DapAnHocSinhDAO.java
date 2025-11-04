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
public class DapAnHocSinhDAO {
    private Connection conn;

    public DapAnHocSinhDAO() {
        conn = DBConnection.getConnection();
    }

    // Thêm đáp án học sinh
    public boolean addStudentAnswer(DapAnHocSinh answer) {
        String sql = "INSERT INTO student_answers (result_id, question_id, selected_answer) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, answer.getResultId());
            stmt.setInt(2, answer.getQuestionId());
            stmt.setString(3, answer.getSelectedAnswer());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lưu đáp án học sinh
    public void saveStudentAnswer(int resultId, int questionId, String selectedAnswer) {
        String sql = "INSERT INTO student_answers (result_id, question_id, selected_answer) VALUES (?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, resultId);
            stmt.setInt(2, questionId);
            stmt.setString(3, selectedAnswer);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy tất cả đáp án theo result_id
    public List<DapAnHocSinh> getAnswersByResultId(int resultId) {
        List<DapAnHocSinh> list = new ArrayList<>();
        String sql = "SELECT * FROM student_answers WHERE result_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, resultId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    DapAnHocSinh answer = new DapAnHocSinh();
                    answer.setId(rs.getInt("id"));
                    answer.setResultId(rs.getInt("result_id"));
                    answer.setQuestionId(rs.getInt("question_id"));
                    answer.setSelectedAnswer(rs.getString("selected_answer"));
                    list.add(answer);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
