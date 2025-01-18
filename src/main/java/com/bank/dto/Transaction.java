package com.bank.dto;

import java.sql.Date;

public class Transaction {
	private long transactionId;
	private long user;
	private long rec_acc;
	private String date;
	private String transaction;
	private double amount;
	private double balance;
	
	public Transaction()
	{
		
	}

	public Transaction(long transactionId, long user, long rec_acc, String date, String transaction, double amount,
			double balance) 
	{
		super();
		this.transactionId = transactionId;
		this.user = user;
		this.rec_acc = rec_acc;
		this.date = date;
		this.transaction = transaction;
		this.amount = amount;
		this.balance = balance;
	}

	public long getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(long transactionId) {
		this.transactionId = transactionId;
	}

	public long getUser() {
		return user;
	}

	public void setUser(long user) {
		this.user = user;
	}

	public long getRec_acc() {
		return rec_acc;
	}

	public void setRec_acc(long rec_acc) {
		this.rec_acc = rec_acc;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTransaction() {
		return transaction;
	}

	public void setTransaction(String transaction) {
		this.transaction = transaction;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "Transaction [transactionId=" + transactionId + ", user=" + user + ", rec_acc=" + rec_acc + ", date="
				+ date + ", transaction=" + transaction + ", amount=" + amount + ", balance=" + balance + "]";
	}
	
	
}