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

@WebServlet("/signup")
public class Signup extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String phonenumber=req.getParameter("phone");
		String mail=req.getParameter("mail");
		String pinn=req.getParameter("pin");
		String con_pin=req.getParameter("confirmpin");
		
		long phone=Long.parseLong(phonenumber);
		int pin=Integer.parseInt(pinn);
		int confirmpin=Integer.parseInt(con_pin);
		
		Customer c=new Customer();
		CustomerDAO cdao=new CustomerDAOImp();
		
		if(pin==confirmpin)
		{
			c.setName(name);
			c.setPhone(phone);
			c.setMail(mail);
			c.setPin(pin);
			boolean result=cdao.insertCustomer(c);
			
			if(result)
			{
//				req.setAttribute("success", "Registered Successfully");
//				RequestDispatcher rd=req.getRequestDispatcher("Signup.jsp");
//				rd.forward(req, resp);
				
				req.setAttribute("success", "Registered Successfully");
				req.setAttribute("accountNo", c.getAccno());
				RequestDispatcher rd=req.getRequestDispatcher("SignupSuccess.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("failure", "Signup Failed");
				RequestDispatcher rd=req.getRequestDispatcher("Signup.jsp");
				rd.forward(req, resp);
			}
		}
	}
}