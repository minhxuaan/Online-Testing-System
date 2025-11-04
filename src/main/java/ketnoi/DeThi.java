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
public class DeThi {
    private int examId;
    private String title;
    private String description;
    private int createdBy;
    private int subjectId;
    private int durationMinutes;
    private Timestamp createdAt;

    public DeThi() {
    }

    public DeThi(int examId, String title, String description, int createdBy, int subjectId, int durationMinutes, Timestamp createdAt) {
        this.examId = examId;
        this.title = title;
        this.description = description;
        this.createdBy = createdBy;
        this.subjectId = subjectId;
        this.durationMinutes = durationMinutes;
        this.createdAt = createdAt;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public int getDurationMinutes() {
        return durationMinutes;
    }

    public void setDurationMinutes(int durationMinutes) {
        this.durationMinutes = durationMinutes;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
    
    
}
