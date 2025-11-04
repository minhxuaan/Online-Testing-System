<%-- 
    Document   : TrangChu
    Created on : May 15, 2025, 7:41:28 PM
    Author     : Admin
--%>

<%@page import="ketnoi.NguoiDung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    NguoiDung user = (NguoiDung) session.getAttribute("user");

    if (user == null || !user.getRole().equals("student")) {
        response.sendRedirect("DangNhap.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="TrangChu.css"/>
    <title>Trang chủ học sinh</title>
</head>
<body>
     <div class="page-wrapper">
        <jsp:include page="TieuDe.jsp" />

        <div class="main-content">
            <div class="welcome">
                <strong><%= user.getFullName() != null ? user.getFullName() : user.getUsername() %></strong> ơi,
                bạn đã sẵn sàng để làm trắc nghiệm chưa? Hãy chọn ở bên dưới nhé!
            </div>

            <div class="container">
                <div class="card">
                    <h3>Làm bài kiểm tra</h3>
                    <p>Kiểm tra kiến thức qua các bài trắc nghiệm.</p>
                    <form action="Sv_LamBaiThi">
                        <button class="btn btn-ex">Làm bài thi</button>
                    </form>
                </div>
                <div class="card">
                    <h3>Kết quả của bạn</h3>
                    <p>Xem lại lịch sử và điểm số các bài thi đã làm.</p>
                    <form action="Sv_LichSuKetQua">
                        <button class="btn btn-ex">Xem kết quả</button>
                    </form>
                </div>
                <div class="card">
                    <h3>Thông tin cá nhân</h3>
                    <p>Cập nhật tên, mật khẩu hoặc thông tin cá nhân.</p>
                    <form action="Sv_ThongTinNguoiDung">
                        <button class="btn btn-edit">Xem thông tin cá nhân</button>
                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="KetThucTrang.jsp" />
    </div>
</body>
</html>