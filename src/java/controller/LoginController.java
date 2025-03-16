/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.Account;
import dao.AccountDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private boolean isEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        return email.matches(emailRegex);
    }

    AccountDao dao = new AccountDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
        String userOrEmail = request.getParameter("username");
        String pass = request.getParameter("password");
        String role = request.getParameter("role");

        boolean isAuthen = false;
        Account account = new Account(userOrEmail, null, pass);

        isAuthen = dao.checkAccount(account, role);

        if (isAuthen) {

            HttpSession session = request.getSession();
            session.setAttribute("username", userOrEmail);
            session.setAttribute("role", role);
            session.setMaxInactiveInterval(60 * 60);

            // Chuyển hướng theo vai trò
            switch (role.toLowerCase()) {
                case "user":
                    response.sendRedirect("VehicleController");
                    break;
                case "admin":
                    response.sendRedirect("VehicleController");
                    break;
                default:
                    request.setAttribute("errorMessage", "Vai trò không hợp lệ.");
                    request.getRequestDispatcher("LoginCustomer.jsp").forward(request, response);
                    break;
            }
        } else {
            // Xử lý khi đăng nhập thất bại
            request.setAttribute("errorMessage", "Đăng nhập thất bại.");

            if ("customer".equalsIgnoreCase(role)) {
                request.getRequestDispatcher("LoginCustomer.jsp").forward(request, response);
            } else if ("user".equalsIgnoreCase(role) || "admin".equalsIgnoreCase(role)) {
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Vai trò không hợp lệ.");
                request.getRequestDispatcher("LoginCustomer.jsp").forward(request, response);
            }
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
