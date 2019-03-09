package com.amzukastore.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int productId;
	
	@NotEmpty(message="Product name is mandatory")
	private String productName;
	
	@NotNull(message="Price is Mandatory")
	@Min(value=100)
	private double price;
	
	@NotNull(message="Price is Mandatory")
	@Min(value=0)
	private int quantity;
	
	private double rating;
	
	private int categoryId;
	private int supplierId;
	
	
	
	@Transient
	private MultipartFile pImage;
	
	@Transient
	private MultipartFile pImage1;
	
	private String imgName;
	private String imgName1;
	
	@ManyToOne
	@JoinColumn(name="supplierId",insertable=false,updatable=false)
	private Supplier supplier;
	
	@ManyToOne
	@JoinColumn(name="categoryId",insertable=false,updatable=false)
	private Category category;
    
	//Getters and Setters for instance variables
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public MultipartFile getpImage() {
		return pImage;
	}

	public void setpImage(MultipartFile pImage) {
		this.pImage = pImage;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public MultipartFile getpImage1() {
		return pImage1;
	}

	public void setpImage1(MultipartFile pImage1) {
		this.pImage1 = pImage1;
	}

	public String getImgName1() {
		return imgName1;
	}

	public void setImgName1(String imgName1) {
		this.imgName1 = imgName1;
	}

	
	
	
	
	
	
    	

}
