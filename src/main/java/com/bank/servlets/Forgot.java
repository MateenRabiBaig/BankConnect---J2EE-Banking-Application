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

@WebServlet("/forgot")
public class Forgot extends HttpServlet{
			@Override
			protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//				HttpSession session=req.getSession(false);
				String account=req.getParameter("account");
				String mail=req.getParameter("email");
				String phone_no=req.getParameter("phone");
				String pinn=req.getParameter("pin");
				
				long acc=Long.parseLong(account);
				long phone=Long.parseLong(phone_no);
				int pin=Integer.parseInt(pinn);
				
				CustomerDAO cdao=new CustomerDAOImp();
				Customer c=cdao.getCustomer(phone, mail);
				
				if(c!=null)
				{
					if(c.getAccno()==acc && c.getMail().equals(mail) && c.getPhone()==phone)
					{
						if(c.getPin()!=pin)
						{
							c.setPin(pin);
							boolean result=cdao.updatePin(acc, pin);
							if(result)
							{
								req.setAttribute("success", "Pin Changed Successfully");
								RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
								rd.forward(req, resp);
							}
							else
							{
								req.setAttribute("failure", "Failed to Change Pin, Try Again Later!");
								RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp");
								rd.forward(req, resp);
							}
						}
						else
						{
							req.setAttribute("failure", "You cannot use your old pin");
							RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp");
							rd.forward(req, resp);
						}
					}
					req.setAttribute("failure", "Enter correct Account No.");
					RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp");
					rd.forward(req, resp);
				}
				req.setAttribute("failure", "Enter valid details");
				RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp");
				rd.forward(req, resp);
			}
}