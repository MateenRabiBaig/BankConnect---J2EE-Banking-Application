package com.bank.servlets;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/passbook")
public class Passbook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Customer c = (Customer) session.getAttribute("customer");
        if (c == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }
        
        long acc_no = c.getAccno();
        TransactionDAO tdao = new TransactionDAOImp();
        List<Transaction> allTransactions = tdao.getTransaction(acc_no);
        List<Transaction> passbook = new ArrayList<>();
        for (Transaction t : allTransactions) {
            if (t.getRec_acc() == acc_no) {
                passbook.add(t);
                System.out.println("Added transaction with ID: " + t.getTransactionId());
            }
        }
        System.out.println("Fetched transactions size: " + allTransactions.size());
        System.out.println("Filtered passbook size: " + passbook.size());
        req.setAttribute("passbook", passbook);
        req.setAttribute("accno", acc_no);
        RequestDispatcher rd = req.getRequestDispatcher("Passbook.jsp");
        rd.forward(req, resp);
    }
}