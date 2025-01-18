<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Login</title>
    <style>
        body {
            margin: 0;
            height: 100%;
            width: 100%;
            background-color: #000000; /* Black background */
            font-family: 'Arial', sans-serif;
        }

        .container {
            display: flex;
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
            /* background-color: transparent; */
            /* mix-blend-mode: lighten; */
            /* filter: invert(1); */
            /* color: #16a085; */
            filter: brightness(2.8);
        }

        .login-box {
            background-color: #1a1a1a; 
            padding: 10px 40px 10px 10px;
            border-radius: 12px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            transition: transform 0.3s ease-in-out;
        }

        .login-box:hover {
            transform: translateY(-10px);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            margin-left: 20px;
            font-size: 40px;
            color: #1abc9c; 
            font-weight: bold;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            font-size: 20px;
            color: #1abc9c; 
            margin-bottom: 8px;
            margin-left: 3px;
        }

        .input-group input {
            width: 100%;
            padding: 15px;
            font-size: 17px;
            border: 2px solid #333333; 
            border-radius: 8px;
            outline: none;
            transition: border-color 0.3s ease;
            background-color: #333333; 
            color: #ffffff; 
        }

        .input-group input:focus {
            border-color: #1abc9c; 
            box-shadow: 0 0 5px rgba(26, 188, 156, 0.5); 
        }

        .remember-me {
            margin-bottom: 15px;
            font-size: 16px;
            color: #ffffff; 
        }

        .forgot-password {
            text-align: right;
            position: relative;
            left: 10px;
            margin-bottom: 10px;
        }

        .forgot-password a {
            color: #1abc9c; 
            text-decoration: none;
            font-size: 16px;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        .submit-button {
            text-align: center;
        }

        .submit-button button {
            width: 100%;
            margin-left: 15px;
            padding: 15px;
            background-color: #1abc9c; 
            color: #ffffff; 
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-button button:hover {
            background-color: #16a085; 
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
            margin-left: 30px;
            font-size: 16px;
            color: #ffffff; 
        }

        .register-link a {
            color: #1abc9c; 
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
        
        h3{
        	font-size: 30px;
        	color: red;
        	text-align: center;
        	margin-top: -10px;
        	margin-left: 20px;
        }
        
        .success{
        	color: green;
        	font-size: 20px;
        	font-weight: bold;
        	text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="logo1.png" alt="" height="150px" width="150px">
        </div>
        <div class="login-box">
            <h2>Bank Login</h2>
            <%String success=(String)request.getAttribute("success");
			if(success!=null){%>
			<h3 class="success"><%=success%></h3>
			<%}%>
            <%String failure=(String)request.getAttribute("failure");
			if(failure!=null){%>
			<h3 class="failure"><%=failure%></h3>
			<%}%>
            <form action="login" method="post">
                <div class="input-group">
                    <label for="account">Account No.</label>
                    <input type="number" id="account" name="account" placeholder="Enter your Account No." required>
                </div>
                <div class="input-group">
                    <label for="pin">Pin</label>
                    <input type="password" id="pin" name="pin" placeholder="Enter your Pin" required>
                </div>
                <div class="remember-me">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Remember me</label>
                </div>
                <div class="forgot-password">
                    <a href="http://localhost:8080/BankApplication/Forgot.jsp">Forgot Password?</a>
                </div>
                <div class="submit-button">
                    <button type="submit">Login</button>
                </div>
                <div class="register-link">
                    <p>Don't have an account? <a href="http://localhost:8080/BankApplication/Signup.jsp">Register</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>