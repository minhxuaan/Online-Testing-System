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
import ketnoi.CauHoi;
import ketnoi.CauHoiDAO;
import ketnoi.DapAnHocSinh;
import ketnoi.DapAnHocSinhDAO;
import ketnoi.KetQua;
import ketnoi.KetQuaDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Sv_ChiTietKetQua", urlPatterns = {"/Sv_ChiTietKetQua"})
public class Sv_ChiTietKetQua extends HttpServlet {

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
            out.println("<title>Servlet Sv_ChiTietKetQua</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sv_ChiTietKetQua at " + request.getContextPath() + "</h1>");
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
    private DapAnHocSinhDAO dapAnHocSinhDAO = new DapAnHocSinhDAO();
    private CauHoiDAO cauHoiDAO = new CauHoiDAO();
    private KetQuaDAO ketQuaDAO = new KetQuaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String resultIdStr = request.getParameter("resultId");
    if (resultIdStr == null || resultIdStr.isEmpty()) {
        response.sendRedirect("TrangChu.jsp");
        return;
    }

    try {
        int resultId = Integer.parseInt(resultIdStr);

        // Lấy danh sách đáp án học sinh theo resultId
       List<DapAnHocSinh> studentAnswers = dapAnHocSinhDAO.getAnswersByResultId(resultId);


        int total = studentAnswers.size();
        int score = 0;

        // Lấy thông tin chi tiết câu hỏi cho từng đáp án và tính điểm
        for (DapAnHocSinh answer : studentAnswers) {
            CauHoi question = cauHoiDAO.getQuestionById(answer.getQuestionId());
            answer.setQuestion(question); // Gắn câu hỏi vào đáp án
            if (question != null && answer.getSelectedAnswer() != null &&
                answer.getSelectedAnswer().equalsIgnoreCase(question.getCorrectAnswer())) {
                score++;
            }
        }

        // Lấy thông tin kết quả tổng quát từ bảng results
        KetQua ketQua = ketQuaDAO.getResultById(resultId);

        // Gửi dữ liệu sang JSP
        request.setAttribute("studentAnswers", studentAnswers);
        request.setAttribute("ketQua", ketQua);
        request.setAttribute("score", score);
        request.setAttribute("total", total);

        RequestDispatcher dispatcher = request.getRequestDispatcher("ChiTietKetQua.jsp");
        dispatcher.forward(request, response);

    } catch (NumberFormatException e) {
        e.printStackTrace();
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
