<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset PIN</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            color: #ffffff;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #1a1a1a;
            padding: 30px 30px;
            border-bottom: 3px solid #1abc9c;
        }

        .logo {
            position: absolute;
            top: -20px;
            left: -25px;
        }

        .logo img {
            filter: brightness(2.8);
        }
        
        .logo button {
    		background-color: transparent;
    		border: none;
		}

		.logo button:hover{
    		cursor: pointer;
		}

        .navbar .nav-left {
            font-size: 36px;
            font-weight: bold;
            color: #1abc9c;
            margin-left: 100px;
        }

        .navbar .nav-right .logout-btn {
            background-color: #1e1e1e;
            color: #1abc9c;
            border: 2px solid transparent;
            border-radius: 12px;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.6);
            text-decoration: none;
        }

        .logout-btn a {
            text-decoration: none;
            color: #1abc9c;
        }

        .navbar .nav-right .logout-btn:hover {
            border-color: #1abc9c;
            color: #ffffff;
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(26, 188, 156, 0.7);
        }

        .reset-container {
            max-width: 500px;
            margin: 40px auto;
            background-color: #1a1a1a;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
            border: 1px solid #333333;
        }

        h1 {
            text-align: center;
            color: #1abc9c;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            color: #1abc9c;
            font-size: 18px;
            margin-bottom: 8px;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 2px solid #333333;
            border-radius: 8px;
            outline: none;
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

    </style>
</head>
<body>
<%Customer c=(Customer) session.getAttribute("customer");%>
    <nav class="navbar">
        <div class="logo">
        <%if(c.getMail().equals("mateen@gmail.com") && c.getAccno()==1100110011){%>
            <button onclick="window.location.href='AdminDashboard2.jsp';"><img src="logo1.png" alt="" height="150px" width="150px"></button>
        <%}
        else {
        %>
        	<button onclick="window.location.href='Dashboard.jsp';"><img src="logo1.png" alt="" height="150px" width="150px"></button>
        <%}%>
        </div>
        <%if(c.getMail().equals("mateen@gmail.com") && c.getAccno()==1100110011){%>
        <div class="nav-left">
            Welcome, Admin - <%=c.getName()%>
        </div>
        <%}
        else {
        %>
        <div class="nav-left">
            Welcome, <%=c.getName()%>
        </div>
        <%}%>
        <div class="nav-right">
            <button class="logout-btn">
                <a href="logout">Logout</a>
            </button>
        </div>
    </nav>

    <div class="reset-container">
        <h1>Reset Your PIN</h1>
        <% 
        String success = (String) request.getAttribute("success");
        String failure = (String) request.getAttribute("failure");

        if (success != null) {
    	%>
        
        <div style="color: green; font-size: 20px; font-weight: bold; text-align: center;">
            <%= success %>
        </div>
    	
    	<% 
        }
        if (failure != null) {
    	%>
        
        <div style="color: red; font-size: 20px; font-weight: bold; text-align: center;">
            <%= failure %>
        </div>
    	<% 
        }
    	%>
        <form action="reset" method="post">
            <div class="input-group">
                <label for="new-pin">New PIN</label>
                <input type="password" id="new-pin" name="new-pin" placeholder="Enter your new PIN" required>
            </div>

            <div class="input-group">
                <label for="confirm-pin">Confirm New PIN</label>
                <input type="password" id="confirm-pin" name="confirm-pin" placeholder="Confirm your new PIN" required>
            </div>

             <div class="button-group">
                <%if(c.getMail().equals("mateen@gmail.com") && c.getAccno()==1100110011){%>
        			<button class="back-btn" type="button" onclick="window.location.href='AdminDashboard2.jsp';">Back</button>
        		<%}
        		else {
        		%>
        			<button class="back-btn" type="button" onclick="window.location.href='Dashboard.jsp';">Back</button>
        		<%}%>
                <button type="submit" class="submit-btn">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>