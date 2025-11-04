<%-- 
    Document   : BanQLy_SuaMonHoc
    Created on : May 22, 2025, 1:37:31 PM
    Author     : Admin
--%>

<%@page import="ketnoi.MonHoc"%>
<%@page import="ketnoi.MonHocDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Sua.css"/>
        <title>Sửa môn học</title>
        <style>.wrapp{margin-bottom: 300px;} </style>
    </head>
    <%
    int id = Integer.parseInt(request.getParameter("id"));
    MonHocDAO dao = new MonHocDAO();
    MonHoc mh = dao.getSubjectById(id);
    %>
<body>
    <jsp:include page="BanQLy_TieuDe.jsp" />

    <div class="wrapp">
        <h2 style="text-align: center;">Sửa môn học</h2>
        <form action="Sv_BanQLy_SuaMonHoc" method="post">
            <input type="hidden" name="id" value="<%= mh.getSubjectId() %>" />
            <label>Tên môn học:</label>
            <input type="text" name="name" value="<%= mh.getName() %>" required />
            <br>
            <div class="btn-group">
                <button type="submit" class="btn">Cập nhật</button>
                <a href="BanQLy_MonHoc.jsp" class="btn btn-danger"> Quay lại</a>
            </div>        
        </form>
    </div>

    <jsp:include page="KetThucTrang.jsp" />
</body>
</html>
