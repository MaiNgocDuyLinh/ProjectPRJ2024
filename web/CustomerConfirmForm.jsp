<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cập Nhật Thông Tin</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #e9ecef;
                margin: 0;
                padding: 20px;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }
            h1 {
                text-align: center;
                color: #343a40;
            }
            form {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                max-width: 800px;
                margin: 20px auto;
                width: 100%;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #495057;
            }
            input[type="text"], select {
                width: 100%;
                padding: 8px;
                border: 1px solid #ced4da;
                border-radius: 4px;
                margin-bottom: 15px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                padding: 10px 15px;
                font-size: 16px;
                display: block;
                width: 100%;
            }
            input[type="submit"]:hover {
                background-color: #218838;
            }
            img {
                margin: 10px 0;
            }
            .back-link {
                display: block;
                margin: 20px auto;
                text-align: center;
                text-decoration: none;
                color: #007BFF;
            }
            .back-link:hover {
                text-decoration: underline;
            }
            .message {
                color: green;
                font-weight: bold;
                margin-bottom: 20px;
            }
        </style>

        <!-- JavaScript to set today's date in the 'created_at' input field -->
        <script>
            window.onload = function () {
                var today = new Date();
                var dd = String(today.getDate()).padStart(2, '0');
                var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
                var yyyy = today.getFullYear();

                today = yyyy + '-' + mm + '-' + dd; // Format: YYYY-MM-DD

                var createdAtField = document.getElementById("created_at");
                createdAtField.value = today;
                createdAtField.setAttribute("readonly", true);  // Set readonly to prevent editing
            }
        </script>
    </head>
    <body>
        <h1>Cập Nhật Thông Tin</h1>

        <!-- Display message if exists -->
        <c:if test="${not empty message}">
            <div class="message">
                ${message}
            </div>
        </c:if>

        <c:if test="${not empty confirmationMessage}">
            <div class="message">
                ${confirmationMessage}
            </div>
        </c:if>

        <c:if test="${not empty supportMessage}">
            <div class="message">
                ${supportMessage}
            </div>
        </c:if>



        <!-- Form with confirmation prompt on submit -->
        <form action="CustomerRent">
            <input type="text" name="vehicle_id" value="${vehicleId}" readonly/><br>

            <label>CustomerID:</label>
            <input type="text" name="customer_id" value="${customer_id}" readonly/><br>

            <label>Ngày lấy xe(dự tính):</label>
            <input type="date" name="start_date" /><br>
            <label>Ngày trả xe:</label>
            <input type="date" name="end_date"/><br/>
            <label>Tổng chi phí:</label>
            <input type="text" name="total_amount" /><br/>

            <input type="text" name="status" value="pending" hidden>

            <label>Trả trước:</label>
            <input type="text" name="deposit_paid" /><br/>
            <label>Ngày tạo đơn:</label>
            <input type="date" name="created_at" id="created_at" /><br/> <!-- Add id to target this field -->

           
            <input type="submit" value="Hoàn Thành đơn"/>
            
            
            
        </form>
        <a href="CustomerHomeServlet" class="back-link">Quay Lại trang chính</a>
        <a href="CustomerHomeServlet" class="back-link">Hủy</a>



    </body>
</html>
