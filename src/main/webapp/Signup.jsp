<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Signup</title>
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

        .signup-box {
            background-color: #1a1a1a;
            padding: 10px 40px 10px 10px;
            border-radius: 12px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            transition: transform 0.3s ease-in-out;
        }

        .signup-box:hover {
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

        .login-link {
            text-align: center;
            margin-top: 20px;
            margin-left: 30px;
            font-size: 16px;
            color: #ffffff;
        }

        .login-link a {
            color: #1abc9c;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="logo1.png" alt="" height="150px" width="150px">
        </div>
        <div class="signup-box">
            <h2>Bank Signup</h2>
            <%
            String failure=(String)request.getAttribute("failure");
            
            if(failure!=null)
            {
            %>
            <div style="color:red; font-size:25px; margin-top:-25px; text-align:center; font-weight:bold;" >
            <%=failure%>
            </div>
            <%
            }
            %>
            
            <form action="signup" method="post">
                <div class="input-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" placeholder="Enter your full name" required>
                </div>

                <div class="input-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>
                </div>

                <div class="input-group">
                    <label for="mail">Email</label>
                    <input type="email" id="mail" name="mail" placeholder="Enter your email" required>
                </div>

                <div class="input-group">
                    <label for="pin">Pin</label>
                    <input type="password" id="pin" name="pin" placeholder="Enter your pin" required>
                </div>

                <div class="input-group">
                    <label for="confirmpin">Confirm Pin</label>
                    <input type="password" id="confirmpin" name="confirmpin" placeholder="Confirm your pin" required>
                </div>

                <div class="submit-button">
                    <button type="submit">Sign Up</button>
                </div>

                <div class="login-link">
                    <p>Already have an account? <a href="http://localhost:8080/BankApplication/Login.jsp">Login</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>