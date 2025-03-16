<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vehicle Orders</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
            }
            h1, h2 {
                color: #333;
                margin-bottom: 20px;
            }
            table {
                width: 90%;
                margin: 20px 0;
                border-collapse: collapse;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            button {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }
            .back-link {
                display: inline-block;
                padding: 10px 20px;
                margin: 20px 0;
                background-color: #008CBA;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
            .back-link:hover {
                background-color: #007B9A;
            }
            .container {
                width: 100%;
                max-width: 1200px;
                margin: auto;
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Danh Sách Đơn Hàng Đang Chờ</h1>

            <!-- Hiển thị danh sách đơn hàng -->
            <c:if test="${not empty listO}">
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer ID</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                            <th>Deposit Paid</th>
                            <th>Created At</th>
                            <th>Action</th> <!-- Thêm cột hành động -->
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${listO}">
                            <tr>
                                <td>${order.order_id}</td>
                                <td>${order.customerId}</td>
                                <td>${order.startDate}</td>
                                <td>${order.endDate}</td>
                                <td>${order.totalAmount}</td>
                                <td>${order.status}</td>
                                <td>${order.depositPaid}</td>
                                <td>${order.createdAt}</td>
                                <td>
                                    <!-- Nút phê duyệt cho từng đơn hàng -->
                                    <form action="VehicleOrderConfirm" >
                                        <input type="hidden" name="order_id" value="${order.order_id}">
                                        <button type="submit">Phê Duyệt</button>
                                    </form>
                                    <form action="VehicleOrderDeny" >
                                        <input type="hidden" name="order_id" value="${order.order_id}">
                                        <button type="submit">Từ chối</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <c:if test="${empty listO}">
                <p>Không có đơn hàng nào đang chờ.</p>
            </c:if>

            <!-- Hiển thị danh sách các xe đã được thuê -->
            <h2>Danh Sách Các Xe Đã Được Thuê</h2>

            <c:if test="${not empty listV}">
                <table>
                    <thead>
                        <tr>
                            <th>Order Vehicle ID</th>
                            <th>Order ID</th>
                            <th>Vehicle ID</th>
                            <th>Pickup Date</th>
                            <th>Return Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="orderVehicle" items="${listV}">
                            <tr>
                                <td>${orderVehicle.orderVehicleId}</td>
                                <td>${orderVehicle.orderId}</td>
                                <td>${orderVehicle.vehicleId}</td>
                                <td>${empty orderVehicle.pickupDate ? 'Chưa có ngày lấy' : orderVehicle.pickupDate}</td>
                                <td>${empty orderVehicle.returnDate ? 'Chưa có ngày trả' : orderVehicle.returnDate}</td>
                                <td>
                                    <!-- Form để gửi yêu cầu cập nhật -->
                                    <form action="UpdateOrderVehicle" method="POST">
                                        <input type="hidden" name="orderVehicleId" value="${orderVehicle.orderVehicleId}">
                                        <input type="hidden" name="orderId" value="${orderVehicle.orderId}">
                                        <button type="submit">Cập nhật</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <c:if test="${empty listV}">
                <p>Không có xe nào đã được thuê.</p>
            </c:if>

            <a href="VehicleController" class="back-link">Quay lại</a>
        </div>
    </body>
</html>
