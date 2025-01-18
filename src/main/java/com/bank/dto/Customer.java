package com.bank.dto;

public class Customer {
	private long accno;
	private String name;
	private long phone;
	private String mail;
	private double balance;
	private int pin;
	
	public Customer(long accno, String name, long phone, String mail, double balance, int pin)
	{
		super();
		this.accno = accno;
		this.name = name;
		this.phone = phone;
		this.mail = mail;
		this.balance = balance;
		this.pin = pin;
	}
	
	public Customer()
	{
		super();
	}

	public long getAccno() {
		return accno;
	}

	public void setAccno(long accno) {
		this.accno = accno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public int getPin() {
		return pin;
	}

	public void setPin(int pin) {
		this.pin = pin;
	}

	@Override
	public String toString() {
		return "Customer [accno=" + accno + ", name=" + name + ", phone=" + phone + ", mail=" + mail + ", balance="
				+ balance + "]";
	}
	
	
}