package com.model;
import java.io.Serializable;
import java.util.ArrayList;

import javax.persistence.*;

@Entity
@Table(name = "cart_list")
public class CardList implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")

	public int id;
	public String username;
	public int price;
	public String name;
	public String author;
	public int amount;
	public double total;
	public CardList() {}
	public CardList(String uid, String name, String author, int amount, int price) {
		super();
		this.username = uid;
		this.name = name;
		this.author = author;
		this.amount = amount;
		this.price = price;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUid() {
		return username;
	}
	public void setUid(String uname) {
		this.username = uname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public double totalPrice() {
		total +=  this.amount * getPrice();
		return total;
	}

	
}
