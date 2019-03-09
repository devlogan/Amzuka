package com.amzukastore.models.customerdetails;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.amzukastore.models.Product;

@Entity
@Table(name="Order_Items")
public class OrderItems {


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int OrderItemsId;
	private String customerId;
	private double price;
	private int quantity;
	
	@OneToOne
	@JoinColumn(name="productId")
	private Product product;
	
	@ManyToOne
	private Orders orders;

	public int getOrderItemsId() {
		return OrderItemsId;
	}

	public void setOrderItemsId(int orderItemsId) {
		OrderItemsId = orderItemsId;
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

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}


	
	
}
