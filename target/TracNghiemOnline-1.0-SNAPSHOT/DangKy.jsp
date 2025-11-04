<%-- 
    Document   : DangKi
    Created on : May 17, 2025, 2:22:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="DangKy.css"/>
        <title>Đăng ký</title>
    </head>
<body>
    <div class="register-container">
        <h2>Đăng ký</h2>
        <form action="Sv_DangKy" method="post">
            <label for="fullName">Họ và tên:</label>
            <input type="text" name="fullName" required>

            <label for="username">Tên tài khoản:</label>
            <input type="text" name="username" required>

            <label for="password">Mật khẩu:</label>
            <input type="password" name="password" required>

            <input type="submit" value="Đăng ký">
        </form>

        <div class="error">
            <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
        </div>
        <div class="message">
            <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
        </div>

        <div class="login-link">
            Đã có tài khoản? <a href="DangNhap.jsp">Đăng nhập</a>
        </div>
    </div>
</body>
</html>
