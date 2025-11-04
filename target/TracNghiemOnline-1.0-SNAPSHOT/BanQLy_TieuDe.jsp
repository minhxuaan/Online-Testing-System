<%-- 
    Document   : BanQLy_TieuDe
    Created on : May 19, 2025, 9:18:59 PM
    Author     : Admin
--%>

<%@page import="ketnoi.NguoiDung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    NguoiDung user = (NguoiDung) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("DangNhap.jsp");
        return;
    }
%>
<style>
    body {
        margin: 0;
        padding-top: 60px; 
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        font-family: Arial, sans-serif;
        box-sizing: border-box;
    }

    * {
        box-sizing: inherit;
    }

    header {
        position: fixed;
        top: 0;
        width: 100%;
        height: 60px;
        background-color: #2c3e50;
        color: white;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 20px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        z-index: 1000;
    }

    header a {
        margin: 0;
        font-size: 18px;
        font-weight: bold;
        white-space: nowrap;
        text-decoration: none;
        color: white;
    }
    header a:hover{
        text-decoration: none;
        color: white;
    }

    nav {
        display: flex;
        gap: 20px;
        flex-wrap: wrap;
    }

    nav a {
        color: white;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s;
        white-space: nowrap;
    }

    nav a:hover {
        color: #f39c12;
    }

    .main-content {
        flex: 1;
        padding: 20px;
    }
</style>

<header>
    <a href="BanQLy_TrangChu.jsp">Quản trị hệ thống trắc nghiệm</a>
    <nav>
        <a href="BanQLy_DeThi.jsp">Quản lý đề thi</a>
        <a href="BanQLy_MonHoc.jsp">Quản lý môn học</a>
        <a href="BanQLy_CauHoi.jsp">Quản lý câu hỏi</a>
        <a href="BanQLy_NguoiDung.jsp">Quản lý người dùng</a>
        <a href="Sv_DangXuat">Đăng xuất</a>
    </nav>
</header>
