<%-- 
    Document   : BanQLy_NguoiDung
    Created on : May 24, 2025, 1:25:25 PM
    Author     : Admin
--%>

<%@page import="ketnoi.NguoiDung"%>
<%@page import="java.util.List"%>
<%@page import="ketnoi.NguoiDungDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="QLy.css"/>
        <title>Quản lý người dùng</title>
    </head>
    <%
    NguoiDungDAO dao = new NguoiDungDAO();
    List<NguoiDung> list = dao.getAllUsers();
    %>
    <body>
        <jsp:include page="BanQLy_TieuDe.jsp" />
        <div class="wrapp">
            <div class="header-bar">
            <h2>Danh sách người dùng</h2>
            <a href="BanQLy_ThemNguoiDung.jsp" class="btn">➕ Thêm người dùng</a>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Tên đăng nhập</th>
                        <th>Họ tên</th>
                        <th>Quyền</th>
                        <th>Ngày tạo</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (NguoiDung u : list) { %>
                        <tr>
                            <td><%= u.getUsername() %></td>
                            <td><%= u.getFullName() %></td>
                            <td><%= u.getRole() %></td>
                            <td><%= u.getCreatedAt() %></td>
                            <td>
                                <a class="btn" href="BanQLy_SuaNguoiDung.jsp?id=<%= u.getUserId() %>">Sửa</a>
                                <a class="btn btn-danger" href="Sv_BanQLy_XoaNguoiDung?id=<%= u.getUserId() %>" onclick="return confirm('Xác nhận xoá người dùng này?')">Xoá</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div> 
    <jsp:include page="KetThucTrang.jsp" />            
</body>
</html>
