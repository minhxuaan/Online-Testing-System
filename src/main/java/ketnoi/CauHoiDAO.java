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
public class CauHoiDAO {
    private Connection conn;

    public CauHoiDAO() {
        conn = DBConnection.getConnection();
    }

    // Thêm câu hỏi mới
    public boolean addQuestion(CauHoi question) {
        String sql = "INSERT INTO questions (content, option_a, option_b, option_c, option_d, correct_answer, created_by, subject_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, question.getContent());
            stmt.setString(2, question.getOptionA());
            stmt.setString(3, question.getOptionB());
            stmt.setString(4, question.getOptionC());
            stmt.setString(5, question.getOptionD());
            stmt.setString(6, question.getCorrectAnswer());
            stmt.setInt(7, question.getCreatedBy());
            stmt.setInt(8, question.getSubjectId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật câu hỏi
    public boolean updateQuestion(CauHoi question) {
        String sql = "UPDATE questions SET content = ?, option_a = ?, option_b = ?, option_c = ?, option_d = ?, correct_answer = ?, subject_id = ? WHERE question_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, question.getContent());
            stmt.setString(2, question.getOptionA());
            stmt.setString(3, question.getOptionB());
            stmt.setString(4, question.getOptionC());
            stmt.setString(5, question.getOptionD());
            stmt.setString(6, question.getCorrectAnswer());
            stmt.setInt(7, question.getSubjectId());
            stmt.setInt(8, question.getQuestionId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xoá câu hỏi
    public boolean deleteQuestion(int questionId) {
        String sql = "DELETE FROM questions WHERE question_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, questionId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy câu hỏi theo ID
    public CauHoi getQuestionById(int questionId) {
        CauHoi question = null;
        String sql = "SELECT * FROM questions WHERE question_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, questionId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    question = new CauHoi();
                    question.setQuestionId(rs.getInt("question_id"));
                    question.setContent(rs.getString("content"));
                    question.setOptionA(rs.getString("option_a"));
                    question.setOptionB(rs.getString("option_b"));
                    question.setOptionC(rs.getString("option_c"));
                    question.setOptionD(rs.getString("option_d"));
                    question.setCorrectAnswer(rs.getString("correct_answer"));
                    question.setCreatedBy(rs.getInt("created_by"));
                    question.setSubjectId(rs.getInt("subject_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return question;
    }

    // Lấy danh sách tất cả câu hỏi
    public List<CauHoi> getAllQuestions() {
        List<CauHoi> list = new ArrayList<>();
        String sql = "SELECT * FROM questions";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                CauHoi question = new CauHoi();
                question.setQuestionId(rs.getInt("question_id"));
                question.setContent(rs.getString("content"));
                question.setOptionA(rs.getString("option_a"));
                question.setOptionB(rs.getString("option_b"));
                question.setOptionC(rs.getString("option_c"));
                question.setOptionD(rs.getString("option_d"));
                question.setCorrectAnswer(rs.getString("correct_answer"));
                question.setCreatedBy(rs.getInt("created_by"));
                question.setSubjectId(rs.getInt("subject_id"));
                list.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Lấy danh sách câu hỏi theo môn học
    public List<CauHoi> getQuestionsBySubjectId(int subjectId) {
        List<CauHoi> list = new ArrayList<>();
        String sql = "SELECT * FROM questions WHERE subject_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, subjectId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CauHoi question = new CauHoi();
                    question.setQuestionId(rs.getInt("question_id"));
                    question.setContent(rs.getString("content"));
                    question.setOptionA(rs.getString("option_a"));
                    question.setOptionB(rs.getString("option_b"));
                    question.setOptionC(rs.getString("option_c"));
                    question.setOptionD(rs.getString("option_d"));
                    question.setCorrectAnswer(rs.getString("correct_answer"));
                    question.setCreatedBy(rs.getInt("created_by"));
                    question.setSubjectId(rs.getInt("subject_id"));
                    list.add(question);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<CauHoi> getRandomQuestionsBySubject(int subjectId, int limit) {
    List<CauHoi> list = new ArrayList<>();
    String sql = "SELECT * FROM questions WHERE subject_id = ? ORDER BY RAND() LIMIT ?";

    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, subjectId);
        stmt.setInt(2, limit);
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                CauHoi question = new CauHoi();
                question.setQuestionId(rs.getInt("question_id"));
                question.setContent(rs.getString("content"));
                question.setOptionA(rs.getString("option_a"));
                question.setOptionB(rs.getString("option_b"));
                question.setOptionC(rs.getString("option_c"));
                question.setOptionD(rs.getString("option_d"));
                question.setCorrectAnswer(rs.getString("correct_answer"));
                question.setCreatedBy(rs.getInt("created_by"));
                question.setSubjectId(rs.getInt("subject_id"));
                list.add(question);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return list;
}
}