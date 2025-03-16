/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDao;
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
public class CustomerRent extends HttpServlet {

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

        // Kiểm tra xem người dùng có vai trò 'user' không
        String role = (String) session.getAttribute("role");
        if (role == null || !role.equalsIgnoreCase("customer")) {

            response.sendRedirect("Login.jsp");
            return;
        }

        int vehicleId = Integer.parseInt(request.getParameter("vehicle_id"));

        String customerId = request.getParameter("customer_id");
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        String totalAmount = request.getParameter("total_amount");
        String depositPaid = request.getParameter("deposit_paid");
        String createdAt = request.getParameter("created_at");
        String status = request.getParameter("status");

        OrderDao dao = new OrderDao();
        boolean success = dao.insertOrder(customerId, startDate, endDate, totalAmount, status, depositPaid, createdAt);

        // Tạo thông báo xác nhận và hỗ trợ
        String confirmationMessage;
        String supportMessage = "Nếu cần hỗ trợ, vui lòng liên hệ qua Messenger hoặc gọi hotline 0762399063.";

        // Kiểm tra kết quả từ DAO
        if (success) {

            confirmationMessage = "Đơn hàng của bạn đã cập nhật thành công, vui lòng đợi phê duyệt!";
            int orderId = dao.getOrderId(customerId, startDate, endDate, totalAmount, status, depositPaid, createdAt);
            dao.insertOrderVehicle(orderId, vehicleId);
        } else {
            confirmationMessage = "Đơn hàng không thành công. Vui lòng thử lại sau.";
        }

        // Set các thông báo vào request
        request.setAttribute("vehicle_id", vehicleId);
        request.setAttribute("confirmationMessage", confirmationMessage);
        request.setAttribute("supportMessage", supportMessage);

        request.getRequestDispatcher("CustomerConfirmed.jsp").forward(request, response);

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
