<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="dal.Vehicle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thuê Xe</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f7f7f7;
                margin: 0;
                padding: 20px;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            .vehicle-info {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                max-width: 800px;
                margin: 20px auto;
                width: 100%;
            }
            .vehicle-info label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
                color: #495057;
            }
            .vehicle-info p {
                margin: 5px 0;
                color: #555;
            }
            .vehicle-info img {
                margin-top: 10px;
                width: 300px;
                height: auto;
                border-radius: 5px;
            }
            .button {
                text-align: center;
                margin-top: 20px;
            }
            .button a {
                padding: 10px 20px;
                background-color: #28a745;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
            .button a:hover {
                background-color: #218838;
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
            .error-message {
                color: red;
                font-weight: bold;
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <h1>Chi Tiết Xe</h1>

        <!-- Display error message if it exists -->
        <c:if test="${not empty errorMessenger}">
            <div class="error-message">
                ${errorMessenger}
            </div>
        </c:if>

        <div class="vehicle-info">
            <label>ID Xe:</label>
            <p>${vehicle.vehicle_id}</p>

            <label>Loại Xe:</label>
            <p>${vehicle.vehicle_type}</p>

            <label>Mô Hình:</label>
            <p>${vehicle.model}</p>

            <label>Thương Hiệu:</label>
            <p>${vehicle.brand}</p>

            <label>Biển Số:</label>
            <p>${vehicle.registration_number}</p>

            <label>Năm Sản Xuất:</label>
            <p>${vehicle.manufacture_year}</p>

            <label>Giá/Ngày:</label>
            <p>${vehicle.price_per_day}</p>

            <label>Trạng Thái:</label>
            <p>${vehicle.status}</p>

            <label>Mô Tả:</label>
            <p>${vehicle.description}</p>

            <label>Hình Ảnh:</label>
            <img src="${vehicle.img}" alt="Hình ảnh xe"/>

            <label>Thanh toán khi nhận được xe</label>

            <div class="button">
                <a href="CheckCustomerInfoServlet?userId=${userId}&vehicleId=${vehicle.vehicle_id}" class="btn btn-success">Xác nhận</a>
            </div>
        </div>

        <a href="CustomerHomeServlet" class="back-link">Quay lại danh sách xe</a>
    </body>
</html>
