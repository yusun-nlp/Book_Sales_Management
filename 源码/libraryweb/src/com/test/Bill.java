package com.test;


public class Bill {
	
	protected String billID;
	protected String ISBN;
	protected String name;
	protected String status;
	protected String prices;
	protected String amount;
	protected String b_date;
	public String getbillID() {
		return billID;
	}
	public void setbillID(String billID) {
		this.billID = billID;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String ISBN) {
		this.ISBN = ISBN;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrices() {
		return prices;
	}
	public void setPrices(String prices) {
		this.prices = prices;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getDate() {
		return b_date;
	}
	public void setDate(String b_date) {
		this.b_date = b_date;
	}

}
