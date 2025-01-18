package com.bank.servlets;

import java.io.IOException;

import com.bank.app.TransferrAmountt;
import com.bank.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/transfer")
public class Transfer extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accountStr = req.getParameter("account");
        String amountStr = req.getParameter("amount");
        String pinStr = req.getParameter("pin");

        if (accountStr == null || amountStr == null || pinStr == null)
        {
            req.setAttribute("failure", "Transaction Failed");
            RequestDispatcher rd = req.getRequestDispatcher("Transfer.jsp");
            rd.forward(req, resp);
            return;
        }

        try 
        {
            long receiverAccNo = Long.parseLong(accountStr);
            double amount = Double.parseDouble(amountStr);
            int enteredPin = Integer.parseInt(pinStr);

            HttpSession session = req.getSession(false);
            if (session == null) {
                resp.sendRedirect("Login.jsp");
                return;
            }

            Customer sender = (Customer) session.getAttribute("customer");
            if (sender == null) 
            {
                req.setAttribute("failure", "Transaction Failed");
                RequestDispatcher rd = req.getRequestDispatcher("Transfer.jsp");
                rd.forward(req, resp);
                return;
            }

            if (sender.getAccno() == receiverAccNo || enteredPin != sender.getPin() || amount <= 0 || amount > sender.getBalance()) 
            {
                req.setAttribute("failure", "Transaction Failed");
                RequestDispatcher rd = req.getRequestDispatcher("Transfer.jsp");
                rd.forward(req, resp);
                return;
            }

            TransferrAmountt.transferAmount(sender, receiverAccNo, amount, enteredPin);

            req.setAttribute("success", "Amount Transferred Successfully");
            RequestDispatcher rd = req.getRequestDispatcher("Transfer.jsp");
            rd.forward(req, resp);

        } 
        catch (NumberFormatException e) 
        {
            req.setAttribute("failure", "Transaction Failed");
            RequestDispatcher rd = req.getRequestDispatcher("Transfer.jsp");
            rd.forward(req, resp);
        } 
        catch (Exception e) 
        {
            req.setAttribute("failure", "Transaction Failed");
            RequestDispatcher rd = req.getRequestDispatcher("Transfer.jsp");
            rd.forward(req, resp);
        }
    }
}
