/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ketnoi;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class KetQua {
    private int resultId;
    private int userId;
    private int examId;
    private float score;
    private Timestamp submittedAt;

    public KetQua() {
    }

    public KetQua(int resultId, int userId, int examId, float score, Timestamp submittedAt) {
        this.resultId = resultId;
        this.userId = userId;
        this.examId = examId;
        this.score = score;
        this.submittedAt = submittedAt;
    }

    public int getResultId() {
        return resultId;
    }

    public void setResultId(int resultId) {
        this.resultId = resultId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public Timestamp getSubmittedAt() {
        return submittedAt;
    }

    public void setSubmittedAt(Timestamp submittedAt) {
        this.submittedAt = submittedAt;
    }
    
    
}
