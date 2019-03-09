package com.amzukastore.dao;

import java.util.List;

import com.amzukastore.models.customerdetails.OrderItems;

public interface OrderItemsDao {

	public boolean addOrderItems(OrderItems item);
	public boolean deleteOrderItems(int itemId);
	public OrderItems getOrderItemsByProductIdAndCustomerId(int productId,String customerEmail);
	public List<OrderItems> getOrderItemsListByOrders(int orderId);

}
