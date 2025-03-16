<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dal.Vehicle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh Sách Xe</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f8f8;
                margin: 0;
                padding: 20px;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }
            h1 {
                text-align: center;
                color: #333333;
            }

            /* Container cho tài khoản */
            .account-container {
                display: flex;
                justify-content: flex-end;
                padding: 10px 20px;
                background-color: #333333;
                color: white;
                align-items: center;
            }
            .account-dropdown {
                position: relative;
                display: inline-block;
            }
            .account-dropdown button {
                background-color: #333333;
                color: white;
                border: none;
                padding: 10px;
                cursor: pointer;
                font-size: 16px;
            }
            .account-dropdown button:hover {
                background-color: #444444;
            }
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #5cb85c;
                min-width: 160px;
                box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
                z-index: 1;
                right: 0;
            }
            .account-dropdown:hover .dropdown-content {
                display: block;
            }
            .dropdown-content a {
                color: white;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .dropdown-content a:hover {
                background-color: #4cae4c;
            }
            .search-container {
                margin-bottom: 20px;
                display: flex;
                justify-content: flex-start;
            }
            .search-container input[type="text"] {
                padding: 8px;
                border: 1px solid #cccccc;
                border-radius: 4px;
                width: 300px;
            }
            .search-container button {
                padding: 8px 12px;
                margin-left: 5px;
                background-color: #5cb85c;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .search-container button:hover {
                background-color: #4cae4c;
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
                border-bottom: 1px solid #dddddd;
            }
            th {
                background-color: #5cb85c;
                color: white;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
            a {
                text-decoration: none;
                color: #5cb85c;
            }
            a:hover {
                text-decoration: underline;
                color: #4cae4c;
            }
            .action-links {
                display: flex;
                gap: 10px;
            }
            footer {
                margin-top: auto;
                text-align: center;
                padding: 10px;
                background-color: #333333;
                color: white;
            }
            .btn-insert {
                display: block;
                margin: 20px auto;
                padding: 10px 20px;
                background-color: #5cb85c;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
            }
            .btn-insert:hover {
                background-color: #4cae4c;
            }
            .btn-action {
                display: inline-block;
                padding: 5px 10px;
                background-color: #5cb85c;
                color: white;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }
            .btn-action:hover {
                background-color: #4cae4c;
            }
        </style>
    </head>
    <body>
        <!-- Ô tài khoản với menu dropdown -->
        <div class="account-container">
            <div class="account-dropdown">
                <button>${sessionScope.username}</button> <!-- Hiển thị tên người dùng -->
                <div class="dropdown-content">
                    <a href="LogOut">Đăng xuất</a>
                </div>
            </div>
        </div>

        <h1>Danh Sách Xe</h1>

        <!-- Thanh tìm kiếm -->
        <div class="search-container">
            <form action="VehicleSearch" method="post">
                <input type="text" name="search" value="${param.search}" placeholder="Tìm kiếm xe...">
                <input type="submit" value="Tìm kiếm">
            </form>
        </div>

        <a href="VehicleOrder" >Các Đơn Xe</a>
        <a href="AdminController" >Danh sách nhân viên</a>


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
                <th>Thao Tác</th>
            </tr>


            <c:if test="${not empty listP}">
                <c:forEach var="vehicle" items="${listP}">
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
                            <a href="VehicleUpdateGetId?vehicle_id=${vehicle.vehicle_id}" class="btn-action">Cập Nhật</a>
                            <a href="VehiclesDelete?vehicle_id=${vehicle.vehicle_id}" class="btn-action" onclick="return confirm('Bạn có chắc chắn muốn xóa phương tiện này không?');">Xóa</a>
                            <a href="MaintenanceHistoryController?vehicle_id=${vehicle.vehicle_id}" class="btn-action">Bảo Trì</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>

            <!-- Hiển thị thông báo nếu không có xe nào -->
            <c:if test="${empty listP}">
                <tr>
                    <td colspan="10">Không tìm thấy phương tiện nào.</td>
                </tr>
            </c:if>
        </table>

        <a href="VehicleInsert" class="btn-insert">Thêm Xe</a> 

        <footer>
            <p>Cửa hàng thuê xe ABC</p>
            <p>Số điện thoại liên hệ: 0123-456-789</p>
        </footer>
    </body>
</html>
