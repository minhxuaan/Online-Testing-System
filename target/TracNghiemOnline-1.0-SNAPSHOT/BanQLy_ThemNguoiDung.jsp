<%-- 
    Document   : BanQLy_ThemNguoiDung
    Created on : May 24, 2025, 1:26:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Them.css"/>
        <title>Thêm người dùng</title>
        <style>
            .card-container{
                margin-bottom:100px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="BanQLy_TieuDe.jsp" />
        <div class="card-container">
            <h2>Thêm người dùng mới</h2>
            <form action="Sv_BanQLy_ThemNguoiDung" method="post">
                <label for="name">Tên đăng nhập:</label>
                <input type="text" name="username">
                
                <label for="pass">Mật khẩu:</label>
                <input type="password" name="password">
                
                <label for="name">Họ tên:</label>
                <input type="text" name="fullName">
                
                <label for="role">Quyền:</label>
                <select name="role">
                    <option value="admin">Admin</option>
                    <option value="student">Học sinh</option>
                </select>
                <div class="btn-group">
                    <button type="submit" class="btn">Thêm người dùng</button>
                    <a href="BanQLy_NguoiDung.jsp" class="btn btn-danger"> Quay lại</a>
                </div>
            </form>
        </div>
    <jsp:include page="KetThucTrang.jsp" />    
</body>
</html>
