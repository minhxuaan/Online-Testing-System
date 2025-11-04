<%-- 
    Document   : LichSuKetQua
    Created on : May 17, 2025, 3:44:17 PM
    Author     : Admin
--%>

<%@page import="ketnoi.MonHoc"%>
<%@page import="ketnoi.DeThi"%>
<%@page import="ketnoi.DeThiDAO"%>
<%@page import="ketnoi.KetQua"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="LichSuKQ.css"/>
        <title>Lịch sử kiểm tra</title>
    </head>
    <%
    List<KetQua> ketQuaList = (List<KetQua>) request.getAttribute("ketQuaList");
    List<DeThi> deThiList = (List<DeThi>) request.getAttribute("deThiList");
    List<MonHoc> monHocList = (List<MonHoc>) request.getAttribute("monHocList");
%>
<jsp:include page="TieuDe.jsp" />
<body>
    <div class="warpp">
    <a class="btn-back" href="TrangChu.jsp">←  Quay lại trang chủ</a>
    
    <h2 style="text-align: center;">Lịch sử làm bài</h2>

<%
    if (ketQuaList != null && deThiList != null && monHocList != null) {
        int minSize = Math.min(ketQuaList.size(), Math.min(deThiList.size(), monHocList.size()));
        for (int i = 0; i < minSize; i++) {
            KetQua kq = ketQuaList.get(i);
            DeThi deThi = deThiList.get(i);
            MonHoc mon = monHocList.get(i);
%>
    <div class="card">
        <h3><%= deThi.getTitle() %></h3>
        <p><%= deThi.getDescription() %></p>
        <p>Môn: <%= mon.getName() %></p>
        <p>Thời gian làm bài: <%= deThi.getDurationMinutes() %> phút</p>
        <p class="score">Điểm: <%= kq.getScore() %></p>
        <p class="timestamp">Nộp lúc: <%= kq.getSubmittedAt() %></p>
        <a href="Sv_ChiTietKetQua?resultId=<%= kq.getResultId() %>">Xem bài làm</a>

    </div>
<%
        }
    } else {
%>
    <p>Không có dữ liệu hiển thị.</p>
<%
    }
%>
    </div>
    <button onclick="scrollToTop()" id="scrollTopBtn" title="Lên đầu trang"
        style="position: fixed; bottom: 20px; right: 20px; z-index: 99; border: 1px solid black; outline: none;
               background-color: white; color: black; cursor: pointer; padding: 12px 16px;
               border-radius: 50%; font-size: 20px; display: none;">
    ↑
</button>
    <script>
    // Hiện nút khi cuộn xuống 100px
    window.onscroll = function () {
        const btn = document.getElementById("scrollTopBtn");
        if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
            btn.style.display = "block";
        } else {
            btn.style.display = "none";
        }
    };


    function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }
</script>
</body>
<jsp:include page="KetThucTrang.jsp" />
</html>
