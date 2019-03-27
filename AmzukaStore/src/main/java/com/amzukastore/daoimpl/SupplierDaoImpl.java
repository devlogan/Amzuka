package com.amzukastore.daoimpl;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.amzukastore.dao.SupplierDao;
import com.amzukastore.models.Product;
import com.amzukastore.models.Supplier;

@Repository("supplierDao")
@Transactional
public class SupplierDaoImpl implements SupplierDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean addSupplier(Supplier supplier) {

		try {

			Session session=sessionFactory.getCurrentSession();
			session.save(supplier);
			return true;

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteSupplier(Supplier supplier) {

		try {

			Session session=sessionFactory.getCurrentSession();
			session.delete(supplier);
			return true;

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean updateSupplier(Supplier supplier) {

		try {

			Session session=sessionFactory.getCurrentSession();
			session.update(supplier);
			return true;

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Supplier getSupplier(int supplierId) {

		try{
			Session session=sessionFactory.getCurrentSession();
			Supplier supplier=session.get(Supplier.class, supplierId);
			return supplier;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Supplier> listSuppliers() {

		try{
			Session session=sessionFactory.getCurrentSession();
			Query query=session.createQuery("from Supplier");
			return query.getResultList();
		}
		catch(Exception e){
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<Product> productsBySupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		return null;
	}

}
