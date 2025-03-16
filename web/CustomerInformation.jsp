<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Information</title>

        <style>
            .error-message {
                color: red;
                font-weight: bold;
                text-align: center;
                margin-top: 20px;
            }

            form {
                margin-bottom: 20px;
            }

            label {
                display: block;
                margin-top: 10px;
            }

            input[type="text"], input[type="date"] {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                margin-top: 20px;
                padding: 10px 15px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            a {
                display: inline-block;
                margin-top: 10px;
                color: blue;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <h2>Customer Information</h2>

        <c:if test="${not empty successMessage}">
            <div style="color: green;">
                <p>${successMessage}</p>
            </div>
        </c:if>

        <c:if test="${not empty cusInformation}">
            <form action="CusInformationServlet" method="post">
                <input type="hidden" name="user_id" value="${cusInformation.get(0).user_id}" />

                <label for="full_name">Full Name:</label>
                <input type="text" id="full_name" name="full_name" value="${cusInformation.get(0).full_name}" readonly /><br>

                <label for="phone_number">Phone Number:</label>
                <input type="text" id="phone_number" name="phone_number" value="${cusInformation.get(0).phone_number}" readonly /><br>

                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="${cusInformation.get(0).address}" readonly /><br>

                <label for="driving_license_number">Driving License Number:</label>
                <input type="text" id="driving_license_number" name="driving_license_number" value="${cusInformation.get(0).driving_license_number}" readonly /><br>

                <label for="date_of_birth">Date of Birth:</label>
                <input type="date" id="date_of_birth" name="date_of_birth" value="${cusInformation.get(0).date_of_birth}" readonly /><br>

                <p style="color: red;">Thông tin khách hàng sau khi xác nhận sẽ không thể thay đổi, nếu có sai sót hãy liên hệ với số 0762399063 để sửa lại.</p>

                <a href="CustomerHomeServlet">Quay lại</a>
            </form>
        </c:if>

        <c:if test="${empty cusInformation}">
            <form action="CusInformationServlet" method="post">
                <input type="text" name="user_id" value="${id}" readonly /><br>

                <label for="full_name">Full Name:</label>
                <input type="text" id="full_name" name="full_name" /><br>

                <label for="phone_number">Phone Number:</label>
                <input type="text" id="phone_number" name="phone_number" /><br>

                <label for="address">Address:</label>
                <input type="text" id="address" name="address" /><br>

                <label for="driving_license_number">Driving License Number:</label>
                <input type="text" id="driving_license_number" name="driving_license_number" /><br>

                <label for="date_of_birth">Date of Birth:</label>
                <input type="date" id="date_of_birth" name="date_of_birth" /><br>

                <p style="color: red;">Thông tin khách hàng sau khi xác nhận sẽ không thể thay đổi, vui lòng nhập chính xác, nếu có sai sót hãy liên hệ với số 0762399063 để sửa lại.</p>

                <input type="submit" value="Submit Information" />

                <a href="CustomerHomeServlet">Quay Lại trang chính</a>
            </form>
        </c:if>

        <c:if test="${not empty errorMessenger}">
            <div class="error-message">
                ${errorMessenger}
            </div>
        </c:if>
    </body>
</html>