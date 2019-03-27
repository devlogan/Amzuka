package com.amzukafrontend.controllers;

import java.security.Principal;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.amzukastore.dao.CartDao;
import com.amzukastore.dao.CategoryDao;
import com.amzukastore.dao.CustomerDao;
import com.amzukastore.dao.ProductDao;
import com.amzukastore.dao.SupplierDao;
import com.amzukastore.models.Cart;
import com.amzukastore.models.Category;
import com.amzukastore.models.Customer;
import com.amzukastore.models.Item;
import com.amzukastore.models.Product;
import com.amzukastore.models.Supplier;

@Controller
public class IndexController {



	@Autowired
	HttpSession session;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SupplierDao supplierDao;

	@Autowired
	CartDao cartDao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	CustomerDao customerDao;
	
	@Autowired
	ProductDao productDao;

	@RequestMapping(value="/",method=RequestMethod.GET)
	public ModelAndView getHomePage(){

		Principal p=request.getUserPrincipal();
		if(p==null){
			System.out.println("principal is null");

		}
		else {
			int count=0;
			String email=p.getName();
			System.out.println(email);
			Customer customer=customerDao.getCustomer(email);

			session.setAttribute("customerObj",customer);
			
			Cart cart=cartDao.getCartByCustomer(email);

			if(cart!=null) {
				Collection<Item> items=cart.getItems();
				for(Item it:items){
					System.out.println("hello3");
					count=count+it.getQuantity();
				}
			}
			
			session.setAttribute("itemsCount",count);

		}
		List<Category> categoryList=categoryDao.listCategories();
		List<Supplier> supplierList=supplierDao.listSuppliers();
		List<Product> productList=productDao.getAllProducts();

		session.setAttribute("categoryList",categoryList);
		session.setAttribute("supplierList", supplierList);
		session.setAttribute("productList1", productList);
		ModelAndView mv=new ModelAndView("index");
		System.out.println(mv);
		return mv;
	}

	/*@RequestMapping(value="/**",method=RequestMethod.GET)
		public ModelAndView getErrorPage(){


			ModelAndView mv=new ModelAndView("index");
			mv.addObject("message", "This Page doesn't exist, just like Santa.");
			return mv;
		} 	*/



}
