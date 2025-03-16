<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dal.Vehicle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh Sách Xe</title>
        <style>
            /* Các style cũ vẫn giữ nguyên */
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f8f8; /* Light background */
                margin: 0;
                padding: 20px;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }
            h1 {
                text-align: center;
                color: #333333; /* Darker color for heading */
            }
            .search-container {
                margin-bottom: 20px;
                display: flex;
                justify-content: flex-start;
            }
            .search-container input[type="text"] {
                padding: 8px;
                border: 1px solid #cccccc; /* Lighter border */
                border-radius: 4px;
                width: 300px;
            }
            .search-container button {
                padding: 8px 12px;
                margin-left: 5px;
                background-color: #5cb85c; /* Green color similar to buttons in the image */
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .search-container button:hover {
                background-color: #4cae4c; /* Darker green on hover */
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                background-color: #ffffff;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #dddddd; /* Lighter row borders */
            }
            th {
                background-color: #5cb85c; /* Green color similar to header */
                color: white;
            }
            tr:hover {
                background-color: #f1f1f1; /* Light gray background on hover */
            }
            tr:hover td {
                background-color: #f1f1f1;
            }
            a {
                text-decoration: none;
                color: #5cb85c; /* Green link color */
            }
            a:hover {
                text-decoration: underline;
                color: #4cae4c; /* Darker green on hover */
            }
            .action-links {
                display: flex;
                gap: 10px;
            }
            footer {
                margin-top: auto;
                text-align: center;
                padding: 10px;
                background-color: #333333; /* Dark gray footer */
                color: white;
            }
            .btn-insert {
                display: block;
                margin: 20px auto;
                padding: 10px 20px;
                background-color: #5cb85c; /* Green button */
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
            }
            .btn-insert:hover {
                background-color: #4cae4c; /* Darker green on hover */
            }
            .btn-action {
                display: inline-block;
                padding: 5px 10px;
                background-color: #5cb85c; /* Green for action buttons */
                color: white;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }
            .btn-action:hover {
                background-color: #4cae4c; /* Darker green on hover */
            }

            /* Tạo thanh tài khoản */
            .account-container {
                display: flex;
                justify-content: flex-end;
                margin-bottom: 20px;
            }
            .account-dropdown {
                position: relative;
                display: inline-block;
            }
            .account-dropdown button {
                padding: 8px 12px;
                background-color: #5cb85c;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .account-dropdown button:hover {
                background-color: #4cae4c;
            }
            .account-dropdown-content {
                display: none;
                position: absolute;
                background-color: #ffffff;
                min-width: 160px;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                z-index: 1;
                right: 0;
            }
            .account-dropdown:hover .account-dropdown-content {
                display: block;
            }
            .account-dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .account-dropdown-content a:hover {
                background-color: #f1f1f1;
            }
        </style>
    </head>
    <body>
        <!-- Thanh tài khoản -->
        <div class="account-container">
            <div class="account-dropdown">
                <button>Tài Khoản Của Tôi</button>
                <div class="account-dropdown-content">
                    <a href="CusInformationGetId?userId=<%= session.getAttribute("userId") %>">Thông tin cá nhân</a>
                    <a href="OrderHistoryServlet?customer_id=<%= session.getAttribute("customerId") %>">Đơn hàng</a>
                    <a href="LogOut">Đăng xuất</a>
                </div>
            </div>
        </div>

        <h1>Danh Sách Xe</h1>
        CustomerId của bạn: <c:out value="${sessionScope.customerId}" />
        <h2>
            <c:choose>
                <c:when test="${not empty customerIdMessage}">
                    ${customerIdMessage}
                </c:when>
                <c:otherwise>
                    Vui lòng cập nhật thông tin tài khoản
                </c:otherwise>
            </c:choose>
        </h2>




        <!-- Thanh tìm kiếm -->
        <div class="search-container">
            <form action="CustomerSearch" method="post">
                <input type="text" name="search" value="${param.search}" placeholder="Tìm kiếm xe...">
                <input type="submit" value="Tìm kiếm">
            </form>
        </div>

        <table>
            <tr>
                <th>ID</th>
                <th>Loại Phương Tiện</th>
                <th>Mô Hình</th>
                <th>Thương Hiệu</th>
                <th>Số Đăng Ký</th>
                <th>Năm Sản Xuất</th>
                <th>Miêu Tả</th>
                <th>Giá/Ngày</th>
                <th>Trạng Thái</th>
                <th>Ảnh</th>
                <th>Thao Tác</th> <!-- Cột thao tác -->
            </tr>

            <!-- Kiểm tra và hiển thị danh sách xe -->
            <c:if test="${not empty listV}">
                <c:forEach var="vehicle" items="${listV}">
                    <tr>
                        <td>${vehicle.vehicle_id}</td>
                        <td>${vehicle.vehicle_type}</td>
                        <td>${vehicle.model}</td>
                        <td>${vehicle.brand}</td>
                        <td>${vehicle.registration_number}</td>
                        <td>${vehicle.manufacture_year}</td>
                        <td>${vehicle.description}</td>
                        <td>${vehicle.price_per_day}</td>
                        <td>${vehicle.status}</td>
                        <td><img src="${vehicle.img}" alt="alt" style="width:300px;height:auto;"/></td>
                        <td class="action-links">
                            <a href="CustomerRentGetId?vehicle_id=${vehicle.vehicle_id}" class="btn-action"
                               onclick="return confirm('Bạn có chắc chắn muốn thuê phương tiện này không?');">Thuê xe</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>

            <!-- Hiển thị thông báo nếu không có xe nào -->
            <c:if test="${empty listV}">
                <tr>
                    <td colspan="10">Không tìm thấy phương tiện nào.</td> <!-- Cập nhật colspan thành 10 -->
                </tr>
            </c:if>

        </table>

        <footer>
            <p>Cửa hàng thuê xe ABC</p>
            <p>Số điện thoại liên hệ: 0123-456-789</p>
        </footer>
    </body>
</html>
