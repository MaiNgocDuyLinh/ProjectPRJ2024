/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CusInformation;
import dao.AccountDao;
import dao.VehicleDao;
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
public class CusInformationServlet extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {

            response.sendRedirect("Login.jsp");
            return;
        }

        // Kiểm tra xem người dùng có vai trò 'user' không
        String role = (String) session.getAttribute("role");
        if (role == null || !role.equalsIgnoreCase("customer")) {

            response.sendRedirect("LoginCutomer.jsp");
            return;
        }

        int userId = Integer.parseInt(request.getParameter("user_id"));
        String fullname = request.getParameter("full_name");
        String phone_number = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String driving_license_number = request.getParameter("driving_license_number");
        String date_of_birth = request.getParameter("date_of_birth");

        AccountDao dao = new AccountDao();
        boolean success = dao.insertCustomerInformation(userId, fullname, phone_number, address, driving_license_number, date_of_birth);

        if (success) {
            request.setAttribute("successMessage", "Cập nhật thông tin thành công!");
        } else {
            request.setAttribute("successMessage", "Cập nhật thông tin thất bại!");
        }

        request.getRequestDispatcher("CustomerInformation.jsp").forward(request, response);

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
