<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="css/Login.css">

</head>
<body>
<div class="container">
    <div class="welcome-section">
        <h1>Welcome Back</h1>
        <p>Nice to see you again! Please log in to access your account and manage courses.</p>
    </div>
    <div class="login-section">
        <h2>Login Account</h2>
        <form action="AddStudent" method="post">
            <input type="number" name="phoneNumber" placeholder="Phone Number" required>
            <input type="number" name="otp" placeholder="OTP" required>
            <input type="submit" value="Login">
        </form>
    </div>
</div>
</body>
</html>
