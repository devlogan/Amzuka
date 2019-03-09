package com.amzukafrontend.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amzukastore.dao.CategoryDao;
import com.amzukastore.dao.ProductDao;
import com.amzukastore.dao.SupplierDao;
import com.amzukastore.models.Category;
import com.amzukastore.models.Product;
import com.amzukastore.models.Supplier;
import com.amzukastore.validators.ProductValidator;

@Controller
public class ProductController {
	
	@Autowired
	ProductDao productDao;
	ModelAndView mv;
	
	@Autowired
	CategoryDao categoryDao;
	@Autowired	
	SupplierDao supplierDao;

    @Autowired
    HttpSession session;
    
    
	
	@RequestMapping(value="/addProduct",method=RequestMethod.GET)
	public ModelAndView getProductForm(){
	   
	   List<Category> categoryList=categoryDao.listCategories();
	   List<Supplier> supplierList=supplierDao.listSuppliers();
		
	    mv=new ModelAndView("ProductForm");
	    mv.addObject("categoryObj",categoryList);
	    mv.addObject("supplierObj",supplierList);
	    mv.addObject("productObj",new Product());
	    
	    return mv;
	}
	
	@Autowired
	ProductValidator productValidator;
	
	@RequestMapping(value="/addProductProcess",method=RequestMethod.POST)
	public ModelAndView addProductProcess(@Valid @ModelAttribute("productObj")Product product, BindingResult result){
		
		productValidator.validate(product,result);
		
		if(product.getpImage().getSize()==0){
		result.rejectValue("pImage","mykey3");
		System.out.println("hello1");
		}
		
		if(result.hasErrors()){
			mv=new ModelAndView("ProductForm");
			System.out.println("hello2");
			
		}
		
		else {
		MultipartFile fileObj1=product.getpImage();
		MultipartFile fileObj2=product.getpImage1();
		
		String imgName=fileObj1.getOriginalFilename();
		String imgName1=fileObj2.getOriginalFilename();
		
		System.out.println(imgName);
		System.out.println(imgName1);
		
			
		product.setImgName(imgName);
		product.setImgName1(imgName1);
		productDao.addProduct(product);
	
		uploadImage(fileObj1);
		uploadImage(fileObj2);
		
		mv=new ModelAndView("redirect:/viewAllProducts");
		mv.addObject("message","Added Successfully");
		}
		//session.setAttribute("productList",productDao.getAllProducts());
		
		return mv;
	}
	
	@RequestMapping(value="/getAllProductsByCategory/{catId}",method=RequestMethod.GET)
	public ModelAndView getProductsByCategory(@PathVariable int catId){
		
		List<Product> productsList=productDao.getAllProductsById(catId);
		System.out.println(productsList);
		
		ModelAndView mv=new ModelAndView("ViewAllProductsByCategory");
		mv.addObject("productList",productsList);
		return mv;
	}
	
	@RequestMapping(value="viewAllProducts",method=RequestMethod.GET)
	public ModelAndView getAllProducts(){
		mv=new ModelAndView("ViewAllProducts");
		mv.addObject("productList",productDao.getAllProducts());
		return mv;
	}
	
	@RequestMapping(value="/deleteProduct/{pId}",method=RequestMethod.GET)
	public ModelAndView deleteProductById(@PathVariable int pId){
		
		Product pro=productDao.getProductById(pId);
		productDao.deleteProduct(pro);
		
		ModelAndView mv=new ModelAndView("ViewAllProducts");
		mv.addObject("productList",productDao.getAllProducts());
		mv.addObject("msg","Product Deleted Succesfully");
		return mv;
	}
	
	/*@RequestMapping(value="/getAllProductsByCategory/{cId}",method=RequestMethod.GET)
	public ModelAndView getProductsByCategory(@PathVariable int cId){
		
		List<Product> productsList=productDao.getAllProductsById(cId);
		
		ModelAndView mv=new ModelAndView("ViewAllProductsByCategory");
		mv.addObject("productList",productsList);
		return mv;
	}*/
	
	@RequestMapping(value="updateProduct/{proId}",method=RequestMethod.GET)
	public ModelAndView getUpdateProductForm(@PathVariable int proId){
		Product proObj=productDao.getProductById(proId);
		
		ModelAndView mv=new ModelAndView("ProductForm");
		mv.addObject("productObj",proObj);
		return mv;
	}
	
	@RequestMapping(value="updateProductProcess",method=RequestMethod.POST)
	public ModelAndView updateProductProcess(@ModelAttribute("productObj") Product product){
		
		MultipartFile mFile1=product.getpImage();
		MultipartFile mFile2=product.getpImage1();
		int pId= product.getProductId();
		
		if(mFile1.getSize()==0){
			
			System.out.println("Product Id" +pId);
			Product p=productDao.getProductById(pId);
			String oldImageName=p.getImgName();
			System.out.println(oldImageName);
			product.setImgName(oldImageName);
			
		}
		else
		{
		   product.setImgName(mFile1.getOriginalFilename());
		   uploadImage(mFile1);
		}
		
        if(mFile2.getSize()==0){
		
			System.out.println("Product Id" +pId);
			Product p=productDao.getProductById(pId);
			String oldImageName=p.getImgName1();
			System.out.println(oldImageName);
			product.setImgName1(oldImageName);
			
		}
        
        else {
        	product.setImgName(mFile2.getOriginalFilename());	
        	uploadImage(mFile2);
        }
        
        productDao.updateProduct(product);
		ModelAndView mv=new ModelAndView("ViewAllProducts");
		mv.addObject("productList",productDao.getAllProducts());
		mv.addObject("msg","Product Updated Succesfully");
		
		return mv;
	}
	
	private void uploadImage(MultipartFile fileObj){
		String filePathString = session.getServletContext().getRealPath("/");
		System.out.println("filePathString : "+filePathString);
		
		try {
			
			byte[] imageBytes=fileObj.getBytes();
			
			String str=filePathString+"resources\\images\\";
			File file=new File(str);
			if(!file.exists()) {
				file.mkdirs();
			}
		    FileOutputStream fos=new FileOutputStream
			(filePathString+"resources\\images\\"+fileObj.getOriginalFilename());
			BufferedOutputStream bos= new BufferedOutputStream(fos);
			
			bos.write(imageBytes);
			bos.close();
	
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	

}
