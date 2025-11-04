<%-- 
    Document   : LamBaiThi
    Created on : May 16, 2025, 2:13:12 PM
    Author     : Admin
--%>

<%@page import="ketnoi.MonHoc"%>
<%@page import="ketnoi.DeThi"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="LamBaiThi.css"/>
        <title>Làm bài thi</title>
    </head>
<%
    List<MonHoc> listSubjects = (List<MonHoc>) request.getAttribute("listSubjects");
    List<DeThi> listExams = (List<DeThi>) request.getAttribute("listExams");
    String selectedSubjectId = request.getParameter("subjectId");
%>
<jsp:include page="TieuDe.jsp" />
    <body>
<div class="wrapp">
    <a class="btn-back" href="TrangChu.jsp">←  Quay lại trang chủ</a>
    
    <div class="choose-subject">
        <h2>Chọn môn học để lọc đề thi</h2>
        <form  action="Sv_LamBaiThi" method="get">
            <select name="subjectId" onchange="this.form.submit()">
                <option value="">-- Tất cả môn học --</option>
                <%
                    for (MonHoc subject : listSubjects) {
                        String selected = (selectedSubjectId != null && selectedSubjectId.equals(String.valueOf(subject.getSubjectId()))) ? "selected" : "";
                %>
                    <option value="<%= subject.getSubjectId() %>" <%= selected %>>
                        <%= subject.getName() %>
                    </option>
                <%
                    }
                %>
            </select>
        </form>
    </div>
</div>            
    <h2>Danh sách đề thi</h2>
    <%
        if (listExams != null && !listExams.isEmpty()) {
            for (DeThi exam : listExams) {
    %>
                <div class="exam-card">
                    <h3><%= exam.getTitle() %></h3>
                    <p><%= exam.getDescription() %></p>
                    <p>Thời gian làm bài: <%= exam.getDurationMinutes() %> phút</p>
                    <a class="start-btn" href="Sv_VaoThi?examId=<%= exam.getExamId()%>">Bắt đầu làm bài</a>
                </div>
    <%
            }
        } else {
    %>
            <p>Không có đề thi nào khả dụng.</p>
    <%
        }
    %>
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
