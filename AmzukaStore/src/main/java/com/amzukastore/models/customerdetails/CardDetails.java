package com.amzukastore.models.customerdetails;

import java.io.Serializable;

import javax.persistence.Embeddable;

//CardDetails of user to be persisted for future payments
@Embeddable
public class CardDetails implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1895065059402736271L;
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
