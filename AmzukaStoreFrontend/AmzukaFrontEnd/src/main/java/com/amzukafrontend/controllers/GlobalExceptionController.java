package com.amzukafrontend.controllers;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import com.amzukafrontend.exceptions.CustomGenericException;

@ControllerAdvice
public class GlobalExceptionController {


	@ExceptionHandler(CustomGenericException.class)
	public String handleCustomException(CustomGenericException ex) {
		return "error\\generic_error";

	}

	@ExceptionHandler(Exception.class)
	public String handleAllException(Exception ex) {
		ex.printStackTrace();
		return "error\\generic_error2";
	}


}
