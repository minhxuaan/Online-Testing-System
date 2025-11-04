/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package TracNghiem;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ketnoi.DeThi;
import ketnoi.DeThiDAO;
import ketnoi.MonHoc;
import ketnoi.MonHocDAO;
import ketnoi.NguoiDung;
import ketnoi.NguoiDungDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Sv_BanQLy_ThemDeThi", urlPatterns = {"/Sv_BanQLy_ThemDeThi"})
public class Sv_BanQLy_ThemDeThi extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Sv_BanQLy_ThemDeThi</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sv_BanQLy_ThemDeThi at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        // Lấy danh sách môn học
        MonHocDAO monHocDAO = new MonHocDAO();
        List<MonHoc> danhSachMon = monHocDAO.getAllSubjects();
        request.setAttribute("danhSachMonHoc", danhSachMon);

        // Lấy danh sách người dùng có role là 'admin' làm người tạo
        NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
        List<NguoiDung> tatCaNguoiDung = nguoiDungDAO.getAllUsers();
        List<NguoiDung> danhSachNguoiTao = new ArrayList<>();

        for (NguoiDung nd : tatCaNguoiDung) {
            if ("admin".equals(nd.getRole())) {
                danhSachNguoiTao.add(nd);
            }
        }

        request.setAttribute("danhSachNguoiTao", danhSachNguoiTao);

        // Chuyển đến trang thêm đề thi
        request.getRequestDispatcher("BanQLy_ThemDeThi.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        try {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            int subjectId = Integer.parseInt(request.getParameter("subjectId"));
            int durationMinutes = Integer.parseInt(request.getParameter("durationMinutes"));
            int createdBy = Integer.parseInt(request.getParameter("createdBy"));

            DeThi exam = new DeThi();
            exam.setTitle(title);
            exam.setDescription(description);
            exam.setSubjectId(subjectId);
            exam.setDurationMinutes(durationMinutes);
            exam.setCreatedBy(createdBy);

            DeThiDAO dao = new DeThiDAO();
            boolean success = dao.addExam(exam);

            if (success) {
                response.sendRedirect("BanQLy_DeThi.jsp");
            } else {
                request.setAttribute("message", "❌ Thêm đề thi thất bại!");
                doGet(request, response); 
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "❌ Đã xảy ra lỗi khi thêm đề thi!");
            doGet(request, response); // load lại danh sách để form hiển thị đầy đủ
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
