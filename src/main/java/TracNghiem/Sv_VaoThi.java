/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package TracNghiem;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ketnoi.CauHoi;
import ketnoi.CauHoiDAO;
import ketnoi.DeThi;
import ketnoi.DeThiDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Sv_VaoThi", urlPatterns = {"/Sv_VaoThi"})
public class Sv_VaoThi extends HttpServlet {

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
            out.println("<title>Servlet Sv_VaoThi</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sv_VaoThi at " + request.getContextPath() + "</h1>");
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
            HttpSession session = request.getSession();
            String examIdStr = request.getParameter("examId");


        if (examIdStr != null && !examIdStr.isEmpty()) {
            try {
                int examId = Integer.parseInt(examIdStr);

                DeThiDAO deThiDAO = new DeThiDAO();
                CauHoiDAO cauHoiDAO = new CauHoiDAO();

                // Lấy đề thi
                DeThi exam = deThiDAO.getExamById(examId);

                if (exam != null) {
                    int subjectId = exam.getSubjectId();
                    int duration = exam.getDurationMinutes();

                    // Xác định số lượng câu hỏi theo thời lượng
                    int soLuongCauHoi = (duration == 15) ? 5 : (duration == 45 ? 10 : 0);

                    // Lấy câu hỏi random theo môn học
                    List<CauHoi> questions = cauHoiDAO.getRandomQuestionsBySubject(subjectId, soLuongCauHoi);

                // Set session thay vì request
                session.setAttribute("questions", questions);

                // Đưa exam lên request để hiển thị
                request.setAttribute("exam", exam);

                    RequestDispatcher dispatcher = request.getRequestDispatcher("Thi.jsp");
                    dispatcher.forward(request, response);
                } else {
                    response.sendRedirect("TrangChu.jsp");
                }

            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("TrangChu.jsp");
            }
        } else {
            response.sendRedirect("TrangChu.jsp");
        }
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
        processRequest(request, response);
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
