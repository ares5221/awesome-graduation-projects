package com.hd.service.impl;

import java.util.List;

import com.hd.dao.HouseInfoDao;
import com.hd.dao.impl.HouseInfoDaoImpl;
import com.hd.entity.HouseInfo;
import com.hd.entity.HouseType;
import com.hd.service.HouseInfoService;
import com.hd.util.PageBean;




public class HouseInfoServiceImpl implements HouseInfoService {

	private HouseInfoDao houseInfoDao = new HouseInfoDaoImpl();


	@Override
	public List<HouseInfo> findAll() {
		return this.houseInfoDao.findAll();
	}

	@Override
	public void delete(int house_id) {
		this.houseInfoDao.delete(house_id);
		
	}

	@Override
	public HouseInfo findById(int house_id) {
		
		return this.houseInfoDao.findById(house_id);
	}

	@Override
	public int update(HouseInfo hou) {
		
		return this.houseInfoDao.update(hou);
	}

	/* (non-Javadoc)
	 * @see com.hd.service.HouseInfoService#findHouseNum()
	 */
	@Override
	public List<HouseType> findHouseNum() {
		
		return this.houseInfoDao.findHouseNum();
	}

	@Override
	public int add(HouseInfo hou) {
		return this.houseInfoDao.add(hou);
	}

	/*分页查询
	 */
	@Override
	public void find(PageBean<HouseInfo> pageBean, String selectType,
			String selectContent) {
		int count = houseInfoDao.findRequiredCount(selectType,selectContent);
		pageBean.setTotalCount(count);
		int start = pageBean.getStartRow();
		int size = pageBean.getSize();
		List<HouseInfo> list = houseInfoDao.findRequiredItems(start,size,selectType,selectContent);
		pageBean.setList(list);
	}



}
