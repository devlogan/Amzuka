package com.amzukastore.testcases;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.amzukastore.config.DBConfig;
import com.amzukastore.dao.SupplierDao;
import com.amzukastore.models.Supplier;

public class SupplierTestCase {

	
static SupplierDao supplierDao;
	
	@BeforeClass
	public static void init() {
		
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.register(DBConfig.class);
		context.refresh();
		
		System.out.println("hello");
		
		supplierDao=context.getBean("supplierDao",SupplierDao.class);
		System.out.println(supplierDao);
		//System.out.println("hello");
	}
	
	@Test
	@Ignore
	public void testAddSupplier() {
		
		Supplier supplier=new Supplier();
		supplier.setSupplierName("Bada Bhai");
		supplier.setSupplierAdd("selling garments");
		
		Boolean r=supplierDao.addSupplier(supplier);
		System.out.println("hello");
		assertTrue("not added", r);
		
	}
	
	
	
	
	
	@Test
	@Ignore
	public void test() {
		fail("Not yet implemented");
	}

}
