<%-- 
    Document   : LamBai
    Created on : May 16, 2025, 6:14:49 PM
    Author     : Admin
--%>

<%@page import="ketnoi.DeThi"%>
<%@page import="ketnoi.CauHoi"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    DeThi exam = (DeThi) request.getAttribute("exam");
    List<CauHoi> questions = (List<CauHoi>) session.getAttribute("questions");
    int examId = exam.getExamId();
    int duration = exam.getDurationMinutes(); // thời gian thi từ DB
%>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Thi.css"/>
        <title>Làm bài thi</title>        
    </head>
    <body>
        <div class="container">
    <h2>Bài thi trắc nghiệm</h2>
    
    <div class="timer-container">
    <p>Thời gian còn lại: <span id="timer" style="color: red; font-weight: bold;"></span></p>
</div>

    <form action="Sv_NopBai" method="post" id="examForm">
        <input type="hidden" name="examId" value="<%= examId %>"/>

        <%
            int stt = 1;
            for (CauHoi question : questions) {
        %>
        <div class="question">
            <h4><%= stt++ %>. <%= question.getContent() %></h4>
            <div class="options">
                <label><input type="radio" name="answer_<%= question.getQuestionId() %>" value="A"> A. <%= question.getOptionA() %></label>
                <label><input type="radio" name="answer_<%= question.getQuestionId() %>" value="B"> B. <%= question.getOptionB() %></label>
                <label><input type="radio" name="answer_<%= question.getQuestionId() %>" value="C"> C. <%= question.getOptionC() %></label>
                <label><input type="radio" name="answer_<%= question.getQuestionId() %>" value="D"> D. <%= question.getOptionD() %></label>
            </div>
        </div>
        <% } %>

        <button type="submit" class="submit-btn">Nộp bài</button>
    </form>
</div>
<script>
    let duration = <%= duration %> * 60; // đổi phút sang giây
    let timerDisplay = null;

    function startCountdown() {
        timerDisplay = document.getElementById("timer");

        const interval = setInterval(function () {
            let minutes = Math.floor(duration / 60);
            let seconds = duration % 60;

            timerDisplay.innerText = minutes + "p " + (seconds < 10 ? "0" + seconds : seconds) + "s";

            if (duration <= 0) {
                clearInterval(interval);
                alert("Hết giờ! Bài làm sẽ được nộp tự động.");
                document.getElementById("examForm").submit(); // tự động nộp
            }

            duration--;
        }, 1000);
    }

    window.onload = startCountdown;
</script>

    </body>
</html>
