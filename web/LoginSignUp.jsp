<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                text-align: center;
            }
            h1 {
                color: #333;
                margin-bottom: 20px;
            }
            .form-group {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
            }
            .form-group label {
                flex: 1;
                text-align: left;
                margin-right: 10px;
            }
            .form-group input {
                flex: 2;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            button {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }
            .alert {
                padding: 15px;
                background-color: #f44336;
                color: white;
                margin-bottom: 20px;
            }
            .alert-danger {
                background-color: #f44336;
            }
            .back-button {
                background-color: #008CBA;
            }
            .back-button:hover {
                background-color: #007B9A;
            }
        </style>
        <script>
            function validateForm() {
                const password = document.forms["signupForm"]["password"].value;
                const confirmPassword = document.forms["signupForm"]["confirmPassword"].value;

                if (password !== confirmPassword) {
                    alert("Passwords do not match!");
                    return false; 
                }
                return true; 
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Welcome to Sign Up</h1>
            <form name="signupForm" action="LoginSignUp" method="POST" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="username">UserName:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </form>
            
            <h1>DO YOU HAVE ACCOUNT COMBACK TO LOGIN</h1>
            <button class="back-button" onclick="window.location.href = 'LoginCustomer.jsp'">Back to Login</button>
        </div>
    </body>
</html>
