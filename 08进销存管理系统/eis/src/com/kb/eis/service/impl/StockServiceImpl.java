package com.kb.eis.service.impl;

import java.util.List;

import com.kb.eis.dao.StockDao;
import com.kb.eis.dao.impl.StockDaoImpl;
import com.kb.eis.pojo.Stock;
import com.kb.eis.service.StockService;

public class StockServiceImpl implements StockService {
	private StockDao stockDao = new StockDaoImpl();
	
	/**
	 * 实现查询所有库存信息的功能
	 * @author fcc
	 */
	@Override
	public List<Stock> queryAllStock() {
		return this.stockDao.findAllStock();
	}
	
	/**
	 * 库存品价格调整
	 * @param stockId
	 */
	public void updatePrice(String id) {
		this.stockDao.updateStockPrice(id);
	}
	
	/**
	 * 查询待入库的商品信息
	 * @return
	 */
	/*public List<SP> findGoodsInfo() {
		return null;//此处需要另外一张表的dao实现对象来调接下来的查询方法
	}*/

}
