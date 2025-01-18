package com.bank.servlets;

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

import java.io.*;

@WebServlet("/update")
public class Update extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Customer c=(Customer) session.getAttribute("customer");
        long acc_no=c.getAccno();

//        if (c == null) 
//        {
//        	req.setAttribute("failure", "You need to Log in first");
//            RequestDispatcher dispatcher = req.getRequestDispatcher("Update.jsp");
//            dispatcher.forward(req, resp);
//            return;
//        }
        
        String updateChoice = req.getParameter("updateChoice");

        if (updateChoice == null) 
        {
            req.setAttribute("failure", "Please select a field to update.");
            RequestDispatcher rd = req.getRequestDispatcher("Update.jsp");
            rd.forward(req, resp);
            return;
        }

        String fieldName = null;
        String fieldValue = null;

        if (updateChoice.equals("name"))
        {
            fieldName = "name";
            fieldValue = req.getParameter("name");
        } 
        else if (updateChoice.equals("phone")) 
        {
            fieldName = "phone";
            fieldValue = req.getParameter("phone");
        }
        else if (updateChoice.equals("email"))
        {
            fieldName = "email";
            fieldValue = req.getParameter("email");
        }

        if (fieldValue == null || fieldValue.trim().isEmpty()) 
        {
            req.setAttribute("failure", "Field cannot be empty.");
            RequestDispatcher rd = req.getRequestDispatcher("Update.jsp");
            rd.forward(req, resp);
            return;
        }

        CustomerDAO customerDAO = new CustomerDAOImp();

        boolean success = customerDAO.updateCust(acc_no, fieldName, fieldValue);

        if (success) 
        {
            if ("name".equals(fieldName)) 
            {
                c.setName(fieldValue);
            } 
            else if ("phone".equals(fieldName))
            {
                c.setPhone(Long.parseLong(fieldValue));
            }
            else if ("email".equals(fieldName)) 
            {
                c.setMail(fieldValue);
            }
            session.setAttribute("customer", c);
            req.setAttribute("success", "Updated successfully.");
            RequestDispatcher rd = req.getRequestDispatcher("Update.jsp");
            rd.forward(req, resp);
        } 
        else 
        {
            req.setAttribute("failure", "Failed to update.");
            RequestDispatcher rd = req.getRequestDispatcher("Update.jsp");
            rd.forward(req, resp);
        }
    }
}