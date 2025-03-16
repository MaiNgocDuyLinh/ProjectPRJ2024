<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin khách hàng</title>
</head>
<body>
    <h2>Thông tin khách hàng</h2>
    <table border="1">
        <tr>
            <th>ten</th>
            <td>${name}</td>
        </tr>
        <tr>
            <th>phone</th>
            <td>${phonenumber}</td>
        </tr>
        <tr>
            <th>dia chi</th>
            <td>${address}</td>
        </tr>
        <tr>
            <th>bang lai</th>
            <td>${driving_license_number}</td>
        </tr>
        <tr>
            <th>birth</th>
            <td>${date_of_birth}</td>
        </tr>
    </table>

    <h3>User ID: ${userid}</h3>
</body>
</html>
