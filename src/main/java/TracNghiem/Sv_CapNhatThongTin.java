/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package TracNghiem;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ketnoi.HashPassword;
import ketnoi.NguoiDung;
import ketnoi.NguoiDungDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Sv_CapNhatThongTin", urlPatterns = {"/Sv_CapNhatThongTin"})
public class Sv_CapNhatThongTin extends HttpServlet {

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
            out.println("<title>Servlet Sv_CapNhatThongTin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sv_CapNhatThongTin at " + request.getContextPath() + "</h1>");
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

        NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
        int userId = Integer.parseInt(request.getParameter("userId"));
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");

        // Lấy thông tin hiện tại từ DB để giữ mật khẩu cũ nếu không thay đổi
        NguoiDung existingUser = nguoiDungDAO.getUserById(userId);
        if (existingUser == null) {
            response.sendRedirect("SuaThongTinNguoiDung.jsp?error=notfound");
            return;
        }

        String hashedPassword;
        if (password != null && !password.trim().isEmpty()) {
            // Nếu có mật khẩu mới → hash bằng class HashPassword
            hashedPassword = HashPassword.hashPassword(password);
        } else {
            // Nếu không nhập gì → giữ nguyên mật khẩu cũ
            hashedPassword = existingUser.getPassword();
        }

        NguoiDung user = new NguoiDung();
        user.setUserId(userId);
        user.setFullName(fullName);
        user.setPassword(hashedPassword);

        boolean success = nguoiDungDAO.updateUserInfo(user);
        if (success) {
            // Cập nhật session luôn
            HttpSession session = request.getSession();
            NguoiDung updatedUser = nguoiDungDAO.getUserById(userId);
            session.setAttribute("user", updatedUser);

            response.sendRedirect("Sv_ThongTinNguoiDung");
        } else {
            response.sendRedirect("SuaThongTinNguoiDung.jsp?error=1");
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
