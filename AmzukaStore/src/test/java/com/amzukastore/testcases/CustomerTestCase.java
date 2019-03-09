package com.amzukastore.testcases;

import static org.junit.Assert.assertTrue;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.amzukastore.config.DBConfig;
import com.amzukastore.dao.CategoryDao;
import com.amzukastore.dao.CustomerDao;
import com.amzukastore.models.Customer;

public class CustomerTestCase {

	
    static CustomerDao customerDao;
    
	@SuppressWarnings("resource")
	@BeforeClass
	public static void init(){
	AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
	context.register(DBConfig.class);
	context.refresh();
	System.out.println("hello");
	
	customerDao=context.getBean("customerDao",CustomerDao.class);
	}
	
	@Test
	@Ignore
	public void addCustomerTest() {
		
		
		Customer customer=new Customer();
		customer.setCustomerName("Pradeep Kumar");
		customer.setMobileNo("9868755555");
		customer.setEmail("kathar@gmail.com");
		customer.setPassword("hellosir");
		
		System.out.println("hello2");
		
		boolean r=customerDao.addCustomer(customer);
		System.out.println(customer.getEmail());
	
    	
        assertTrue("customer not saved", r);
		
	} 
	
	@Test
     public void validateCustomerTest() {
		
		
		boolean r=customerDao.validateCustomer("kathar@gmail.com", "hellosir");
		
	
    	
        assertTrue("customer not saved", r);
		
	}

}
