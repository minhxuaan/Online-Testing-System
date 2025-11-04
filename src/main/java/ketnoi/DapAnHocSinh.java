/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ketnoi;

/**
 *
 * @author Admin
 */
public class DapAnHocSinh {
    private int id;
    private int resultId;
    private int questionId;
    private String selectedAnswer;
    private CauHoi question;

    public DapAnHocSinh() {
    }

    public DapAnHocSinh(int id, int resultId, int questionId, String selectedAnswer, CauHoi question) {
        this.id = id;
        this.resultId = resultId;
        this.questionId = questionId;
        this.selectedAnswer = selectedAnswer;
        this.question = question;
    }
    
    


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getResultId() {
        return resultId;
    }

    public void setResultId(int resultId) {
        this.resultId = resultId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getSelectedAnswer() {
        return selectedAnswer;
    }

    public void setSelectedAnswer(String selectedAnswer) {
        this.selectedAnswer = selectedAnswer;
    }

    public CauHoi getQuestion() {
        return question;
    }

    public void setQuestion(CauHoi question) {
        this.question = question;
    }
    
    
}
