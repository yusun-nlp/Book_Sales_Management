package com.test;


public class Order {
	
	protected String orderID;
	protected String ISBN;
	protected String name;
	protected String press;
	protected String author;
	protected String price;
	protected String status;
	protected String prices;
	protected String amount;
	protected String o_date;
	public String getorderID() {
		return orderID;
	}
	public void setorderID(String orderID) {
		this.orderID = orderID;
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
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
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
		return o_date;
	}
	public void setDate(String o_date) {
		this.o_date = o_date;
	}

}
