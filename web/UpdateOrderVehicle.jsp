<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Order Vehicle</title>
    </head>
    <body>
        <h1>Update Pickup and Return Date</h1>

        <c:if test="${not empty listV}">
            <c:forEach var="orderVehicle" items="${listV}">
                <form action="UpdateOrderVehicleFinal" method="post">
                    <input type="hidden" name="orderVehicleId" value="${orderVehicle.orderVehicleId}">
                    <input type="hidden" name="orderId" value="${orderVehicle.orderId}">

                    <label for="pickupDate">Pickup Date:</label>
                    <input type="date" name="pickupDate" value="${orderVehicle.pickupDate != null ? orderVehicle.pickupDate : ''}" required><br>

                    <label for="returnDate">Return Date:</label>
                    <input type="date" name="returnDate" value="${orderVehicle.returnDate != null ? orderVehicle.returnDate : ''}" required><br>

                    <button type="submit">Update</button>
                </form>
            </c:forEach>
        </c:if>

        <c:if test="${empty listV}">
            <p>Order Vehicle not found.</p>
        </c:if>
    </body>
</html>
