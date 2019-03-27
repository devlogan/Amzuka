package com.amzukastore.dao;

import java.util.List;

import com.amzukastore.models.Product;

public interface ProductDao {

	public boolean addProduct(Product product);
	public boolean updateProduct(Product product);
	public boolean deleteProduct(Product product);
	public Product getProductById(int productId);
	public List<Product> getAllProducts();
	public List<Product> getAllProductsById(int categoryId);


}
