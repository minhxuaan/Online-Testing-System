<%-- 
    Document   : TieuDe
    Created on : May 16, 2025, 11:45:48 AM
    Author     : Admin
--%>

<%@page import="ketnoi.NguoiDung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    NguoiDung user = (NguoiDung) session.getAttribute("user");
%>


<div class="fixed-header">
    <div class="header-container">
        <div class="left-title">
            <a class="logo-text" href="TrangChu.jsp">Luyện thi trắc nghiệm</a>
        </div>

        <div class="center-text">
            <% if (user != null) { %>
                Xin chào, <strong><%= user.getFullName() != null ? user.getFullName() : user.getUsername() %></strong>!
            <% } else { %>
                Chào mừng đến với hệ thống!
            <% } %>
        </div>

        <div class="right-button">
            <form action="Sv_DangXuat" method="get">
                <button type="submit" class="btn btn-red">Đăng xuất</button>
            </form>
        </div>
    </div>
</div>
    <style>
   .fixed-header {
        background-color: #51a5f1;
        color: white;
        padding: 20px 40px;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 1000;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    .header-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: relative;
    }

    .left-title {
        flex: 1;
        text-align: left;
        margin-left: 10px;
    }

    .center-text {
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        font-size: 16px;
    }

    .right-button {
        flex: 1;
        text-align: right;
        margin-right: 80px;
    }

    .logo-text {
        margin: 0;
        font-size: 27px;
        font-weight: bold;
        text-decoration: none;
        color: white;
    }

    .header-spacer {
        height: 100px;
    }

    .btn-red {
        background-color: #e74c3c;
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 8px;
        font-weight: bold;
        cursor: pointer;
    }

    .btn-red:hover {
        background-color: #a41010;
    }

    </style>
