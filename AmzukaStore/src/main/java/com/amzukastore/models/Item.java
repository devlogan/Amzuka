package com.amzukastore.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Cart_Item")
public class Item implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = -558827811490102128L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int itemId;
	private String customerId;
	private double price;
	private int quantity;


	@OneToOne
	@JoinColumn(name="productId")
	private Product product;

	@ManyToOne
	private Cart cart;

	//Getters and Setters for instance variables
	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}




}
