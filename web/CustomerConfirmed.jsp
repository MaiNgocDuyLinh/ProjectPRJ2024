<%-- 
    Document   : CustomerConfirmed
    Created on : Dec 12, 2024, 4:13:06 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xác nhận đơn hàng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f9;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                max-width: 400px;
            }
            .message {
                font-size: 18px;
                color: #333;
                margin-bottom: 15px;
            }
            .errorMessage {
                font-size: 16px;
                color: #e74c3c;
                margin-bottom: 15px;
            }
            .support {
                font-size: 14px;
                color: #555;
                margin-top: 15px;
            }
            .button {
                display: inline-block;
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #3498db;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }
            .button:hover {
                background-color: #2980b9;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <c:choose>
                <c:when test="${not empty confirmationMessage}">
                    <div class="message">${confirmationMessage}</div>
                </c:when>
                <c:when test="${not empty errorMessage}">
                    <div class="errorMessage">${errorMessage}</div>
                </c:when>
            </c:choose>

            <div class="support">
                Nếu cần hỗ trợ, vui lòng liên hệ qua Messenger hoặc gọi hotline: <strong>0762399063</strong>.
            </div>

            <a href="CustomerHomeServlet" class="button">Trở về Trang Chủ</a>
        </div>
    </body>
</html>
