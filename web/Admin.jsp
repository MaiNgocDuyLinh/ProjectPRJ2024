<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 80%;
                margin: auto;
                overflow: hidden;
            }
            h1, h2 {
                color: #333;
            }
            table {
                width: 100%;
                margin: 20px 0;
                border-collapse: collapse;
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
            .alert {
                padding: 15px;
                background-color: #f44336;
                color: white;
                margin-bottom: 20px;
            }
            .alert-danger {
                background-color: #f44336;
            }
            a {
                display: inline-block;
                padding: 10px 20px;
                margin: 20px 0;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
            a:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <% if(request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("errorMessage") %>
            </div>
            <% } %>



            <table>
                <tr>
                    <th>ID</th>
                    <th>Tên nhân viên</th>
                    <th>Gmail</th>
                    <th>Chức vụ</th>
                </tr>

                <!-- Kiểm tra và hiển thị danh sách nhân viên -->
                <c:if test="${not empty listU}">
                    <c:forEach var="user" items="${listU}">
                        <tr>
                            <td>${user.user_id}</td>
                            <td>${user.username}</td>
                            <td>${user.email}</td> 
                            <td>${user.role}</td>
                        </tr>
                    </c:forEach>
                </c:if>

                <!-- Hiển thị thông báo nếu không có nhân viên nào -->
                <c:if test="${empty listU}">
                    <tr>
                        <td colspan="4">Không có nhân viên nào.</td>
                    </tr>
                </c:if>
            </table>

            <a href="VehicleController">Quay lại</a>
        </div>
    </body>
</html>
