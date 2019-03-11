package com.amzukastore.models;

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

@Entity
@Table(name="Cart_Table")
public class Cart implements Serializable{



	/**
	 * 
	 */
	private static final long serialVersionUID = 8436036990086428048L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cartId;

	@OneToOne
	private Customer customer;


	@OneToMany(cascade=CascadeType.REMOVE,fetch=FetchType.EAGER,mappedBy="cart")
	Collection<Item> items=new ArrayList<>();


	public int getCartId() {
		return cartId;
	}


	public void setCartId(int cartId) {
		this.cartId = cartId;
	}


	public Customer getCustomer() {
		return customer;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}


	public Collection<Item> getItems() {
		return items;
	}


	public void setItems(Collection<Item> items) {
		this.items = items;
	}


}
