<%-- 
    Document   : BanQLy_ThemMonHoc
    Created on : May 21, 2025, 9:36:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Them.css"/>
        <title>Thêm môn học</title>   
        <style>.card-container{margin-bottom: 320px;} </style>
    </head>
<body>
<jsp:include page="BanQLy_TieuDe.jsp" />

<div class="card-container">
    <h2>Thêm môn học</h2>
    <form action="Sv_BanQLy_ThemMonHoc" method="post">
        <label>Tên môn học:</label>
        <input type="text" name="name" required />
        <br>
        <div class="btn-group">
            <button class="btn" type="submit">Thêm</button>
            <a href="BanQLy_MonHoc.jsp" class="btn btn-danger"> Quay lại</a>
        </div>
    </form>
</div>

<jsp:include page="KetThucTrang.jsp" />
</body>
</html>
