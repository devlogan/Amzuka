package com.amzukastore.models.customerdetails;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.amzukastore.models.Customer;

@Entity
@Table(name="Customer_Orders")
public class Orders implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = -7378801565222356844L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int orderId;

	@OneToOne
	private Customer customer;

	private String date;

	@OneToMany(cascade=CascadeType.REMOVE,fetch=FetchType.EAGER,mappedBy="orders")
	Collection<OrderItems> items=new ArrayList<>();


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public Customer getCustomer() {
		return customer;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}


	public Collection<OrderItems> getItems() {
		return items;
	}


	public void setItems(Collection<OrderItems> items) {
		this.items = items;
	}

	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}

}
