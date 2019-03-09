package com.amzukastore.models;

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
public class Category {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int categoryId;
	
	@NotEmpty(message="Category Name is mandatory")
	private String categoryName;
	
	@NotEmpty(message="Category Description is mandatory")
    private String categoryDesc;
   
    //uni-directional mapping with Product class
    @OneToMany(mappedBy="category",cascade=CascadeType.REMOVE,fetch=FetchType.EAGER)
    private List<Product> productList=new ArrayList<>();
	
    //Getters and Setters for instance variables
    public int getCategoryId() {
		return categoryId;
	}
    
    public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
    
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryDesc() {
		return categoryDesc;
	}
	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
	public List<Product> getProductList() {
		return productList;
	}
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	
    
	
    
    
}
