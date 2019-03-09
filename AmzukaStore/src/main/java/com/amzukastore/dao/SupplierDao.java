package com.amzukastore.dao;

import java.util.List;

import com.amzukastore.models.Product;
import com.amzukastore.models.Supplier;

public interface SupplierDao {
	
	public boolean addSupplier(Supplier supplier);
	public boolean deleteSupplier(Supplier supplier);
	public boolean updateSupplier(Supplier supplier);
	public Supplier getSupplier(int supplierId);
	public List<Supplier> listSuppliers();
	public List<Product> productsBySupplier(Supplier supplier);

}
