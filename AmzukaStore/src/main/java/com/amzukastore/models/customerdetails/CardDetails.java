package com.amzukastore.models.customerdetails;

import javax.persistence.Embeddable;

//CardDetails of user to be persisted for future payments
@Embeddable
public class CardDetails {
    
	private String cardNumber;
	private String nameOnCard;
	private String expiryDate;
	private String expiryYear;
	
	//Getters and Setters for instance variables
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getNameOnCard() {
		return nameOnCard;
	}
	public void setNameOnCard(String nameOnCard) {
		this.nameOnCard = nameOnCard;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getExpiryYear() {
		return expiryYear;
	}
	public void setExpiryYear(String expiryYear) {
		this.expiryYear = expiryYear;
	}
	
	

}
