package com.kb.eis.service.impl;

import java.util.List;

import com.kb.eis.dao.CGDao;
import com.kb.eis.dao.RKDao;
import com.kb.eis.dao.SPDao;
import com.kb.eis.dao.impl.CGDaoImpl;
import com.kb.eis.dao.impl.KuCunDaoImpl;
import com.kb.eis.dao.impl.RKDaoImpl;
import com.kb.eis.dao.impl.SPDaoImpl;
import com.kb.eis.pojo.CG;
import com.kb.eis.pojo.KuCun;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.pojo.RuKu;
import com.kb.eis.pojo.SPInfo;
import com.kb.eis.service.KuCunService;

public class KuCunServiceImpl implements KuCunService {
	private RKDao rkdao = new RKDaoImpl();
	private KuCunDaoImpl kcdao = new KuCunDaoImpl();
	@Override
	public int add(String rkid) {
		CGDao cgdao = new CGDaoImpl();
		SPDao spdao = new SPDaoImpl();
		//1查询入库单得到数据
		RuKu rk = rkdao.queryByID(rkid);
		CG cg = cgdao.queryByCGID(rk.getCgid());//cgdao.queryByID(rk.getCgid());
		SPInfo sp = spdao.selectById(cg.getSpid());
		//2通过入库单数据查询  商品编号  判断库存中是否有相同商品
		KuCun kc = kcdao.queryBySPID(rk.getSpid());
		int rs = 0;
		int rs2 = 0;
		//3执行添加或者修改操作
		if(kc==null){
			//添加库存表
			rs = kcdao.add(cg,sp);
		}else{
			//通过商品编号添加数据库表
			rs = kcdao.update(kc,cg,sp);
		}
		if(rs>0){
			rs2 = new RKDaoImpl().updateByID(rkid);
		}
		return rs2;
	}
	/**
	 * 查询所有库存
	 */
	@Override
	public List<KuCun> queryAll() {
		return kcdao.queryAll();
	}
	
	/**
	 * 据库存编号查询库存
	 * @param id
	 * @return
	 */
	public KuCun findStockById(String id) {
		return kcdao.queryStockById(id);
	}
	
	/**
	 * 更新库存数据
	 * @return
	 */
	public int updateStock(KuCun kuCun) {
		return kcdao.updateStock(kuCun);
	}
	
	/**
	 * 商品销售后，更新库存
	 * @param kcid
	 * @param kcsl
	 */
	public int updateSl(String kcid, int kcsl) {
		return kcdao.updateSl(kcid, kcsl);
		
	}

}
