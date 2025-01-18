<%@page import="java.util.List"%>
<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Customer Details</title>
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

        .dashboard-body-1{
    		margin: 25px auto;
    		padding: 20px 30px;
    		max-width: 1200px;
    		background-color: #1a1a1a; 
    		border-radius: 12px;
    		box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
    		border: 1px solid #333333; 
		}

        .dashboard-body-1 h1 {
            font-size: 28px;
            color: #1abc9c;
            margin-bottom: 20px;
            text-align: center;
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
		
		.button-group {
            display: flex;
            justify-content: space-between;
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
        }

        .back-btn:hover {
            background-color: #292929;
        }
        
        .show-btn {
            background-color: #1abc9c;
            color: #000000;
        }

        .show-btn:hover {
            background-color: #16a085;
        }
    </style>
</head>
<body>
<%Customer c=(Customer)session.getAttribute("customer");%>
<%List<Customer> customers = (List<Customer>) request.getAttribute("customerList");%>
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
    <form action="customerdetails" method="get">
        <h1>Customer Details</h1>
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
            <% 
            	if(customers != null && !customers.isEmpty()) {
                for (Customer customer : customers) { 
        	%>
                <tr>
                    <td><%=customer.getAccno()%></td>
                    <td><%=customer.getName()%></td>
                    <td><%=customer.getPhone()%></td>
                    <td><%=customer.getMail()%></td>
                    <td><%=customer.getPin()%></td>
                </tr>
                <% 
                }
                } 
        		%>
            </tbody>
        </table>
        <div class="button-group" style="text-align: center; margin-top: 20px;">
        	<button class="back-btn" type="button" onclick="window.location.href='AdminDashboard1.jsp'">Back</button>
        	<button class="show-btn">Show</button>
    	</div>
    	</form>
    </div>
</body>
</html>