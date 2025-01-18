package com.bank.app;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImp;
import com.bank.dao.TransactionDAO;
import com.bank.dao.TransactionDAOImp;
import com.bank.dto.Customer;
import com.bank.dto.Transaction;
import com.bank.dto.TransactionID;

public class TransferrAmountt {

    public static void transferAmount(Customer sender, long receiverAccNo, double amount, int enteredPin) {
        if (sender.getPin() != enteredPin) 
        {
            System.out.println("Invalid PIN.");
            return;
        }

        CustomerDAO cdao = new CustomerDAOImp();
        Transaction t1 = null;
        Transaction t2 = null;
        TransactionDAO tdao = new TransactionDAOImp();

        Customer receiver = cdao.getCustomer(receiverAccNo);

        if (sender.getAccno() != receiverAccNo && sender.getBalance() > 0 && sender.getBalance() > amount && amount > 0) 
        {
            sender.setBalance(sender.getBalance() - amount);
            boolean c_res = cdao.updateCustomer(sender);
            
            if (c_res) 
            {
                t1 = new Transaction();
                t1.setTransactionId(TransactionID.generateTransactionId());
                t1.setUser(sender.getAccno());
                t1.setRec_acc(receiver.getAccno());
                t1.setTransaction("DEBITED");
                t1.setAmount(amount);
                t1.setBalance(sender.getBalance());
                tdao.insertTransaction(t1);
            }
            receiver.setBalance(receiver.getBalance() + amount);
            boolean receiver_res = cdao.updateCustomer(receiver);

            if (receiver_res) 
            {
                t2 = new Transaction();
                t2.setTransactionId(t1.getTransactionId());
                t2.setUser(receiver.getAccno());
                t2.setRec_acc(sender.getAccno());
                t2.setTransaction("CREDITED");
                t2.setAmount(amount);
                t2.setBalance(receiver.getBalance());
                tdao.insertTransaction(t2);
            }

            if (c_res && receiver_res) 
            {
                System.out.println("Transaction Successful");
            } 
            else 
            {
                System.out.println("Transaction Failed");
            }
        } 
        else 
        {
            System.out.println("Transaction Failed: Insufficient balance or invalid account number.");
        }
    }
}
