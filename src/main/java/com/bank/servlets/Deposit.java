package com.bank.servlets;

import java.io.IOException;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImp;
import com.bank.dto.Customer;

import jakarta.servlet.RequestDispatcher;
//import com.bank.app.Deposit;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deposit")
public class Deposit extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String amt = req.getParameter("amount");

        if (amt != null && !amt.trim().isEmpty()) 
        {
            try 
            {
                double amount = Double.parseDouble(amt);

                if (amount > 0) {
                    HttpSession session = req.getSession(true);
                    Customer c = (Customer) session.getAttribute("customer");
                    CustomerDAO cdao=new CustomerDAOImp();
                    if (c == null) 
                    {
                        req.setAttribute("failure", "You must be logged in to Deposit");
                        RequestDispatcher rd = req.getRequestDispatcher("Deposit.jsp");
                        rd.forward(req, resp);
                        return;
                    }

                    c.setBalance(c.getBalance() + amount);
                    session.setAttribute("customer", c);
                    boolean result=cdao.updateCustomer(c);
                    req.setAttribute("success", "Amount Deposited Successfully");
                    RequestDispatcher rd = req.getRequestDispatcher("Deposit.jsp");
                    rd.forward(req, resp);
                    return;
                } 
                else 
                {
                    req.setAttribute("failure", "Deposit amount must be greater than zero");
                }
            } 
            catch (NumberFormatException e) 
            {
                req.setAttribute("failure", "Invalid amount format");
            }
        } 
        else 
        {
            req.setAttribute("failure", "Deposit amount cannot be Empty");
        }

        RequestDispatcher rd = req.getRequestDispatcher("Deposit.jsp");
        rd.forward(req, resp);
    }
}








//package com.bank.servlets;
//
//import java.io.IOException;
//
//import com.bank.dto.Customer;
//
//import jakarta.servlet.RequestDispatcher;
////import com.bank.app.Deposit;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebServlet("/deposit")
//public class Deposit extends HttpServlet{
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session=req.getSession(false);
//		
//		String amt=req.getParameter("amount");
//		
//		if(amt!=null)
//		{
//			double amount=Double.parseDouble(amt);
//			
//			Customer c=(Customer) session.getAttribute("customer");
//			if(amount>0)
//			{
//				c.setBalance(c.getBalance()+amount);
////				com.bank.app.Deposit.deposit(c);
//				session.setAttribute("customer", c);
//				req.setAttribute("success", "Amount Deposited Successfully");
//				RequestDispatcher rd = req.getRequestDispatcher("Deposit.jsp");
//				rd.forward(req, resp);
//			}
//			else
//			{
//				req.setAttribute("failure", "Failed to Deposit");
//				RequestDispatcher rd = req.getRequestDispatcher("Deposit.jsp");
//				rd.forward(req, resp);
//			}
//		}
//		else
//		{
//			req.setAttribute("failure", "Failed to Deposit");
//			RequestDispatcher rd = req.getRequestDispatcher("Deposit.jsp");
//			rd.forward(req, resp);
//		}
//	}
//}