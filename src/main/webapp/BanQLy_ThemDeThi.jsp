<%-- 
    Document   : BanQLy_ThemDeThi
    Created on : May 20, 2025, 6:46:57 PM
    Author     : Admin
--%>

<%@page import="ketnoi.NguoiDung"%>
<%@page import="ketnoi.MonHoc"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Them.css"/>
        <title>Thêm đề thi</title>
        <style>
            .message {
                margin-top: 15px;
                color: red;
                font-weight: bold;
            }
        </style>
    </head>
<%
    String message = (String) request.getAttribute("message");
%>
    <body>
    <jsp:include page="BanQLy_TieuDe.jsp" />
    <div class="card-container">
        <h2>Thêm đề thi mới</h2>

        <form action="Sv_BanQLy_ThemDeThi" method="post">
            <label for="title">Tiêu đề:</label>
            <input type="text" name="title" id="title" required>

            <label for="description">Mô tả:</label>
            <textarea name="description" id="description" rows="4" required></textarea>

            <label for="subjectId">Môn học:</label>
            <select name="subjectId" id="subjectId" required>
                <%
                    List<MonHoc> danhSachMon = (List<MonHoc>) request.getAttribute("danhSachMonHoc");
                    if (danhSachMon != null) {
                        for (MonHoc mon : danhSachMon) {
                %>
                    <option value="<%= mon.getSubjectId() %>"><%= mon.getName() %></option>
                <%
                        }
                    }
                %>
            </select>


            <label for="createdBy">Người tạo:</label>
            <select name="createdBy" id="createdBy" required>
                <%
                    List<NguoiDung> danhSachNguoiTao = (List<NguoiDung>) request.getAttribute("danhSachNguoiTao");
                    if (danhSachNguoiTao != null) {
                        for (NguoiDung nd : danhSachNguoiTao) {
                %>
                    <option value="<%= nd.getUserId() %>"><%= nd.getFullName() %></option>
                <%
                        }
                    }
                %>
            </select>


            <label for="durationMinutes">Thời gian làm bài (phút):</label>
            <input type="number" name="durationMinutes" id="durationMinutes" required>

            <div class="btn-group">
                <button type="submit" class="btn">Thêm đề thi</button>
                <a href="BanQLy_DeThi.jsp" class="btn btn-danger"> Quay lại</a>
            </div>

            <% if (message != null) { %>
                <p class="message"><%= message %></p>
            <% } %>
        </form>
    </div>

    <jsp:include page="KetThucTrang.jsp" />
    </body>
</html>
