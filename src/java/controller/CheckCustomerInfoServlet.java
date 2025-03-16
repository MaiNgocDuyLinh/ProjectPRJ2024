/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CusInformation;
import dal.Customer;
import dao.AccountDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author admin
 */
public class CheckCustomerInfoServlet extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String role = (String) session.getAttribute("role");
        if (role == null || !role.equalsIgnoreCase("customer")) {
            response.sendRedirect("LoginCustomer.jsp");
            return;
        }

        AccountDao dao = new AccountDao();
        int userId = Integer.parseInt(request.getParameter("userId"));
        String vehicleId = request.getParameter("vehicleId");

        boolean hasCompleteInfo = dao.checkInformation(userId);
        List<CusInformation> cus = dao.getCusInformation(userId);

        request.setAttribute("id", userId);
        request.setAttribute("cusInformation", cus);

        if (!hasCompleteInfo) {
            request.setAttribute("errorMessenger", "Vui lòng cập nhật thông tin đầy đủ.");
            request.getRequestDispatcher("CustomerInformation.jsp").forward(request, response);
        } else {
            int cusId = dao.getCusId(userId);
            if (cusId != -1) {
                // Đặt customerId vào session
                session.setAttribute("customerId", cusId);
                request.setAttribute("customer_id", cusId);
                request.setAttribute("vehicleId", vehicleId);
                request.getRequestDispatcher("CustomerConfirmForm.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessenger", "Không tìm thấy thông tin khách hàng.");
                request.getRequestDispatcher("CustomerInformation.jsp").forward(request, response);
            }
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
