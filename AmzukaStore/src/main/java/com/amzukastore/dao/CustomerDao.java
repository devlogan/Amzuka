package com.amzukastore.dao;

import java.util.List;

import com.amzukastore.models.Customer;
import com.amzukastore.models.customerdetails.Address;
import com.amzukastore.models.customerdetails.Orders;

public interface CustomerDao {
	
	        public boolean addCustomer(Customer customer);
			public boolean deleteCustomer(Customer customer);
			public boolean updateCustomer(Customer customer);
			public Customer getCustomer(String email);
			public boolean validateCustomer(String email, String password);
			public List<Customer> listCustomers();
			
			
			public boolean addAddress(Address addr);
		    public boolean deleteAddress(Address addr);
		    public boolean updateAddress(Address addr);
		    public Address getAddressById(int addressId);
		    public List<Address> getAllAddressforCustomer(String email);
			
		    public boolean addOrders(Orders orders);
			public Orders getOrdersByCustomer(String customerEmail);
		    public boolean deleteOrders(int orderId);
}
