<%-- 
    Document   : BanQLy_ThemCauHoi
    Created on : May 22, 2025, 2:59:25 PM
    Author     : Admin
--%>

<%@page import="ketnoi.MonHocDAO"%>
<%@page import="ketnoi.MonHoc"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Them.css"/>
        <title>Thêm câu hỏi</title>
    </head>
    <%
    MonHocDAO monHocDAO = new MonHocDAO();
    List<MonHoc> listMon = monHocDAO.getAllSubjects();
%>
    <body>
        <jsp:include page="BanQLy_TieuDe.jsp" />
        <div class="card-container">
            <h2>Thêm Câu Hỏi Mới</h2>
            <form action="Sv_BanQLy_ThemCauHoi" method="post">
                <label for="content">Nội dung:</label>
                <input type="text" name="content">
                
                <label for="answerA">Đáp án A:</label>
                <input type="text" name="optionA">
                
                <label for="answerB">Đáp án B:</label>
                <input type="text" name="optionB">
                
                <label for="answerC">Đáp án C:</label>
                <input type="text" name="optionC">
                
                <label for="answerD">Đáp án D:</label>
                <input type="text" name="optionD">
                
                <label for="answer-correct">Đáp án đúng:</label>
                <input type="text" name="correctAnswer">
                
                
                <label for="subject">Môn học:</label>
                <select name="subjectId">
                    <% for (MonHoc mh : listMon) { %>
                        <option value="<%= mh.getSubjectId() %>"><%= mh.getName() %></option>
                    <% } %>
                </select>
                <div class="btn-group">
                    <button type="submit" class="btn">Thêm câu hỏi</button>
                    <a href="BanQLy_CauHoi.jsp" class="btn btn-danger"> Quay lại</a>
                </div>
            </form>
        </div>

<jsp:include page="KetThucTrang.jsp" />

    </body>
</html>
