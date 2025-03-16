<%-- 
    Document   : LoginSignUp2
    Created on : Dec 4, 2024, 11:21:10 AM
    Author     : admin
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
        <script>
            function validateForm() {
                const password = document.forms["signupForm"]["password"].value;
                const confirmPassword = document.forms["signupForm"]["confirmPassword"].value;

                if (password !== confirmPassword) {
                    alert("Passwords do not match!");
                    return false; // Prevent form submission
                }
                return true; // Allow form submission
            }
        </script>
    </head>
    <body>
        <h1>Welcome to Sign Up</h1>
        <form name="signupForm" action="LoginSignUp" method="POST" onsubmit="return validateForm()">
            <p style="color: red;">The username or email is used</p>


            UserName: <input type="text" name="username" required><br>
            Email: <input type="email" name="email" required><br>
            Password: <input type="password" name="password" required><br>
            Confirm Password: <input type="password" name="confirmPassword" required><br>
            <button type="submit">Submit</button>
            <button type="reset">Reset</button>
        </form>

        <h1>DO YOU HAVE ACCOUNT COMBACK TO LOGIN</h1>
        <button onclick="window.location.href = 'LoginCustomer.jsp'">Back to Login</button>


    </body>
</html>
