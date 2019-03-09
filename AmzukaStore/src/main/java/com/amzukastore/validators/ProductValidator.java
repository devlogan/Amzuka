package com.amzukastore.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.amzukastore.models.Product;

@Component
public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class clazz) {
		
		return Product.class.isAssignableFrom(clazz);
		
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Product product=(Product)target;
		if(product.getCategoryId()==0){
			errors.rejectValue("categoryId", "mykey1");
		}
		
		if(product.getSupplierId()==0){
			errors.rejectValue("supplierId", "mykey2");
		}
		
	}

}
