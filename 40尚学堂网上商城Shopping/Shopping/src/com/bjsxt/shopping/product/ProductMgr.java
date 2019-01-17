package com.bjsxt.shopping.product;

import java.util.List;

public class ProductMgr {
	private static ProductMgr mgr = null;
	
	private static ProductDAO dao = new ProductMySQLDAO(); 
	
	private ProductMgr() {}
	
	public static ProductMgr getInstance() {
		if(mgr == null) {
			mgr = new ProductMgr();
		}
		return mgr;
	}
	
	public List<Product> getProducts() {
		return dao.getProducts();
	}
	
	public int getProducts(List<Product> products, int pageNo, int pageSize, boolean lazy) {
		return dao.getProducts(products, pageNo, pageSize, lazy);
	}
	
	public void add(Product p) {
		dao.add(p);
	}
	
	public void update(Product p) {
		dao.update(p);
	}
	
	public void delete(int id) {
		dao.delete(id);
	}
	
	public Product loadById(int id) {
		return dao.loadById(id);
	}
	
	public void delete(String[] idArray) {
		String conditionStr = " where id in (";
		for (int i = 0; i < idArray.length; i++) {
			conditionStr += idArray[i];
			conditionStr += ",";
		}
		conditionStr = conditionStr.replaceAll(".$", ")");
		//conditionStr = conditionStr.substring(0, conditionStr.length() - 1) + ")";
System.out.println(conditionStr);
		dao.delete(conditionStr);
	}
	
	public int find(List<Product> products, int pageNo, int pageSize, int categoryId) {
		String queryStr = " where p.categoryid = " + categoryId;
		return dao.find(products, pageNo, pageSize, queryStr);
	}
	
	public int find(List<Product> products, int pageNo, int pageSize, String keyword) {
		String queryStr = " where p.name like '%" + keyword + "%' or p.descr like '%" + keyword + "%'"; 
		return dao.find(products, pageNo, pageSize, queryStr);
	}
	
	public int find(List<Product> products, int pageNo, int pageSize, ProductSearchFormBean bean) {
		String queryStr = " where 1=1 ";
		if(bean.getCategoryId() != -1) {
			queryStr += " and p.categoryid = " + bean.getCategoryId();
		}
		if(bean.getName() != null && !bean.getName().trim().equals("")) {
			queryStr += " and p.name like '%" + bean.getName() + "%'";
		}
		if(bean.getLowNormalPrice() != 0.0) {
			queryStr += " and p.normalprice >= " + bean.getLowNormalPrice();
		}
		if(bean.getHighNormalPrice() != 0.0) {
			queryStr += " and p.normalprice <= " + bean.getHighNormalPrice();
		}
		if(bean.getLowMemberPrice() != 0.0) {
			queryStr += " and p.memberprice >= " + bean.getLowMemberPrice();
		}
		if(bean.getHighMemberPrice() != 0.0) {
			queryStr += " and p.memberprice <= " + bean.getHighMemberPrice();
		}
		if(bean.getStartDate() != null && !bean.getStartDate().trim().equals("")) {
			queryStr += " and p.pdate >= '" + bean.getStartDate() + " 00:00:00'";
		}
		if(bean.getEndDate() != null && !bean.getEndDate().trim().equals("")) {
			queryStr += " and p.pdate <= '" + bean.getEndDate() + " 00:00:00'";
		}
		return dao.find(products, pageNo, pageSize, queryStr);
	}
	
	public List<Product> loadById(int[] ids) {
		return null;
	}
	
	public static void main(String[] args) {
		String[] idArray = {"1", "2", "3"};
		ProductMgr.getInstance().delete(idArray);
	}
}
