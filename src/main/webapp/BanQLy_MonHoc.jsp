<%-- 
    Document   : BanQLy_MonHoc
    Created on : May 21, 2025, 9:11:39 PM
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
        <link rel="stylesheet" href="QLy.css"/>
        <title>Quản lý môn học</title>
        <style>
            table {
                width: 50%;
                margin: 0 auto;
            }
            th, td {
                padding: 10px 15px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }
        </style>
    </head>
    <%
    MonHocDAO dao = new MonHocDAO();
    List<MonHoc> dsMonHoc = dao.getAllSubjects();
    %>
<body>
<jsp:include page="BanQLy_TieuDe.jsp" />

<div class="wrapp">
    <div class="header-bar">
        <h2>Danh sách môn học</h2>
        <a href="BanQLy_ThemMonHoc.jsp" class="btn">➕ Thêm môn học</a>
    </div>
    <table>
        <thead>
            <tr>
                <th>Tên môn học</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (MonHoc mh : dsMonHoc) {
            %>
            <tr>
                <td><%= mh.getName() %></td>
                <td>
                    <a class="btn" href="BanQLy_SuaMonHoc.jsp?id=<%= mh.getSubjectId() %>">Sửa</a>
                    <a class="btn btn-danger" href="Sv_BanQLy_XoaMonHoc?id=<%= mh.getSubjectId() %>"
                       onclick="return confirm('Bạn có chắc muốn xóa môn học này không?');">Xóa</a>
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
