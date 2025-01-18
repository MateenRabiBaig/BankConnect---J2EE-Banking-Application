<%@page import="java.util.List"%>
<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Search Customer</title>
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

        .box input {
            background-color: #333333;
            border: 2px solid #333333;
            height: 40px;
            width: 450px;
            position: relative;
            left: 325px;
            border-radius: 8px;
            outline: none;
            transition: border-color 0.3s ease;
            color: #ffffff;
            padding: 15px;
            font-size: 17px;
        }

        .box input:focus {
            border-color: #1abc9c; 
            box-shadow: 0 0 5px rgba(26, 188, 156, 0.5); 
        }

        .search {
            height: 40px;
            width: 50px;
            position: relative;
            top: -11px;
            left: 325px;
            background-color: #1abc9c;
            border-radius: 8px;
            display: inline-block;
        }


        .search img{
            position: absolute;
            top: 5px;
            left: 10px;
            display: inline;
        }

        .search button {
            border: none;
        }

        .search:hover {
            cursor: pointer;
            background-color: #16a085;
        }
        
        .searchimg:hover {
        	cursor: pointer;
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
        <h1>Search Customer</h1>
        <form action="search" method="post">
	        <div class="box">
	            <input type="number" name="acc" placeholder="Enter Account Number" required>
	            <div class="search">
	                <button type="submit"><img src="loupe.png" alt="" height="30px" class="searchimg"></button>
	            </div>
	        </div>
        </form>
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
            <%Customer c1=(Customer)request.getAttribute("cust");
            if (c1 != null) {
            %>
            <tbody>
                <tr>
                    <td><%=c1.getAccno()%></td>
                    <td><%=c1.getName()%></td>
                    <td><%=c1.getPhone()%></td>
                    <td><%=c1.getMail()%></td>
                    <td><%=c1.getPin()%></td>
                </tr>
                <% } else { %>
                <tr>
                    <td colspan="5" style="text-align: center;">No Customer Found</td>
                </tr>
            <% } %>
            </tbody>
        </table>
        <div class="button-group" style="text-align: center; margin-top: 20px;">
        	<button class="back-btn" type="button" onclick="window.location.href='AdminDashboard1.jsp'">Back</button>
    	</div>
    </div>
</body>
</html>