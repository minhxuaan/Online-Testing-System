<%-- 
    Document   : BanQLy_SuaCauHoi
    Created on : May 22, 2025, 3:00:53 PM
    Author     : Admin
--%>

<%@page import="ketnoi.MonHocDAO"%>
<%@page import="ketnoi.MonHoc"%>
<%@page import="java.util.List"%>
<%@page import="ketnoi.CauHoi"%>
<%@page import="ketnoi.CauHoiDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Sua.css"/>
        <title>Sửa câu hỏi</title>
    </head>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    CauHoiDAO chDAO = new CauHoiDAO();
    MonHocDAO monDAO = new MonHocDAO();

    CauHoi ch = chDAO.getQuestionById(id);
    List<MonHoc> listMon = monDAO.getAllSubjects();
%>
    <body>
        <jsp:include page="BanQLy_TieuDe.jsp" />
        <div class="wrapp">
            <h2>Sửa Câu Hỏi</h2>
            <form action="Sv_BanQLy_SuaCauHoi" method="post">
                <input type="hidden" name="questionId" value="<%= ch.getQuestionId() %>">
                
                <label for="content">Nội dung:</label>
                <input type="text" name="content" value="<%= ch.getContent() %>">
                
                <label for="answerA">Đáp án A:</label>
                <input type="text" name="optionA" value="<%= ch.getOptionA() %>">
                
                <label for="answerB">Đáp án B:</label>
                <input type="text" name="optionB" value="<%= ch.getOptionB() %>">
                
                <label for="answerC">Đáp án C:</label>
                <input type="text" name="optionC" value="<%= ch.getOptionC() %>">
                
                <label for="answerD">Đáp án D:</label>
                <input type="text" name="optionD" value="<%= ch.getOptionD() %>">
                
                <label for="answer-correct">Đáp án đúng:</label>
                <input type="text" name="correctAnswer" value="<%= ch.getCorrectAnswer() %>">
                
                <label for="subject">Môn học:</label>
                <select name="subjectId">
                    <% for (MonHoc mh : listMon) { %>
                        <option value="<%= mh.getSubjectId() %>" <%= (mh.getSubjectId() == ch.getSubjectId()) ? "selected" : "" %>><%= mh.getName() %></option>
                    <% } %>
                </select>
                
                <div class="btn-group">
                    <button type="submit" class="btn">Cập nhật câu hỏi</button>
                    <a href="BanQLy_CauHoi.jsp" class="btn btn-danger"> Quay lại</a>
                </div>
            </form>
        </div>            
    <jsp:include page="KetThucTrang.jsp" />
    </body>
</html>
