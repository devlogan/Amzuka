package com.amzukastore.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.amzukastore.models.customerdetails.Address;
import com.amzukastore.models.customerdetails.CardDetails;

@Entity
public class Customer {
     
	 @Id
	 @Email(message="Unsupported email format")
	 @NotEmpty(message="Email is required")
	 private String email;
	 
	 @NotEmpty(message="choose a password")
	 private String password;
	 
	 
	 @Transient
	 @NotEmpty(message="confirm password")
	 private String cnfPassword;
	 
	 @NotEmpty(message="Name is required")
	 private String customerName;
	 
	 @NotEmpty(message="Mobile is mandatory")
	 private String mobileNo;
	 
	 private String role;
	 
	 private boolean enabled;
	 
	 
	 @OneToMany(mappedBy="customer",cascade=CascadeType.REMOVE,fetch=FetchType.EAGER)
	 private Set<Address> addressList=new HashSet<>();
	 
	 private CardDetails cardDetails;
    
	//Getters and Setters for instance variables
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	
	public String getCnfPassword() {
		return cnfPassword;
	}

	public void setCnfPassword(String cnfPassword) {
		this.cnfPassword = cnfPassword;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Set<Address> getAddressList() {
		return addressList;
	}

	public void setAddressList(Set<Address> addressList) {
		this.addressList = addressList;
	}

	public CardDetails getCardDetails() {
		return cardDetails;
	}

	public void setCardDetails(CardDetails cardDetails) {
		this.cardDetails = cardDetails;
	}
	 
	 
	 
	
}
