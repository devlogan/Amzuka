package com.amzukafrontend.controllers;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amzukastore.dao.CartDao;
import com.amzukastore.dao.CustomerDao;
import com.amzukastore.dao.ItemDao;
import com.amzukastore.dao.OrderItemsDao;
import com.amzukastore.dao.ProductDao;
import com.amzukastore.models.Cart;
import com.amzukastore.models.Customer;
import com.amzukastore.models.Item;
import com.amzukastore.models.Product;
import com.amzukastore.models.customerdetails.Address;
import com.amzukastore.models.customerdetails.OrderItems;
import com.amzukastore.models.customerdetails.Orders;

@Controller
public class CartController {

	private String customerEmail;

	@Autowired
	CartDao cartDao;

	@Autowired
	CustomerDao customerDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	ItemDao itemDao;

	@Autowired
	HttpSession session;

	@Autowired
	OrderItemsDao orderItemDao;

	Customer customerObj;

	ModelAndView mv;


	@ModelAttribute
	public void getUserEmail(HttpServletRequest request){
		Principal p=request.getUserPrincipal();
		customerEmail=p.getName();
		customerObj=customerDao.getCustomer(customerEmail);
	}


	@RequestMapping(value="/addToCart/{productId}",method=RequestMethod.GET)
	public String addToCart(@PathVariable("productId")int productId,HttpServletRequest request,RedirectAttributes redirectAttributes){
		
		Cart cartObj=cartDao.getCartByCustomer(customerEmail);
		
		if(cartObj==null){
			System.out.println("Cart doesnt exist");
			cartObj=new Cart();
			cartObj.setCustomer(customerDao.getCustomer(customerEmail));

			cartDao.addCart(cartObj);
			System.out.println("Cart created succesfully");
		}
		else {
			System.out.println("Cart exist already");
		}

		Product pObj=productDao.getProductById(productId);
		Item itemObj=itemDao.getItemByProductIdAndCustomerId(pObj.getProductId(),customerEmail);

		if(itemObj==null)
		{
			itemObj=new Item();
			itemObj.setCart(cartObj);
			itemObj.setCustomerId(customerEmail);
			itemObj.setPrice(pObj.getPrice());
			itemObj.setProduct(pObj);
			itemObj.setQuantity(1);

			itemDao.addItem(itemObj);
			System.out.println("Item added in cart");
		}
		else {
			itemDao.increaseQuantity(itemObj.getItemId());
			System.out.println("Quantity Updated Succesfully");
		}
		
		int count=1;
		for(Item item:cartObj.getItems()){
			count=count+item.getQuantity();
		}
		redirectAttributes.addFlashAttribute("itemsCount", count);
		
		//return "redirect:/viewCart?cartId="+cartObj.getCartId();
		return getPreviousPageByRequest(request).orElse("/"); //else go to home page;
	}

	@RequestMapping(value="viewCart",method=RequestMethod.GET)
	public ModelAndView getCart(@RequestParam(name="addrId",required=false)Integer addressId){

		double sum=0;
        int count=0;
		
        mv=new ModelAndView("Cart");
        Cart cartObj=cartDao.getCartByCustomer(customerEmail);
        
        if(cartObj==null){
			System.out.println("Cart doesnt exist");
			cartObj=new Cart();
			cartObj.setCustomer(customerDao.getCustomer(customerEmail));

			cartDao.addCart(cartObj);
			System.out.println("Cart created succesfully");
		}
		else {
			System.out.println("Cart exist already");
		}

		
		if(cartObj.getItems().size()==0){
			mv.addObject("msg","Dear Customer , You cart is empty..");
			
		}
		
		else {

			Collection<Item> itemslist=cartObj.getItems();
			for(Item item:itemslist){
				sum=sum+(item.getPrice()*item.getQuantity());
				count=count+item.getQuantity();
			}
			
			mv.addObject("cartItems",itemslist);
			mv.addObject("totalCost",sum);
			
		}
		session.setAttribute("itemsCount",count);
		return mv;
	}


	@RequestMapping(value="increaseQuantity/{itemId}",method=RequestMethod.GET)
	public String increase(@PathVariable("itemId") int itemId,ModelMap map){

		Item item=itemDao.getItemById(itemId) ;
		Product product=item.getProduct();

		if(item.getQuantity()<product.getQuantity()) {
			itemDao.increaseQuantity(itemId);
		}
		else {
			map.addAttribute("status","out of stock");
		}

		return "redirect:/viewCart";
	}

	@RequestMapping(value="decreaseQuantity/{itemId}",method=RequestMethod.GET)
	public String decrease(@PathVariable int itemId,@RequestParam(name="deleteItem",required=false)int deleteItem){

		Item item=itemDao.getItemById(itemId);
		if(item.getQuantity()>1 && deleteItem==0) {
			itemDao.decreaseQuantity(itemId);
		}
		if(deleteItem==1)
		{
			itemDao.deleteItem(itemId);
		}
		return "redirect:/viewCart";
	}


	@RequestMapping(value="getAddressPage",method=RequestMethod.GET)
	public ModelAndView getAddressPage(){
		Set<Address> addrs=customerObj.getAddressList();

		ModelAndView mv=new ModelAndView("AddressPage");
		if(addrs.size()!=0){
			mv.addObject("addressList",addrs);
		}

		mv.addObject("addressObj",new Address());
		return mv;
	}


	@RequestMapping(value="addAddress",method=RequestMethod.POST)
	public String addAddress(@ModelAttribute("addressObj")Address address ){

		address.setCustomer(customerObj);
		System.out.println(address.getCustomer());
		customerDao.addAddress(address);
		return "redirect:getAddressPage";	
	}

	@RequestMapping(value="deleteAddress", method=RequestMethod.GET)
	public String deleteAddress(@RequestParam("address")int addressId) {

		Address address=customerDao.getAddressById(addressId);
		customerDao.deleteAddress(address);

		return "redirect:/getAddressPage";

	}

	@RequestMapping(value="updateAddress", method=RequestMethod.GET)
	public ModelAndView updateAddress(@RequestParam("address")int addressId) {

		Address address=customerDao.getAddressById(addressId);
		mv=new ModelAndView("AddressPage");
		mv.addObject("addressObj",address);
		mv.addObject("update",1);

		return mv;
	}

	@RequestMapping(value="/updateAddressProcess",method=RequestMethod.POST)
	public ModelAndView updateAdressProcess(@Valid @ModelAttribute("addressObj")Address address , BindingResult result) {

		if(result.hasErrors()){
			mv=new ModelAndView("AddressPage");

		}

		else {
			customerDao.updateAddress(address);
			mv=new ModelAndView("redirect:/getAddressPage");
			mv.addObject("message","Updated Successfully");
		}

		return mv;

	}

	@RequestMapping(value="/confirmationPage",method=RequestMethod.GET)
	public ModelAndView showConfirmationPage(@RequestParam("address")int addressId){
		double sum=0;

		System.out.println("I m show confirmation page");

		Cart cartObj=cartDao.getCartByCustomer(customerEmail);
		int cartId=cartObj.getCartId();
		Collection<Item> itemslist=itemDao.getItemsListByCart(cartId);

		for(Item item:itemslist){
			sum=sum+(item.getPrice()*item.getQuantity());
		}
		ModelAndView mv=new ModelAndView("ConfirmationPage");
		mv.addObject("addressObj",customerDao.getAddressById(addressId));
		mv.addObject("cartItems",itemslist);
		mv.addObject("totalCost",sum);
		return mv;

	}


	@RequestMapping(value="/paymentPage",method=RequestMethod.GET)
	public ModelAndView paymentProcess(){

		ModelAndView mv=new ModelAndView("Payment");
		mv.addObject("customerObj", customerDao.getCustomer(customerEmail));
		return mv;	
	}

	@RequestMapping(value="/successfulPage",method=RequestMethod.POST)
	public ModelAndView successfulPageProcess(@ModelAttribute(name="customerObj" )Customer customer){

		ModelAndView mv=new ModelAndView("SuccessPage");
		customerDao.updateCustomer(customer);

		Cart cart=cartDao.getCartByCustomer(customerEmail);

		Orders orders=new Orders();
		orders.setCustomer(customerDao.getCustomer(customerEmail));
		orders.setDate(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		customerDao.addOrders(orders);

		OrderItems orderItems=new OrderItems();

		List<OrderItems> orderItemsList=new ArrayList<OrderItems>();
		List<Item> itemslist=(List<Item>) cart.getItems();

		for(Item item:itemslist) {

			orderItems.setCustomerId(item.getCustomerId());
			orderItems.setOrders(orders);
			orderItems.setPrice(item.getPrice());
			orderItems.setQuantity(item.getQuantity());
			orderItems.setProduct(item.getProduct());

			orderItemDao.addOrderItems(orderItems);

			orderItemsList.add(orderItems);

			Product pro=item.getProduct();
			pro.setQuantity(pro.getQuantity()-item.getQuantity());
			productDao.updateProduct(pro);
		}

		cartDao.deleteCart(cart.getCartId());

		return mv;	
	}
	
	protected Optional<String> getPreviousPageByRequest(HttpServletRequest request)
	{
	   return Optional.ofNullable(request.getHeader("Referer")).map(requestUrl -> "redirect:" + requestUrl);
	}


}
