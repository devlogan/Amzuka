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

import com.amzukastore.dao.SupplierDao;
import com.amzukastore.models.Supplier;

@Controller
public class SupplierController {



	@Autowired
	SupplierDao supplierDao;
	ModelAndView mv;
	Supplier supplier;

	@Autowired
	HttpSession session;

	@RequestMapping(value="/addSupplier",method=RequestMethod.GET)
	public ModelAndView getSupplierForm(){

		mv=new ModelAndView("SupplierForm");
		mv.addObject("supplierObj",new Supplier());

		return mv;
	}

	@RequestMapping(value="/addSupplierProcess",method=RequestMethod.POST)
	public ModelAndView addSupplierProcess(@Valid @ModelAttribute("supplierObj")Supplier supplier, BindingResult result){

		if(result.hasErrors()){
			mv=new ModelAndView("SupplierForm");
		}

		else {
			supplierDao.addSupplier(supplier);
			mv=new ModelAndView("redirect:/viewAllSuppliers");
			mv.addObject("message","Added Successfully");
			session.setAttribute("supplierObj",supplierDao.listSuppliers());
		}
		return mv;
	}

	@RequestMapping(value="viewAllSuppliers",method=RequestMethod.GET)
	public ModelAndView getAllSuppliers(){

		mv=new ModelAndView("ViewAllSuppliers");
		mv.addObject("supplierList",supplierDao.listSuppliers());

		return mv;
	}

	@RequestMapping(value="deleteSupplier/{supId}",method=RequestMethod.GET)
	public ModelAndView deleteSupplier(@PathVariable int supId) {

		supplierDao.deleteSupplier(supplierDao.getSupplier(supId));
		mv=new ModelAndView("redirect:/viewAllSuppliers");
		mv.addObject("message","Deleted Successfully");

		return mv;
	}

	@RequestMapping(value="updateSupplier/{supId}",method=RequestMethod.GET)
	public ModelAndView updateSupplierForm(@PathVariable int supId) {

		mv=new ModelAndView("SupplierForm");
		mv.addObject("supplierObj",supplierDao.getSupplier(supId));

		return mv;

	}

	@RequestMapping(value="/updateSupplierProcess",method=RequestMethod.POST)
	public ModelAndView updateSupplierProcess(@Valid @ModelAttribute("SupplierObj")Supplier supplier, BindingResult result) {

		if(result.hasErrors()){
			mv=new ModelAndView("SupplierForm");
		}

		else {
			supplierDao.updateSupplier(supplier);
			mv=new ModelAndView("redirect:/viewAllSuppliers");
			mv.addObject("message","Updated Successfully");
		}
		return mv;

	}
}
