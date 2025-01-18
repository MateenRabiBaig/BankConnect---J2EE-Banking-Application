package com.bank.servlets;

import java.io.IOException;
import java.util.List;

import com.bank.dao.TransactionDAO;
import com.bank.dao.TransactionDAOImp;
import com.bank.dto.Customer;
import com.bank.dto.Transaction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/transactiondetails")
public class TransactionDetails extends HttpServlet{
			@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				HttpSession session=req.getSession(false);
				Customer c=(Customer) session.getAttribute("customer");
				Transaction t=(Transaction) session.getAttribute("transaction");
				TransactionDAO tdao=new TransactionDAOImp();
				
				if(c==null)
				{
					resp.sendRedirect("Login.jsp");
					return;
				}
				
				List<Transaction> result=tdao.getTransaction(c.getAccno());
				req.setAttribute("transactionList", result);
				RequestDispatcher rd=req.getRequestDispatcher("TransactionDetails.jsp");
				rd.forward(req, resp);
			}
}