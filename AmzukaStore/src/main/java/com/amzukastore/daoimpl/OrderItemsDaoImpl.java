package com.amzukastore.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.amzukastore.dao.OrderItemsDao;
import com.amzukastore.models.Item;
import com.amzukastore.models.customerdetails.OrderItems;

@Repository("orderItemDao")
@Transactional
public class OrderItemsDaoImpl implements OrderItemsDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean addOrderItems(OrderItems item) {
		try
		{
			Session session=sessionFactory.getCurrentSession();
			session.save(item);
			return true;

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteOrderItems(int itemId) {
		try
		{

			Session session=sessionFactory.getCurrentSession();
			OrderItems items=session.get(OrderItems.class, itemId);
			session.delete(items);
			return true;


		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public OrderItems getOrderItemsByProductIdAndCustomerId(int productId, String customerEmail) {
		try
		{

			Session session=sessionFactory.getCurrentSession();
			Query query=session.createQuery("from OrderItems where productId=:pId and customerId=:cId");
			query.setInteger("pId",productId);
			query.setString("cId",customerEmail);
			List<OrderItems> getItemsListByOrders=query.list();
			List<OrderItems> list=query.list();
			if(list.size()!=0){
				return list.get(0);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<OrderItems> getOrderItemsListByOrders(int orderId) {
		try{
			Session session=sessionFactory.getCurrentSession();
			Query query=session.createQuery("from OrderItems where orders.orderId=:id");
			query.setInteger("id",orderId);
			List<OrderItems> getItemsListByCart=query.list();
			return getItemsListByCart;

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

}
