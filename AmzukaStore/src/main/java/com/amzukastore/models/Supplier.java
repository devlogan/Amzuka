package com.amzukastore.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Supplier implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 14675350914829019L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int supplierId;

	@NotEmpty(message="Supplier Name is mandatory")
	private String supplierName;

	@NotEmpty(message="Supplier Address is mandatory")
	private String supplierAdd;


	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="supplier",fetch=FetchType.EAGER)
	private List<Product> productList=new ArrayList<>();

	//Getters and Setters for instance variables
	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSupplierAdd() {
		return supplierAdd;
	}

	public void setSupplierAdd(String supplierAdd) {
		this.supplierAdd = supplierAdd;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}




}
