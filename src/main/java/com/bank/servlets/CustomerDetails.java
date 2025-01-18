package com.bank.servlets;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImp;
import com.bank.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/customerdetails")
public class CustomerDetails extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			HttpSession session=req.getSession(false);
			Customer c = (Customer) session.getAttribute("customer");
			CustomerDAO cdao=new CustomerDAOImp();
			
	        if (c == null) {
	            resp.sendRedirect("Login.jsp");
	            return;
	        }
	        
	        List<Customer> result=cdao.getCustomer();
	        req.setAttribute("customerList", result);
	        RequestDispatcher rd=req.getRequestDispatcher("CustomerDetails.jsp");
	        rd.forward(req, resp);
		}
}
