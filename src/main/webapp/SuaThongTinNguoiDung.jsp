<%-- 
    Document   : SuaThongTinNguoiDung
    Created on : May 18, 2025, 9:38:54 PM
    Author     : Admin
--%>

<%@page import="ketnoi.NguoiDung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="SuaThongTinND.css"/>
        <title>Chỉnh sửa thông tin</title>
    </head>
    <%
    NguoiDung user = (NguoiDung) session.getAttribute("user");
    System.out.println("🔐 Mật khẩu hash từ DB: " + user.getPassword());
%>

    <body>
        <jsp:include page="TieuDe.jsp" />
        <a class="btn-back" href="Sv_ThongTinNguoiDung">←  Quay lại xem thông tin</a>
        <div class="edit-container">
            <h2>Chỉnh sửa thông tin</h2>
            <form action="Sv_CapNhatThongTin" method="post">
                <input type="hidden" name="userId" value="<%= user.getUserId() %>"/>

                <label>Họ tên:</label>
                <input type="text" name="fullName" value="<%= user.getFullName() %>" required/>

                <label>Mật khẩu:</label>
                <input type="password" name="password" placeholder="Nhập mật khẩu mới (nếu muốn)">

                <button type="submit">Lưu thay đổi</button>
            </form>
        </div>
        <jsp:include page="KetThucTrang.jsp" />
    </body>
</html>
