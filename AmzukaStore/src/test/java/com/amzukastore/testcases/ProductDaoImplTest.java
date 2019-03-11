package com.amzukastore.testcases;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.amzukastore.config.DBConfig;
import com.amzukastore.dao.ProductDao;
import com.amzukastore.models.Product;

public class ProductDaoImplTest {

	static ProductDao productDao;

	@BeforeClass
	public static void init() {

		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.register(DBConfig.class);
		context.refresh();

		System.out.println("hello");

		productDao=context.getBean("productDao",ProductDao.class);
		System.out.println(productDao);

	}

	@Test
	//@Ignore
	public void testAddProduct() {

		Product product=new Product();
		product.setPrice(3312);
		product.setProductName("Laptop");
		product.setQuantity(34);
		product.setRating(3.4);
		product.setCategoryId(164);
		product.setSupplierId(166);

		Boolean r=productDao.addProduct(product);
		assertTrue("not added", r);

	}

	@Test
	@Ignore
	public void testUpdateProduct() {
		fail("Not yet implemented");
	}

	@Test
	@Ignore
	public void testDeleteProduct() {
		fail("Not yet implemented");
	}

	@Test
	@Ignore
	public void testGetProductById() {
		fail("Not yet implemented");
	}

	@Test
	@Ignore
	public void testGetAllProducts() {

		List<Product> list=productDao.getAllProductsById(162);
		if(list!=null) {
			Boolean r=true;
			assertTrue("not added", r);
		}
	}

}
