<%-- 
    Document   : KetQua
    Created on : May 17, 2025, 9:35:26 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kết quả bài thi</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            padding: 30px;
        }
        .result-container {
            max-width: 600px;
            margin: auto;
            margin-top: 140px;
            margin-bottom: 200px;
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 { color: #2c3e50;}
        .score {
            font-size: 24px;
            margin: 20px 0;
            color: #27ae60;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }
        .btn:hover { background-color: #2980b9;}
    </style>
    </head>
    <body>
    <jsp:include page="TieuDe.jsp" />    
    <div class="result-container">
        
    <h2>Kết quả bài thi</h2>

    <%
        Integer score = (Integer) request.getAttribute("score");
        Integer total = (Integer) request.getAttribute("total");
        Integer resultId = (Integer) request.getAttribute("resultId");

        if (score != null && total != null) {
    %>
        <div class="score">
            Bạn đã trả lời đúng <strong><%= score %></strong> / <strong><%= total %></strong> câu hỏi.
        </div>
        <div class="score">
            Điểm số: <strong><%= (float) score / total * 10 %></strong> / 10
        </div>
    <%
        } else {
    %>
        <p>Không tìm thấy dữ liệu kết quả.</p>
    <%
        }
    %>

    <a class="btn" href="TrangChu.jsp">Về trang chủ</a>
     <a class="btn" href="Sv_ChiTietKetQua?resultId=<%= resultId %>">Xem chi tiết</a> 
</div>
<jsp:include page="KetThucTrang.jsp" />
    </body>
</html>
