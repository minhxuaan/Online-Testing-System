<%-- 
    Document   : login
    Created on : May 15, 2025, 3:42:11 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="DangNhap.css"/>
        <title>Đăng nhập</title>
    </head>
    <body>
        <div class="login-container">
            <h2>Đăng nhập</h2>
            <form action="Sv_DangNhap" method="post">
                <label for="role">Bạn là:</label>
                <select id="role" name="role">
                    <option value="student">Học sinh</option>
                    <option value="admin">Quản trị viên</option>
                </select>
                
                <label for="username">Tên tài khoản:</label>
                <input type="text" id="username" name="username" placeholder="Nhập tên tài khoản" required>
                
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
                
                <button type="submit" class="btn">Đăng nhập</button>
            </form>
            <div class="register-link">
                Bạn chưa có tài khoản? <a href="DangKy.jsp">Đăng ký</a>
            </div>
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="notify"> <%= error %> </div>
            <% } %>
        </div>
    </body>
</html>
