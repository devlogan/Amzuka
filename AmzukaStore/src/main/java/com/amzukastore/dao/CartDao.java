package com.amzukastore.dao;

import com.amzukastore.models.Cart;

public interface CartDao {

	public boolean addCart(Cart cart);
	public Cart getCartByCustomer(String customerEmail);
	public boolean deleteCart(int cartId);

}
