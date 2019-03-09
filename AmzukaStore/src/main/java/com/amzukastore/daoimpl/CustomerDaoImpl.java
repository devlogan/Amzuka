package com.amzukastore.daoimpl;

import java.util.List;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.amzukastore.dao.CustomerDao;
import com.amzukastore.models.Cart;
import com.amzukastore.models.Customer;
import com.amzukastore.models.customerdetails.Address;
import com.amzukastore.models.customerdetails.Orders;

@Repository("customerDao")
@Transactional
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Override
	public boolean addCustomer(Customer customer) {
		
		try {
			Session session=sessionFactory.getCurrentSession();
			customer.setPassword(passwordEncoder.encode(customer.getPassword()));
			session.save(customer);
			return true;
		} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public boolean deleteCustomer(Customer customer) {
		
		try {
			Session session=sessionFactory.getCurrentSession();
			session.delete(customer);
			return true;
		} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public boolean updateCustomer(Customer customer) {
		
		try {
			Session session=sessionFactory.getCurrentSession();
			session.update(customer);
			return true;
		} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public Customer getCustomer(String email) {
		
		try{
			Session session=sessionFactory.getCurrentSession();
			Customer customer=session.get(Customer.class, email);
			return customer;
			}
			catch(Exception e){
				e.printStackTrace();
			}
		
		return null;
	}

	@Override
	public boolean validateCustomer(String email, String password) {
		
		try{
			Session session=sessionFactory.getCurrentSession();
			Query query=session.createQuery("from Customer where email= :customerEmail and password= :customerPassword");
			query.setParameter("customerEmail", email);
			query.setParameter("customerPassword", password);
			if(query.getResultList() != null)
			return true;
			}
			catch(Exception e){
				e.printStackTrace();
			}
		
		return false;
	}

	@Override
	public List<Customer> listCustomers() {
		try {
			Session session=sessionFactory.getCurrentSession();
			Query query=session.createQuery("select from Customer");
			return query.getResultList();
		} 
		
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean addAddress(Address addr) {
		try {
			Session session=sessionFactory.getCurrentSession();
			session.save(addr);
			return true;
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return false;
		
	}

	@Override
	public boolean deleteAddress(Address addr) {
		try {
			Session session=sessionFactory.getCurrentSession();
			session.delete(addr);
			return true;
			}
			catch(Exception e){
				e.printStackTrace();
			}
		return false;
	}

	@Override
	public boolean updateAddress(Address addr) {
		try {
			Session session=sessionFactory.getCurrentSession();
			session.update(addr);
			return true;
			}
			catch(Exception e){
				e.printStackTrace();
			}
		return false;
	}

	@Override
	public Address getAddressById(int addressId) {
		try {
			Session session=sessionFactory.getCurrentSession();
			Address addrObj=session.get(Address.class,addressId);
			return addrObj;
			}
			catch(Exception e){
				e.printStackTrace();
			}
		return null;
	}

	@Override
	public List<Address> getAllAddressforCustomer(String email) {
		try {
			Session session=sessionFactory.getCurrentSession();
			Query<Address> q=session.createQuery("from Address where customer.email=:email");
			q.setParameter("email", email);
			return q.getResultList();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		return null;
	}

	@Override
	public boolean addOrders(Orders orders) {
		try {
			Session session=sessionFactory.getCurrentSession();
			session.save(orders);
			return true;
		} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public Orders getOrdersByCustomer(String customerEmail) {
		try
		{
			Session session=sessionFactory.getCurrentSession();
			Query query=session.createQuery("from CustomerOrders where customer.email=:email");
			query.setString("email", customerEmail);
			List<Orders> list=query.list();
			System.out.println("list : "+list);
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
	public boolean deleteOrders(int orderId) {
		try
		{
			
			Session session=sessionFactory.getCurrentSession();
			Orders orders=session.get(Orders.class,orderId);
			session.delete(orders);
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

}
