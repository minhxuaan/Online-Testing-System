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
import ketnoi.DapAnHocSinhDAO;
import ketnoi.KetQuaDAO;
import ketnoi.NguoiDung;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Sv_NopBai", urlPatterns = {"/Sv_NopBai"})
public class Sv_NopBai extends HttpServlet {

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
            out.println("<title>Servlet Sv_NopBai</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sv_NopBai at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        HttpSession session = request.getSession();
        NguoiDung currentUser = (NguoiDung) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("DangNhap.jsp");
            return;
        }

        int userId = currentUser.getUserId();
        int examId = Integer.parseInt(request.getParameter("examId"));

        KetQuaDAO ketQuaDAO = new KetQuaDAO();
        DapAnHocSinhDAO dapAnHocSinhDAO = new DapAnHocSinhDAO();

        List<CauHoi> questions = (List<CauHoi>) session.getAttribute("questions");

        int correctCount = 0;

        // Chưa lưu kết quả, vì cần score → chấm xong mới lưu
        for (CauHoi question : questions) {
            int questionId = question.getQuestionId();
            String selectedAnswer = request.getParameter("answer_" + questionId);
            String correctAnswer = question.getCorrectAnswer();

            // Chấm điểm
            if (selectedAnswer != null && selectedAnswer.equalsIgnoreCase(correctAnswer)) {
                correctCount++;
            }
        }

        int score = correctCount;

        // Lưu kết quả sau khi đã chấm xong
        int resultId = ketQuaDAO.saveResult(userId, examId, score);

        // Lưu từng đáp án ngay sau khi chấm
        for (CauHoi question : questions) {
            int questionId = question.getQuestionId();
            String selectedAnswer = request.getParameter("answer_" + questionId);

            // Lưu luôn, kể cả null (không chọn)
            dapAnHocSinhDAO.saveStudentAnswer(resultId, questionId, selectedAnswer);
        }

        request.setAttribute("score", score);
        request.setAttribute("total", questions.size());
        request.setAttribute("resultId", resultId);

        RequestDispatcher dispatcher = request.getRequestDispatcher("KetQua.jsp");
        dispatcher.forward(request, response);
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
