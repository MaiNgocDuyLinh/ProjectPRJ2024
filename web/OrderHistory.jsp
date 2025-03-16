<%-- 
    Document   : OrderHistory
    Created on : Dec 11, 2024, 10:44:47 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Order History</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Order History</h1>

    <%-- Kiểm tra danh sách đơn hàng --%>
    <c:if test="${empty listO}">
        <p>No orders found.</p>
    </c:if>

    <%-- Hiển thị danh sách đơn hàng --%>
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
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <br>
    <a href="CustomerHomeServlet">Back to Home</a>
</body>
</html>