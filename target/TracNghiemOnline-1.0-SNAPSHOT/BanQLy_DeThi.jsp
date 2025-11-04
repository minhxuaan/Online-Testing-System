<%-- 
    Document   : BanQLy_DeThi
    Created on : May 20, 2025, 3:01:39 PM
    Author     : Admin
--%>

<%@page import="ketnoi.MonHoc"%>
<%@page import="ketnoi.MonHocDAO"%>
<%@page import="ketnoi.DeThi"%>
<%@page import="java.util.List"%>
<%@page import="ketnoi.DeThiDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="QLy.css"/>
        <title>Quản lý đề thi</title>
    </head>
<%
    DeThiDAO dao = new DeThiDAO();
    List<DeThi> dsDeThi = dao.getAllExams();
%>
<body>
    <jsp:include page="BanQLy_TieuDe.jsp" />
    <div class="wrapp">
        <div class="header-bar">
            <h2>Danh sách đề thi</h2>
            <a href="Sv_BanQLy_ThemDeThi" class="btn">➕ Thêm đề thi mới</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Tiêu đề</th>
                    <th>Mô tả</th>
                    <th>Thời gian (phút)</th>
                    <th>Ngày tạo</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (DeThi dt : dsDeThi) {
                %>
                <tr>
                    <td><%= dt.getTitle() %></td>
                    <td><%= dt.getDescription() %></td>
                    <td><%= dt.getDurationMinutes() %></td>
                    <td><%= dt.getCreatedAt() %></td>
                    <td>
                        <a class="btn" href="Sv_QLy_SuaDeThi?id=<%= dt.getExamId() %>">Sửa</a>
                        <a class="btn btn-danger" href="Sv_BanQLy_XoaDeThi?id=<%= dt.getExamId() %>"
                           onclick="return confirm('Bạn có chắc muốn xóa đề thi này không?');">Xóa</a>
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
