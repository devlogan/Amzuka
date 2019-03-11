package com.amzukastore.testcases;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.amzukastore.config.DBConfig;
import com.amzukastore.dao.CategoryDao;
import com.amzukastore.models.Category;

public class CategoryTestCase {


	static CategoryDao categoryDao;

	@BeforeClass
	public static void init(){
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.register(DBConfig.class);
		context.refresh();


		categoryDao=context.getBean("categoryDao",CategoryDao.class);

	}

	@Test
	@Ignore
	public void categoryTest()
	{  

		Category category=new Category();

		category.setCategoryName("hello");
		category.setCategoryDesc("hello23234");

		boolean r=categoryDao.addCategory(category);
		System.out.println(category.getCategoryId());
		assertTrue("category not saved", r);



	}





}
