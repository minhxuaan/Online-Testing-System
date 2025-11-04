/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package TracNghiem;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Admin
 */
@WebServlet(name = "Sv_QLy_SuaDeThi", urlPatterns = {"/Sv_QLy_SuaDeThi"})
public class Sv_BanQLy_SuaDeThi extends HttpServlet {

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
            out.println("<title>Servlet Sv_QLy_SuaDeThi</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sv_QLy_SuaDeThi at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

    String idStr = request.getParameter("id");
    if (idStr == null || idStr.isEmpty()) {
        response.sendRedirect("BanQLy_DeThi.jsp");
        return;
    }

    int examId = Integer.parseInt(idStr);

    DeThiDAO deThiDAO = new DeThiDAO();
    MonHocDAO monHocDAO = new MonHocDAO();

    DeThi exam = deThiDAO.getExamById(examId);
    if (exam == null) {
        request.setAttribute("message", "❌ Không tìm thấy đề thi!");
        request.getRequestDispatcher("BanQLy_DeThi.jsp").forward(request, response);
        return;
    }

    List<MonHoc> danhSachMon = monHocDAO.getAllSubjects();

    request.setAttribute("exam", exam);
    request.setAttribute("danhSachMonHoc", danhSachMon);
    request.getRequestDispatcher("BanQLy_SuaDeThi.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        int examId = Integer.parseInt(request.getParameter("examId"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        int durationMinutes = Integer.parseInt(request.getParameter("durationMinutes"));

        DeThi exam = new DeThi();
        exam.setExamId(examId);
        exam.setTitle(title);
        exam.setDescription(description);
        exam.setSubjectId(subjectId);
        exam.setDurationMinutes(durationMinutes);

        DeThiDAO dao = new DeThiDAO();
        boolean success = dao.updateExam(exam);

        if (success) {
            response.sendRedirect("BanQLy_DeThi.jsp");
        } else {
            request.setAttribute("message", "❌ Cập nhật đề thi thất bại!");
            request.getRequestDispatcher("BanQLy_SuaDeThi.jsp").forward(request, response);
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
