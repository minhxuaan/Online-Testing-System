<%-- 
    Document   : BanQLy_SuaDeThi
    Created on : May 20, 2025, 6:30:54 PM
    Author     : Admin
--%>

<%@page import="ketnoi.MonHoc"%>
<%@page import="java.util.List"%>
<%@page import="ketnoi.DeThi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Sua.css"/>
        <title>Sửa đề thi</title>
        <style>
            textarea {
                width: 100%;
                padding: 8px;
                border-radius: 5px;
            }
        </style>
    </head>
<%
    DeThi exam = (DeThi) request.getAttribute("exam");
    List<MonHoc> danhSachMonHoc = (List<MonHoc>) request.getAttribute("danhSachMonHoc");
%>
<body>
    <jsp:include page="BanQLy_TieuDe.jsp" />
    <div class="wrapp">
        <h2 style="text-align:center;">Sửa Đề Thi</h2>

        <form action="Sv_QLy_SuaDeThi" method="post" accept-charset="UTF-8">
            <input type="hidden" name="examId" value="<%= exam.getExamId() %>">

            <label for="title">Tiêu đề:</label>
            <input type="text" name="title" value="<%= exam.getTitle() %>" required>

            <label for="description">Mô tả:</label>
            <textarea name="description" rows="4"><%= exam.getDescription() %></textarea>

            <label for="subjectId">Môn học:</label>
            <select name="subjectId" required>
                <% for (MonHoc mon : danhSachMonHoc) { %>
                    <option value="<%= mon.getSubjectId() %>"
                        <%= mon.getSubjectId() == exam.getSubjectId() ? "selected" : "" %>>
                        <%= mon.getName() %>
                    </option>
                <% } %>
            </select>

            <label for="durationMinutes">Thời gian làm bài (phút):</label>
            <input type="text" name="durationMinutes" value="<%= exam.getDurationMinutes() %>" required>
            
            <div class="btn-group">
                <button type="submit" class="btn">Cập nhật đề thi</button>
                <a href="BanQLy_DeThi.jsp" class="btn btn-danger"> Quay lại</a>
            </div>
        </form>
    </div>
    <jsp:include page="KetThucTrang.jsp" />    
</body>
</html>
