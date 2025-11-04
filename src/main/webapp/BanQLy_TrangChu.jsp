<%-- 
    Document   : BanQLy_TrangChu
    Created on : May 19, 2025, 9:19:31 PM
    Author     : Admin
--%>

<%@page import="ketnoi.NguoiDung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ giáo viên</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            margin: auto;
            margin-top: 80px;
            text-align: center;
        }

        h1 {
            margin-bottom: 30px;
        }

        


    </style>
    </head>
    <%
    NguoiDung user = (NguoiDung) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("DangNhap.jsp");
        return;
    }
%>
<body>

    <!-- Gọi phần tiêu đề dùng chung -->
    <jsp:include page="BanQLy_TieuDe.jsp" />

    <div class="container">
        <h1>Trang quản lý</h1>
        <p>Chào mừng đến trang quản lý. Hãy chọn 1 mục để bắt đầu nhé.</p>
    </div>
    
    <jsp:include page="KetThucTrang.jsp" />
</body>
</html>
