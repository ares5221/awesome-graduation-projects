package com.bjsxt.crm.service.impl;

import java.util.List;









import com.bjsxt.crm.dao.HouseDao;
import com.bjsxt.crm.dao.impl.HouseDaoImpl;
import com.bjsxt.crm.entity.House;
import com.bjsxt.crm.entity.House_Type;
import com.bjsxt.crm.service.HouseService;
import com.bjsxt.crm.util.PageBean;

public class HouseServiceImpl implements HouseService {
	private HouseDao houseDao=new HouseDaoImpl();
	@Override
	public void find(PageBean<House> pageBean, int queryType, String houseInput) {
		int totalCount = this.houseDao.findCount(queryType,houseInput);
		pageBean.setTotalCount(totalCount);
		
		int startRow = pageBean.getStartRow();
		int endRow = pageBean.getEndRow();
		
		
		List<House> houseList = this.houseDao.findStu(startRow,endRow,queryType,houseInput);
		pageBean.setList(houseList);
		
	}
	@Override
	public void delete(int house_ID) {
		this.houseDao.delete(house_ID);
		
	}
	@Override
	public void update(int house_ID) {
		
		
	}
	@Override
	public House findHouse(int house_ID) {
		
		return this.houseDao.findHouse(house_ID);
	}
	@Override
	public List<House_Type> findAllType() {
		
		return this.houseDao.findAllType();
	}
	@Override
	public void modify(House house) {
		this.houseDao.modify(house);
		
	}
	@Override
	public void add(House house) {
		
		this.houseDao.add(house);
		
	}
	@Override
	public void findType(PageBean<House_Type> pageBean, String houseInput) {
		System.out.println("HouseServiceImpl.findType()");
		int totalCount = this.houseDao.findTypeCount(houseInput);
		pageBean.setTotalCount(totalCount);
		
		int startRow = pageBean.getStartRow();
		int endRow = pageBean.getEndRow();
		
		
		List<House_Type> typeList = this.houseDao.findType(startRow,endRow,houseInput);
		System.out.println(typeList);
		pageBean.setList(typeList);
	}
	@Override
	public void addType(String type_name) {
		this.houseDao.addType(type_name);
	}
	@Override
	public void deleteType(int type_ID) {
		this.houseDao.deleteType(type_ID);
	}
	@Override
	public void find1(PageBean<House> pageBean, int queryType,
			String houseInput, int user_ID) {
		if(queryType==3){
			queryType=1;
			int totalCount1 = this.houseDao.findCount1(queryType,houseInput,user_ID);
		
			queryType=2;
			int totalCount2 = this.houseDao.findCount1(queryType,houseInput,user_ID);
			
			//同时大于0
			if(totalCount1>0&&totalCount2>0){
				
				int totalCount = this.houseDao.findCount20(3,houseInput,user_ID);
				pageBean.setTotalCount(totalCount);
				int startRow = pageBean.getStartRow();
				int endRow= pageBean.getEndRow();
				
				
				List<House> houseList2 = this.houseDao.findStu20(startRow,endRow,3,houseInput,user_ID);
				pageBean.setList(houseList2);
			}
			//一大一小相等
			else{
				if(totalCount1>totalCount2){
					int totalCount = this.houseDao.findCount21(3,houseInput,user_ID);
					pageBean.setTotalCount(totalCount);
					int startRow = pageBean.getStartRow();
					int endRow= pageBean.getEndRow();
					
					
					List<House> houseList2 = this.houseDao.findStu21(startRow,endRow,3,houseInput,user_ID);
					pageBean.setList(houseList2);
				}else{
					int totalCount = this.houseDao.findCount22(3,houseInput,user_ID);
					pageBean.setTotalCount(totalCount);
					int startRow = pageBean.getStartRow();
					int endRow= pageBean.getEndRow();
					
					
					List<House> houseList2 = this.houseDao.findStu22(startRow,endRow,3,houseInput,user_ID);
					pageBean.setList(houseList2);
				}
			}
		
			
			
			
		}else{
			
				int totalCount = this.houseDao.findCount1(queryType,houseInput,user_ID);
				pageBean.setTotalCount(totalCount);
				
				int startRow = pageBean.getStartRow();
				int endRow = pageBean.getEndRow();
				
				
				List<House> houseList = this.houseDao.findStu1(startRow,endRow,queryType,houseInput,user_ID);
				pageBean.setList(houseList);
		}
	}

}
