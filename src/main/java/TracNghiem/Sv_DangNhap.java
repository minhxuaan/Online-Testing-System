/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package TracNghiem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ketnoi.DBConnection;
import ketnoi.HashPassword;
import ketnoi.NguoiDung;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Sv_DangNhap", urlPatterns = {"/Sv_DangNhap"})
public class Sv_DangNhap extends HttpServlet {

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
            out.println("<title>Servlet Sv_DangNhap</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sv_DangNhap at " + request.getContextPath() + "</h1>");
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String select = request.getParameter("role"); // 'Admin' hoặc 'Student'

        HttpSession session = request.getSession();
        Connection con = null;

        try {
            con = DBConnection.getConnection();
            String sql = "SELECT user_id, username, password, full_name, role, created_at FROM users WHERE username=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("user_id");
                String hashedPassword = rs.getString("password");
                String role = rs.getString("role");

                if (HashPassword.checkPassword(password, hashedPassword)) {
                    // Kiểm tra chọn đúng vai trò
                    if ((select.equalsIgnoreCase("Admin") && role.equals("admin")) ||
                        (select.equalsIgnoreCase("Student") && role.equals("student"))) {
                        
                        // Tạo đối tượng user lưu vào session
                        NguoiDung user = new NguoiDung();
                        user.setUserId(userId);
                        user.setUsername(username);
                        user.setFullName(rs.getString("full_name"));
                        user.setRole(role);
                        user.setCreatedAt(rs.getTimestamp("created_at"));

                        session.setAttribute("user", user);
                        session.setAttribute("userID", userId);
                        session.setAttribute("username", username);
                        session.setAttribute("role", role);

                        // Chuyển hướng theo vai trò
                        if (role.equals("admin")) {
                            request.getRequestDispatcher("BanQLy_TrangChu.jsp").forward(request, response);
                        } else {
                            request.getRequestDispatcher("TrangChu.jsp").forward(request, response);
                        }
                        return;
                    }
                }
            }

            // Nếu thất bại
            request.setAttribute("error", "Sai tài khoản, mật khẩu hoặc vai trò!");
            request.getRequestDispatcher("DangNhap.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống!");
            request.getRequestDispatcher("DangNhap.jsp").forward(request, response);
        } finally {
            DBConnection.closeConnection(con);
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
