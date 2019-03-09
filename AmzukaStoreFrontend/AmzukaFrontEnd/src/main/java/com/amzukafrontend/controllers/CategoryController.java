package com.amzukafrontend.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.amzukastore.dao.CategoryDao;
import com.amzukastore.models.Category;

@Controller
public class CategoryController {
	
	
	@Autowired
	CategoryDao categoryDao;
	ModelAndView mv;
	Category category;
	
	@Autowired
	HttpSession session;

	@RequestMapping(value="/addCategory",method=RequestMethod.GET)
	public ModelAndView getCategoryForm(){
	    
	    mv=new ModelAndView("CategoryForm");
	    mv.addObject("categoryObj",new Category());
	    return mv;
	}
	
	@RequestMapping(value="/addCategoryProcess",method=RequestMethod.POST)
	public ModelAndView addCategoryProcess(@Valid @ModelAttribute("categoryObj")Category category,BindingResult result){
		
		if(result.hasErrors()){
			mv=new ModelAndView("CategoryForm");
		
		}
		else {
		categoryDao.addCategory(category);
		mv=new ModelAndView("redirect:/viewAllCategories");
		mv.addObject("message","Added Successfully");
		session.setAttribute("categoryList",categoryDao.listCategories());
		}
		return mv;
	}
	
	@RequestMapping(value="viewAllCategories",method=RequestMethod.GET)
	public ModelAndView getAllCategories(){
		mv=new ModelAndView("ViewAllCategories");
		mv.addObject("categoryList",categoryDao.listCategories());
		return mv;
	}
	
	@RequestMapping(value="deleteCategory/{catId}",method=RequestMethod.GET)
	public ModelAndView deleteCategory(@PathVariable int catId) {
		
		categoryDao.deleteCategory(categoryDao.getCategory(catId));
		mv=new ModelAndView("redirect:/viewAllCategories");
		mv.addObject("message","Deleted Successfully");
		
        return mv;
	}
	
	@RequestMapping(value="updateCategory/{catId}",method=RequestMethod.GET)
	public ModelAndView updateCategoryForm(@PathVariable int catId) {
		
		mv=new ModelAndView("CategoryForm");
		mv.addObject("categoryObj",categoryDao.getCategory(catId));
		return mv;
		
		
	}
	
	@RequestMapping(value="/updateCategoryProcess",method=RequestMethod.POST)
	public ModelAndView updateCategoryProcess(@Valid @ModelAttribute("categoryObj")Category category , BindingResult result) {
		
		if(result.hasErrors()){
			mv=new ModelAndView("CategoryForm");
	
		}
		
		else {
		categoryDao.updateCategory(category);
		mv=new ModelAndView("redirect:/viewAllCategories");
		mv.addObject("message","Updated Successfully");
		}
		
		return mv;
		
	}
	
		
		
	
}




