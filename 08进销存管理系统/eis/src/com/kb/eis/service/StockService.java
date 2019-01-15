package com.kb.eis.service;

import java.util.List;

import com.kb.eis.pojo.Stock;

public interface StockService {
	
	/**
	 * 查询所有库存信息
	 * @author fcc
	 * 
	 */
	public List<Stock> queryAllStock();
}
