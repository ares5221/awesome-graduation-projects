package com.bjsxt.shopping.order;

import java.util.List;

import com.bjsxt.shopping.product.Product;

public interface OrderDAO {
	public void update(SalesOrder so);
	public int add(SalesOrder so);
	public List<SalesOrder> getOrders();
	public int getOrders(List<SalesOrder> orders, int pageNo, int pageSize);
	public void delete(int id);
	public SalesOrder loadById(int id);
	public void delete(String conditionStr);
	public int find(List<SalesOrder> products, int pageNo, int pageSize, String queryStr);
	public List<SalesItem> getSalesItems(int orderId);
	public void updateStatus(SalesOrder order);
	
}
