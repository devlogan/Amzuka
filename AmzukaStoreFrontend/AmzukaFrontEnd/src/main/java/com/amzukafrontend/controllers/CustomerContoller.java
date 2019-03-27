package com.amzukafrontend.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.amzukastore.dao.CategoryDao;
import com.amzukastore.dao.CustomerDao;
import com.amzukastore.models.Category;
import com.amzukastore.models.Customer;

@Controller
public class CustomerContoller {

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	CustomerDao customerDao;

	@Autowired
	HttpServletRequest request;

	ModelAndView mv;


	@RequestMapping(value="/registerCustomer",method=RequestMethod.GET)
	public ModelAndView getRegisterForm(){
		ModelAndView mv=new ModelAndView("SignUpForm");
		mv.addObject("CustomerObj",new Customer());
		return mv;

	}

	@RequestMapping(value="/register",method=RequestMethod.POST)
	public ModelAndView doRegister(@Valid @ModelAttribute("CustomerObj") Customer customerObj, BindingResult result){

		if(result.hasErrors())
		{
			mv=new ModelAndView("SignUpForm");
		}
		else {
			customerObj.setEnabled(true);	
			customerObj.setRole("Customer");	
			customerDao.addCustomer(customerObj);	
			mv=new ModelAndView("redirect:/login");
		}
		return mv;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView logincustomer(@RequestParam(name="logout",required=false)String logout,
			@RequestParam(name="error",required=false)String error) {
		System.out.println("I m  here");

		Principal principal=request.getUserPrincipal();

		if(principal!=null) {
			mv = new ModelAndView("index");
		}
		else {	 
			mv = new ModelAndView("Login");
			if(logout!=null){
				mv.addObject("msg","customer has been logged out succesfully..");
			}
			if(error!=null){
				mv.addObject("msg","Email or Password is incorrect");
			}
			List<Category> categories=categoryDao.listCategories();
 		 mv.addObject("categoryList",categories);
			        }
		return mv; 
	}

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDeniedPage() {
		ModelAndView mv = new ModelAndView("AccessDenied");
		return mv; 
	}

	@RequestMapping(value = "/errorPage", method = RequestMethod.GET)
	public String errorPage() {
		return "redirect:/login?error"; 
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request,HttpServletResponse response) {
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		if(auth!=null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "redirect:/login?logout"; 
	}
}


