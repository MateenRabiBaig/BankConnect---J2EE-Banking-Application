<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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

.logo{
    position: absolute;
    top: -20px;
    left: -25px;
}

.logo img{
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

.logout-btn a{
    text-decoration: none;
    color: #1abc9c;
}

.navbar .nav-right .logout-btn:hover {
    border-color: #1abc9c; 
    color: #ffffff; 
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(26, 188, 156, 0.7);
}

.dashboard-body-1, .dashboard-body-2 {
    margin: 25px auto;
    padding: 20px 30px;
    max-width: 1200px;
    background-color: #1a1a1a; 
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
    border: 1px solid #333333; 
}

h1 {
    margin-bottom: 20px;
    font-size: 28px;
    text-align: center;
    color: #1abc9c; 
    font-weight: bold;
}

.details-table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 18px;
}

.details-table th, .details-table td {
    border: 1px solid #333333;
    text-align: center;
    padding: 12px;
    color: #ffffff; 
}

.details-table th {
    background-color: #1abc9c; 
    color: #000000; 
    font-weight: bold;
}

.details-table tr:nth-child(even) {
    background-color: #1e1e1e; 
}

.details-table tr:hover {
    background-color: #292929; 
}

.options-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    margin-top: 30px;
}

.option-card {
    width: 220px;
    background-color: #1e1e1e; 
    text-align: center;
    color: #1abc9c;
    padding: 25px;
    border-radius: 12px;
    border: 2px solid transparent;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.6);
    transition: all 0.3s ease;
    cursor: pointer;
    font-size: 18px;
    font-weight: bold;
}

.option-card:hover {
    border-color: #1abc9c; 
    transform: translateY(-5px);
    box-shadow: 0 12px 25px rgba(26, 188, 156, 0.7);
}

a{
	text-decoration: none;
	color: #1abc9c;
}

    </style>
</head>
<body>
<%Customer c=(Customer)session.getAttribute("customer");%>
    <nav class="navbar">
        <div class="logo">
            <button onclick="window.location.href='AdminDashboard1.jsp';"><img src="logo1.png" alt="" height="150px" width="150px"></button>
        </div>
        <div class="nav-left">
            Welcome, Admin - <%=c.getName()%>
        </div>
        <div class="nav-right">
            <button class="nav-btn logout-btn">
                <a href="logout">Logout</a>
            </button>
        </div>
    </nav>

    <div class="dashboard-body-1">
        <h1>Your Account Details</h1>
        <table class="details-table">
            <thead>
                <tr>
                    <th>Account Number</th>
                    <th>Name</th>
                    <th>Phone Number</th>
                    <th>Email ID</th>
                    <th>PIN</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%=c.getAccno()%></td>
                    <td><%=c.getName()%></td>
                    <td><%=c.getPhone()%></td>
                    <td><%=c.getMail()%></td>
                    <td>****</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="dashboard-body-2">
        <h1>Admin Options</h1>
        
        <div class="options-container">
        	<div class="option-card">
                <a href="http://localhost:8080/BankApplication/CustomerDetails.jsp"><h3>Customer Details</h3></a>
            </div>
            <div class="option-card">
                <a href="http://localhost:8080/BankApplication/TransactionDetails.jsp"><h3>Transaction Details</h3></a>
            </div>
            <div class="option-card">
                <a href="http://localhost:8080/BankApplication/Search.jsp"><h3>Search Customer</h3></a>
            </div>
            <div class="option-card">
                <a href="http://localhost:8080/BankApplication/Delete.jsp"><h3>Delete Customer</h3></a>
            </div>
            <div class="option-card">
                <a href="http://localhost:8080/BankApplication/AdminDashboard2.jsp"><h3>Other Services</h3></a>
            </div>
        </div>
    </div>
</body>
</html>