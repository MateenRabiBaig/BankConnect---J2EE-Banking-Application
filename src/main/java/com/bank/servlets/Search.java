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

@WebServlet("/search")
public class Search extends HttpServlet{
			@Override
			protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				HttpSession session=req.getSession(false);
				Customer c=(Customer)session.getAttribute("customer");
				CustomerDAO cdao=new CustomerDAOImp();
				String acc=req.getParameter("acc");
				
				long acc_no=Long.parseLong(acc);
				
				if(c == null)
				{
					resp.sendRedirect("Login.jsp");
					return;
				}
				Customer c1=cdao.getCustomer(acc_no);
//				System.out.println(c1);
				req.setAttribute("cust", c1);
				RequestDispatcher rd=req.getRequestDispatcher("Search.jsp");
				rd.forward(req, resp);				
			}
}