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

@WebServlet("/reset")
public class Reset extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		Customer c=(Customer) session.getAttribute("customer");
		CustomerDAO cdao=new CustomerDAOImp();
		
		String pinn=req.getParameter("new-pin");
		String conpinn=req.getParameter("confirm-pin");
		
		int pin=Integer.parseInt(pinn);
		int confirmpin=Integer.parseInt(conpinn);
		
		if(pin==confirmpin && pin!=c.getPin())
		{
			c.setPin(pin);
//			session.setAttribute("customer", c);
			boolean result=cdao.updatePin(c.getAccno(), pin);
			req.setAttribute("success", "Pin Updated Successfully");
            RequestDispatcher rd = req.getRequestDispatcher("Reset.jsp");
            rd.forward(req, resp);
		}
		else
		{
			req.setAttribute("failure", "Failed to Update Pin");
            RequestDispatcher rd = req.getRequestDispatcher("Reset.jsp");
            rd.forward(req, resp);
		}
	}
}
