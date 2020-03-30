package com.test;


public class Deal {
	
	protected String dealID;
	protected String ISBN;
	protected String name;
	protected String price;
	protected String amount;
	protected String d_date;
	public String getdealID() {
		return dealID;
	}
	public void setdealID(String dealID) {
		this.dealID = dealID;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String ISBN) {
		this.ISBN = ISBN;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getDate() {
		return d_date;
	}
	public void setDate(String d_date) {
		this.d_date = d_date;
	}

}
