<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
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
            /* background-color: transparent; */
            /* mix-blend-mode: lighten; */
            /* filter: invert(1); */
            /* color: #16a085; */
            filter: brightness(2.8);
        }

        .forgot-box {
            background-color: #1a1a1a; 
            padding: 10px 40px 10px 10px;
            border-radius: 12px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            transition: transform 0.3s ease-in-out;
        }

        .forgot-box:hover {
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

        .button-group {
            display: flex;
            justify-content: space-between;
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
        }

        .back-btn:hover {
            background-color: #292929;
        }

        .submit-btn {
            background-color: #1abc9c;
            color: #000000;
        }

        .submit-btn:hover {
            background-color: #16a085;
        }
        
        h3{
        	font-size: 30px;
        	color: red;
        	text-align: center;
        	margin-top: -10px;
        	margin-left: 20px;
        }
        
        .failure{
        	color: red;
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
        <div class="forgot-box">
            <h2>Forgot Password</h2>
            <%String failure=(String)request.getAttribute("failure");
			if(failure!=null){%>
			<h3 class="failure"><%=failure%></h3>
			<%}%>
            <form action="forgot" method="post">
                <div class="input-group">
                    <label for="account">Account No.</label>
                    <input type="number" id="account" name="account" placeholder="Enter your Account No." required>
                </div>
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your Email" required>
                </div>
                <div class="input-group">
                    <label for="phone">Phone</label>
                    <input type="tel" id="phone" name="phone" placeholder="Enter your Phone No." required>
                </div>
                <div class="input-group">
                    <label for="pin">Pin</label>
                    <input type="number" id="pin" name="pin" placeholder="Enter new Pin" required>
                </div>
                <div class="button-group">
                    <button type="button" class="back-btn" onclick="window.location.href='Select.jsp'">Back</button>
                    <button type="submit" class="submit-btn">Submit</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>