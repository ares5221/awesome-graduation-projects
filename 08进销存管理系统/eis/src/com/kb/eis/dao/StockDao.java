package com.kb.eis.dao;

import java.util.List;

import com.kb.eis.pojo.Stock;

public interface StockDao {
	
	/**
	 * 查询所有库存信息
	 * @author fcc
	 * 
	 */
	public List<Stock> findAllStock();
	
	/**
	 * 库存品价格调整
	 * @param id
	 */
	public void updateStockPrice(String id);
}
