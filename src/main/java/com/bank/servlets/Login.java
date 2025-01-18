package com.bank.servlets;

import java.io.IOException;

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

@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String acc=req.getParameter("account");
		String pinn=req.getParameter("pin");
		
		long acc_no=Long.parseLong(acc);
		int pin=Integer.parseInt(pinn);
		
		CustomerDAO cdao=new CustomerDAOImp();
		Customer c=cdao.getCustomer(acc_no, pin);
		
		if(c!=null)
		{
			if(c.getMail().equals("mateen@gmail.com") && acc.equals("1100110011"))
			{
				session.setAttribute("customer", c);
				RequestDispatcher rd=req.getRequestDispatcher("AdminDashboard1.jsp");
				rd.forward(req, resp);
			}
			else
			{
				session.setAttribute("customer", c);
				RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
				rd.forward(req, resp);
			}
		}
		else
		{
			req.setAttribute("failure", "Login Failed");
			RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
		}
	}
}
