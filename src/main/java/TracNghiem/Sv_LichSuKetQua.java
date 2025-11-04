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
import javax.servlet.http.HttpSession;
import ketnoi.DeThi;
import ketnoi.DeThiDAO;
import ketnoi.KetQua;
import ketnoi.KetQuaDAO;
import ketnoi.MonHoc;
import ketnoi.MonHocDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Sv_LichSuKetQua", urlPatterns = {"/Sv_LichSuKetQua"})
public class Sv_LichSuKetQua extends HttpServlet {

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
            out.println("<title>Servlet Sv_LichSuKetQua</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sv_LichSuKetQua at " + request.getContextPath() + "</h1>");
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

    HttpSession session = request.getSession();
    Integer userId = (Integer) session.getAttribute("userID");

    if (userId == null) {
        response.sendRedirect("DangNhap.jsp");
        return;
    }

    KetQuaDAO ketQuaDAO = new KetQuaDAO();
    DeThiDAO deThiDAO = new DeThiDAO();
    MonHocDAO monHocDAO = new MonHocDAO();

    List<KetQua> ketQuaList = ketQuaDAO.getResultsByUserId(userId);
    List<DeThi> deThiList = new ArrayList<>();
    List<MonHoc> monHocList = new ArrayList<>();

    for (KetQua kq : ketQuaList) {
    DeThi deThi = deThiDAO.getExamById(kq.getExamId());
    if (deThi != null) {
        MonHoc mon = monHocDAO.getSubjectById(deThi.getSubjectId());

        deThiList.add(deThi);
        monHocList.add(mon);
    } else {
        // Nếu đề thi bị null, cũng nên bỏ phần tử kết quả tương ứng
        System.out.println("Không tìm thấy đề thi cho exam_id = " + kq.getExamId());
    }
}

    request.setAttribute("ketQuaList", ketQuaList);
    request.setAttribute("deThiList", deThiList);
    request.setAttribute("monHocList", monHocList);

    request.getRequestDispatcher("LichSuKetQua.jsp").forward(request, response);
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
