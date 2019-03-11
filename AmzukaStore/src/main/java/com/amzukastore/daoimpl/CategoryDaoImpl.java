package com.amzukastore.daoimpl;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.amzukastore.dao.CategoryDao;
import com.amzukastore.models.Category;
import com.amzukastore.models.Product;

@Repository("categoryDao")
@Transactional
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	SessionFactory sessionFactory;


	@Override
	public boolean addCategory(Category category) {
		try{
			Session session=sessionFactory.getCurrentSession();
			session.save(category);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteCategory(Category category) {
		try{
			Session session=sessionFactory.getCurrentSession();
			session.delete(category);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public boolean updateCategory(Category category) {
		try {
			Session session=sessionFactory.getCurrentSession();
			session.update(category);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Category getCategory(int categoryId) {
		try{
			Session session=sessionFactory.getCurrentSession();
			Category category=session.get(Category.class, categoryId);
			return category;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Category> listCategories() {
		try{
			Session session=sessionFactory.getCurrentSession();
			Query query=session.createQuery("from Category");
			return query.getResultList();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}





}
