package com.bank.servlets;

import java.io.IOException;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImp;
import com.bank.dao.TransactionDAO;
import com.bank.dao.TransactionDAOImp;
import com.bank.dto.Customer;
import com.bank.dto.Transaction;
import com.bank.dto.TransactionID;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class Delete extends HttpServlet{
			@Override
			protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				HttpSession session=req.getSession(false);
				Customer c=(Customer)session.getAttribute("customer");
				CustomerDAO cdao=new CustomerDAOImp();
				TransactionDAO tdao=new TransactionDAOImp();
				String acc=req.getParameter("acc");
				
				if (c == null) 
                {
                    req.setAttribute("failure", "You must be logged in to Delete");
                    RequestDispatcher rd = req.getRequestDispatcher("Delete.jsp");
                    rd.forward(req, resp);
                    return;
                }
				
				
				
				if (acc != null && !acc.trim().isEmpty()) 
		        {
					long acc_no=Long.parseLong(acc);
					Customer c1=cdao.getCustomer(acc_no);
					if(c1!=null)
					{
						if(c.getAccno()!=c1.getAccno())
						{
							double amount=c1.getBalance();
							c.setBalance(c.getBalance()+c1.getBalance());
							boolean res=cdao.updateCustomer(c);
							if(res)
							{
								Transaction t=new Transaction();
								t.setTransactionId(TransactionID.generateTransactionId());
								t.setUser(c.getAccno());
								t.setRec_acc(c1.getAccno());
								t.setAmount(amount);
								t.setTransaction("CREDITED");
								t.setBalance(c.getBalance());
								boolean res1=tdao.insertTransaction(t);
								
								if(res && res1)
								{
									boolean result=cdao.deleteCustomer(c1);
									session.setAttribute("customer", c);
									req.setAttribute("success", "Customer Deleted Successfully");
									RequestDispatcher rd=req.getRequestDispatcher("Delete.jsp");
									rd.forward(req, resp);
									return;
								}
								else
								{
									req.setAttribute("failure", "Failed to Delete");
									RequestDispatcher rd=req.getRequestDispatcher("Delete.jsp");
									rd.forward(req, resp);
								}
							}
							else
							{
								req.setAttribute("failure", "Failed to Transfer Amount");
								RequestDispatcher rd=req.getRequestDispatcher("Delete.jsp");
								rd.forward(req, resp);
							}
						}
						else
						{
							req.setAttribute("failure", "Cannot Delete Admin Data");
							RequestDispatcher rd=req.getRequestDispatcher("Delete.jsp");
							rd.forward(req, resp);
						}
			        }
					else
					{
						req.setAttribute("failure", "Enter a valid Account Number");
						RequestDispatcher rd=req.getRequestDispatcher("Delete.jsp");
						rd.forward(req, resp);
					}
		        }
				else 
		        {
		            req.setAttribute("failure", "Cannot be Empty");
		            RequestDispatcher rd=req.getRequestDispatcher("Delete.jsp");
		            rd.forward(req, resp);
		        }				
			}
}