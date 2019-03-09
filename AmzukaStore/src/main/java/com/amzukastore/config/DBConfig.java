package com.amzukastore.config;


import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.amzukastore.models.Cart;
import com.amzukastore.models.Category;
import com.amzukastore.models.Customer;
import com.amzukastore.models.Item;
import com.amzukastore.models.Product;
import com.amzukastore.models.Supplier;
import com.amzukastore.models.customerdetails.Address;
import com.amzukastore.models.customerdetails.CardDetails;
import com.amzukastore.models.customerdetails.OrderItems;
import com.amzukastore.models.customerdetails.Orders;
import com.amzukastore.models.productdetails.ProductDetails;


/*@Configuration annotation indicates that the class has @Bean definition methods. So Spring container can process the class and generate Spring Beans to be used in the application.*/
@Configuration

//Enables Spring's annotation-driven transaction management capability
@EnableTransactionManagement 

//@ComponentScan for stereotype annotations
@ComponentScan("com.amzukastore")
public class DBConfig {

	/*@Bean is an annotation through which we want to say Spring 
	 * container
	 * will manage this Bean*/
	@Bean(name="dataSource")
	public DataSource getDataSource(){
		/*
		Spring provides many ways to establish connection to a database 
		and perform operations such as retrieval of records, insertion 
		of new records and updating / deletion of existing records. 
		The most basic of them is using class 
		org.springframework.jdbc.datasource.DriverManagerDataSource
		*/
		DriverManagerDataSource dataSource=new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/dev_pc");
		dataSource.setUsername("sa");
		dataSource.setPassword("");
		return dataSource;
	}

	@Bean(name="sessionFactory")
	public SessionFactory getSessionFactory(){
		
		/*Properties is  a class  of java.util package
		 in properties, we  will map the hibernate
		 related properties*/
		Properties prop=new Properties();
		prop.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		prop.put("hibernate.show_sql",true);
		prop.put("hibernate.hbm2ddl.auto", "update");
		
		/*LocalSessionFactoryBuilder  is a Spring-provided extension of 
		 * the standard Hibernate {Configuration} class,
		 */
		LocalSessionFactoryBuilder builder=new LocalSessionFactoryBuilder(getDataSource());
		builder.addProperties(prop);
		builder.addAnnotatedClass(Category.class); 
		builder.addAnnotatedClass(Product.class);
		builder.addAnnotatedClass(Supplier.class);
		builder.addAnnotatedClass(ProductDetails.class);
		builder.addAnnotatedClass(Customer.class);
		builder.addAnnotatedClass(Address.class);
		builder.addAnnotatedClass(CardDetails.class);
		builder.addAnnotatedClass(Cart.class);
		builder.addAnnotatedClass(Item.class);
		builder.addAnnotatedClass(CardDetails.class);
		builder.addAnnotatedClass(Orders.class);
		builder.addAnnotatedClass(OrderItems.class);
		
		
		SessionFactory sessionFactory=builder.buildSessionFactory();
		return sessionFactory;
	}
	
	@Bean(name="transactionManager")
	@Autowired
	public HibernateTransactionManager getHibernateTransactionManager(SessionFactory sessionFactory){
		HibernateTransactionManager txManager=new HibernateTransactionManager(sessionFactory);
		return txManager;
	}
	
	@Bean(name="passwordEncoder")
	public PasswordEncoder passwordEncoder(){
		System.out.println("inside password encoder"); 
		return new BCryptPasswordEncoder();
	}
	
}






