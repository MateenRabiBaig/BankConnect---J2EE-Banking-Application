<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Success</title>
    <style>
        body {
            margin: 0;
            height: 100%;
            width: 100%;
            background-color: #000000;
            font-family: 'Arial', sans-serif;
        }

        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .logo{
            position: absolute;
            top: -20px;
            left: -25px;
        }

        .logo img{
            filter: brightness(2.8);
        }

        h1{
            color: rgb(37, 204, 37);
            font-size: 65px;
            margin-top: -50px;
        }

        h2{
            color: white;
            font-size: 40px;
            margin-left: -10px;
        }
        
        .button-group {
            /* display: flex; */
            /* justify-content: space-between; */
            margin-top: 20px;
        }

        .button-group button {
            padding: 12px 20px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .back-btn {
            background-color: #333333;
            color: #1abc9c;
            /* margin-left: -200px; */
            position: relative;
            left: -60px;
        }

		.back-btn a{
            text-decoration: none;
            color: white;
        }
        
        .back-btn:hover {
            background-color: #292929;
        }

        .login-btn {
            background-color: #1abc9c;
            color: #000000;
            position: relative;
            left: 60px;
        }
        
        .login-btn a{
            text-decoration: none;
            color: white;
        }

        .login-btn:hover {
            background-color: #16a085;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="logo1.png" alt="" height="150px" width="150px">
        </div>

        <h1>Registered Successfully</h1>
        <h2>Your Account number is <%= request.getAttribute("accountNo") != null ? request.getAttribute("accountNo") : "N/A" %></h2>
        
        <div class="button-group">
            <button class="back-btn"><a href="http://localhost:8080/BankApplication/Signup.jsp">Back</a></button>
            <button class="login-btn"><a href="http://localhost:8080/BankApplication/Login.jsp">Login</a></button>
        </div>
    </div>
</body>