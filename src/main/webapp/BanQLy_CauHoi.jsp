<%-- 
    Document   : BanQLy_CauHoi
    Created on : May 22, 2025, 2:57:54 PM
    Author     : Admin
--%>

<%@page import="ketnoi.MonHoc"%>
<%@page import="ketnoi.MonHocDAO"%>
<%@page import="ketnoi.CauHoi"%>
<%@page import="java.util.List"%>
<%@page import="ketnoi.CauHoiDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="QLy.css"/>
        <title>Quản lý câu hỏi</title>
    </head>
<body>
<jsp:include page="BanQLy_TieuDe.jsp" />
<div class="wrapp">
    <div class="header-bar">
        <h2>Danh sách câu hỏi</h2>
        <a class="btn" href="BanQLy_ThemCauHoi.jsp">➕ Thêm câu hỏi mới</a>
    </div>
    <%
        CauHoiDAO cauHoiDAO = new CauHoiDAO();
        MonHocDAO monHocDAO = new MonHocDAO();

        List<CauHoi> list = cauHoiDAO.getAllQuestions();
    %>

    <table>
        <thead>
            <tr>
                <th>Nội dung</th>
                <th>Môn học</th>
                <th>Đáp án A</th>
                <th>Đáp án B</th>
                <th>Đáp án C</th>
                <th>Đáp án D</th>
                <th>Đáp án đúng</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (CauHoi ch : list) {
                    MonHoc mh = monHocDAO.getSubjectById(ch.getSubjectId());
            %>
            <tr>
                <td><%= ch.getContent() %></td>
                <td><%= mh != null ? mh.getName() : "Không rõ" %></td>
                <td><%= ch.getOptionA() %></td>
                <td><%= ch.getOptionB() %></td>
                <td><%= ch.getOptionC() %></td>
                <td><%= ch.getOptionD() %></td>
                <td><%= ch.getCorrectAnswer() %></td>
                <td>
                    <a class="btn" href="BanQLy_SuaCauHoi.jsp?id=<%= ch.getQuestionId() %>">Sửa</a>
                    <a class="btn btn-danger" href="Sv_BanQLy_XoaCauHoi?id=<%= ch.getQuestionId() %>" onclick="return confirm('Xác nhận xoá?')">Xoá</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
<jsp:include page="KetThucTrang.jsp" />

</body>
</html>
