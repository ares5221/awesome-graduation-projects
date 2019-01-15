package com.bjsxt.crm.service.impl;

import java.util.List;

import com.bjsxt.crm.dao.UserDao;
import com.bjsxt.crm.dao.impl.UserDaoImpl;
import com.bjsxt.crm.entity.Department;
import com.bjsxt.crm.entity.Notice;
import com.bjsxt.crm.entity.Role;
import com.bjsxt.crm.entity.User;
import com.bjsxt.crm.service.UserService;
import com.bjsxt.crm.util.PageBean;

public class UserServiceImpl implements UserService {
	UserDao userDao = new UserDaoImpl();
	@Override
	public int addUser(User user) {
		
		return this.userDao.add(user);
	}
//	@Override
//	public List<User> showUser() {
//		return this.userDao.find();
//	}
	@Override
	public int delUser(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.delete(userId);
	}
	@Override
	public User findById(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.findById(userId);
	}
	@Override
	public int upDateById(User user) {
		// TODO Auto-generated method stub
		return this.userDao.upDate(user);
	}

	/**
	 * 角色增删改查
	 * @param role
	 * @return
	 */
	
	//添加角色方法
	public int addRole(Role role) {
		
		return this.userDao.addRole(role);
	}

	//条件查询角色方法
	public List<Role> showRole(String role_name, int role_power) {
		
		return this.userDao.showRole(role_name,role_power);
	}

	//删除指定ID的角色
	public void deleteRole(int role_ID) {
		
		this.userDao.deleteRole(role_ID);
	}

	//	准备修改角色
	public Role toUpdateRole(int role_ID) {
		
		return this.userDao.toUpdateRole(role_ID);
	}

	//	修改角色
	public int update(Role role) {
		
		return this.userDao.update(role);
	}
	@Override
	public List<User> showUser(String queryType,String content) {
		return this.userDao.find(queryType,content);
	}
//	@Override
//	public List<User> showUser(int userId) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	@Override
	public void showRole(PageBean pageBean, String role_name,
			int role_power) {
		//获取符合查询条件的学生记录数(完善，直接使用select count(*) from student获取记录总数)		
		int totalCount = this.userDao.findCount(role_name,role_power);
		//根据学生记录数计算pageBean的其他属性(totalCount,totalPageCount,numbers)，就差学生数据了
		pageBean.setTotalCount(totalCount);
		
		//调用dao层获取指定页的数据并放入pageBean（list属性） oracle分页查询语句  三层子查询  rownum
		int start = pageBean.getStartRow();
		int end = pageBean.getEndRow();
		List<Role> noList = this.userDao.findRole(start,end,role_name,role_power);
		pageBean.setList(noList);
	}
	
}
