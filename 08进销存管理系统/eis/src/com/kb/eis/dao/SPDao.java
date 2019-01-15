package com.kb.eis.dao;

import java.util.List;

import com.kb.eis.pojo.Pojo;
import com.kb.eis.pojo.SPInfo;
import com.kb.eis.pojo.Sell;

public interface SPDao {
	/**
	 * 通过id查询
	 * @param spId
	 * @return
	 */
	SPInfo selectById(String spId);  // 商品
	/**
	 * 查询所有
	 * @return
	 */
	List<Pojo> selectAll();
	/**
	 * 添加
	 * @param spInfo
	 * @return
	 */
	int insert(SPInfo spInfo);
	/**
	 * 修改商品信息
	 * @param spInfo
	 * @return
	 */
	int update(SPInfo spInfo);
	/**
	 * 删除商品
	 * @param spId
	 * @return 
	 * @return
	 */
	void delete(String spId);
	

	/**
	 * 商品销售
	 * @param sell
	 * @return
	 */
	int updateSell(Sell sell);
	
	/**
	 * 销售记录查询
	 * @return
	 */
	List<Sell> findSalesRecord();
	/**
	 * 清算
	 * @param id
	 * @return
	 */
	int qs(String id);
}
