package com.bjsxt.shopping.product;

import java.util.List;

public interface ProductDAO {
	public List<Product> getProducts();
	public int getProducts(List<Product> products, int pageNo, int pageSize, boolean lazy);
	public void add(Product p);
	public void delete(int id);
	public void update(Product p);
	public Product loadById(int id);
	public void delete(String conditionStr);
	public int find(List<Product> products, int pageNo, int pageSize, String queryStr);
}


//UserDAO
	//MySQL Oracle
//CategoryDAO
	//MySQL Oracle
//ProductDAO
	//MySQL Oracle
/*
class DAOFactory {
	UserDAO getUserDAO() {
		return mysqlDao
	}
	
	CategoryDAO getCategoryDAO() {
		
	}
}
*/
//abstract factory
/*
interface DAOFactory {
	UserDAO getUserDAO() ;
	
	CategoryDAO getCategoryDAO() ;
}


class MySQLDAOFactory implements DAOFactory {
	UserDAO getUserDAO() { return mysqlDao };
	
	CategoryDAO getCategoryDAO() ;
}

interface SkinFactory {
	MenuBar getMenuBar();
}
*/
//factory method
//simple factory 
//abstract factory