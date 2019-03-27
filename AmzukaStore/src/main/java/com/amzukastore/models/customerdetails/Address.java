package com.amzukastore.models.customerdetails;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.validator.constraints.NotEmpty;

import com.amzukastore.models.Customer;

@Entity
public class Address implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7540458993622838214L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", unique=true, updatable=false, nullable=false)
	private int id; 

	@NotEmpty(message="Name cannot be empty")
	private String name;

	@NotEmpty(message="House No. cannot be empty")
	private String houseNo;

	@NotEmpty(message="House No. cannot be empty")
	private String streetName;

	private String district;

	@NotEmpty(message="City cannot be empty")
	private String city;

	@NotEmpty(message="It cannot be empty")
	private String state;

	@NotEmpty(message="Pin Code cannot be empty")
	private String pincode;

	@NotEmpty(message="Mobile No is required")
	private String mobileNo;

	@ManyToOne
	@JoinColumn(name="customerId")
	private Customer customer; 

	//Getters and Setters for instance variables
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getHouseNo() {
		return houseNo;
	}
	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}





}
