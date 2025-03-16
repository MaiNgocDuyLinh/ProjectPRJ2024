<%-- 
    Document   : debug
    Created on : Dec 11, 2024, 11:29:01 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String cusId = (String) request.getAttribute("cusId"); %>
        <p>Customer ID: <%= cusId != null ? cusId : "No data received" %></p>

    </body>
</html>
