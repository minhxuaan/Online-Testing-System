<%-- 
    Document   : ChiTietKetQua
    Created on : May 17, 2025, 10:00:44 AM
    Author     : Admin
--%>

<%@page import="ketnoi.CauHoi"%>
<%@page import="ketnoi.DapAnHocSinh"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="ChiTietKetQua.css"/>
        <title>Chi tiết kết quả</title>
    </head>
    <%
    List<DapAnHocSinh> studentAnswers = (List<DapAnHocSinh>) request.getAttribute("studentAnswers");

    Integer scoreObj = (Integer) request.getAttribute("score");
    Integer totalObj = (Integer) request.getAttribute("total");

    int score = (scoreObj != null) ? scoreObj : 0;
    int total = (totalObj != null) ? totalObj : 0;
%>
    <body>
    <jsp:include page="TieuDe.jsp" /> 
    <a class="btn-back" href="Sv_LichSuKetQua">←  Quay lại lịch sử bài làm</a>
    <div class="container">        
    <h2>Chi Tiết Kết Quả</h2>
    <p>Số câu đúng: <strong><%= score %> / <%= total %></strong></p>

    <%
        int stt = 1;
        for (DapAnHocSinh answer : studentAnswers) {
            CauHoi question = answer.getQuestion();
            String correctAnswer = question.getCorrectAnswer();
            String studentAnswer = answer.getSelectedAnswer();

            boolean isCorrect = (studentAnswer != null) && studentAnswer.equalsIgnoreCase(correctAnswer);
    %>
        <div class="question">
            <h4><%= stt++ %>. <%= question.getContent() %></h4>
            <div class="answer">
                <p>Đáp án của bạn: 
                    <span class="<%= isCorrect ? "correct" : "incorrect" %>">
                        <%= (studentAnswer != null) ? studentAnswer : "Chưa chọn" %>
                    </span>
                </p>
                <p>Đáp án đúng: <strong><%= correctAnswer %></strong></p>
            </div>
        </div>
    <%
        }
    %>
</div>
<jsp:include page="KetThucTrang.jsp" />
    </body>
</html>
