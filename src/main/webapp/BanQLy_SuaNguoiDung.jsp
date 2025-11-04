<%-- 
    Document   : BanQLy_SuaNguoiDung
    Created on : May 24, 2025, 1:27:20 PM
    Author     : Admin
--%>

<%@page import="ketnoi.NguoiDung"%>
<%@page import="ketnoi.NguoiDungDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Sua.css"/>
        <title>Sửa người dùng</title>
        <style>.wrapp{margin-bottom: 200px;}</style>
    </head>
    <%
    int id = Integer.parseInt(request.getParameter("id"));
    NguoiDungDAO dao = new NguoiDungDAO();
    NguoiDung u = dao.getUserById(id);
    %>
    <body>
        <jsp:include page="BanQLy_TieuDe.jsp" />
        <div class="wrapp">
            <h2 style="text-align: center;">Sửa người dùng</h2>
            <form action="Sv_BanQLy_SuaNguoiDung" method="post">
                <input type="hidden" name="id" value="<%= u.getUserId() %>">
                
                Tên đăng nhập:<strong><%= u.getUsername() %></strong>
                
                <label for="name">Họ tên:</label>
                <input type="text" name="fullName" value="<%= u.getFullName() %>">
                
                <label for="role">Quyền:</label>
                <select name="role">
                    <option value="admin" <%= u.getRole().equals("admin") ? "selected" : "" %>>Admin</option>
                    <option value="student" <%= u.getRole().equals("student") ? "selected" : "" %>>Học sinh</option>
                </select>
                
                <div class="btn-group">
                    <button type="submit" class="btn">Lưu</button>
                    <a href="BanQLy_NguoiDung.jsp" class="btn btn-danger"> Quay lại</a>
                </div>
            </form>
        </div>
    <jsp:include page="KetThucTrang.jsp" />            
</body>
</html>
