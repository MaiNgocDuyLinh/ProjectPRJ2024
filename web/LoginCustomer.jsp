<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: linear-gradient(135deg, #74ebd5, #acb6e5);
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .login-container {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                width: 300px;
                text-align: center;
            }

            h1 {
                color: #333;
                margin-bottom: 20px;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            input {
                margin-bottom: 15px;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
                outline: none;
            }

            button {
                padding: 10px;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                margin-top: 10px;
                transition: background 0.3s;
            }

            button[type="submit"] {
                background: #74ebd5;
                color: #fff;
            }

            button[type="submit"]:hover {
                background: #62d1c3;
            }

            button[type="reset"] {
                background: #f0f0f0;
                color: #333;
            }

            button[type="reset"]:hover {
                background: #ddd;
            }

            .error-message {
                color: red;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h1>Login</h1>
            <form action="LoginCustomerController" method="POST">
                <input type="text" name="username" placeholder="Username or Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="text" name="role" value="customer" hidden>
                <button type="submit">Login</button>
                <a href="LoginSignUp.jsp">Đăng kí</a>

            </form>
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
            <p class="error-message"><%= errorMessage %></p>
            <%
                }
            %>
        </div>
    </body>
</html>
