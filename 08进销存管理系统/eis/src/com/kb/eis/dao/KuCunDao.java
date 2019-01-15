package com.kb.eis.dao;

import com.kb.eis.pojo.CG;
import com.kb.eis.pojo.KuCun;
import com.kb.eis.pojo.RuKu;
import com.kb.eis.pojo.SPInfo;

public interface KuCunDao {
	/**
	 * 通过商品id查询库存信息是否存在
	 * @param spid
	 * @return
	 */
	KuCun queryBySPID(String spid);
	/**
	 * 添加新的库存商品
	 * @param rk
	 * @param cg
	 * @param sp
	 * @return
	 */
	public int add(CG cg, SPInfo sp);
	/**
	 * 对老库存商品数量进行修改
	 * @param rk
	 * @param cg
	 * @param sp
	 * @return
	 */
	public int update(KuCun kc, CG cg, SPInfo sp);
	
	/**
	 * 更新库存数据
	 * @param kuCun
	 * @return
	 */
	public int updateStock(KuCun kuCun);
	/**
	 * 修改库存数量
	 * @param xssl
	 * @return
	 */
	public int updateSl(String kcid,int kcsl);
}
