<%-- 
    Document   : ThongTinNguoiDung
    Created on : May 18, 2025, 9:37:32 PM
    Author     : Admin
--%>

<%@page import="ketnoi.NguoiDung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="ThongTinND.css"/>
        <title>Thông tin người dùng</title>
    </head>
    <%
    NguoiDung user = (NguoiDung) request.getAttribute("user");
%>
    <body>
        <jsp:include page="TieuDe.jsp" />
        <a class="btn-back" href="TrangChu.jsp">←  Quay lại trang chủ</a>
        <div class="info-container">
            <h2>Thông tin người dùng</h2>
            <p><strong>Tên đăng nhập:</strong> <%= user.getUsername() %></p>
            <p><strong>Họ tên:</strong> <%= user.getFullName() %></p>
            <p><strong>Vai trò:</strong> <%= user.getRole() %></p>

            <form action="SuaThongTinNguoiDung.jsp" method="get">
                <input type="hidden" name="userId" value="<%= user.getUserId() %>"/>
                <button type="submit">Chỉnh sửa thông tin</button>
            </form>
        </div>
        <jsp:include page="KetThucTrang.jsp" />
    </body>
</html>
