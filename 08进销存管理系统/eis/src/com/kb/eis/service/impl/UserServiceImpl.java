package com.kb.eis.service.impl;
import java.util.List;
import com.kb.eis.dao.UserDao;
import com.kb.eis.dao.impl.UserDaoImpl;
import com.kb.eis.pojo.User;
import com.kb.eis.service.UserService;

public class UserServiceImpl implements UserService{
private UserDao userDao=new UserDaoImpl();
/**
 * 添加操作员
 */
	@Override
	public int add(User user) {
		
		return userDao.add(user);
	}
/**
 * 通过id修改操作员信息
 */
	@Override
	public int update(User user) {
		return userDao.update(user);
	}
/**
 * 通过id删除操作员
 */
	@Override
	public void delete(int id) {
		userDao.delete(id);
		
	}
/**
 * 查询显示所有操作员
 */
	@Override
	public List<User> queryAll() {
		
		return userDao.queryAll();
	}
/**
 * 通过登录名或姓名模糊查询
 */
	@Override
	public List<User> queryByName(String uName) {
		return userDao.queryByName(uName);
		
	}
@Override
public void updateStatus(int id,int status) {
	userDao.updateStatus(id,status);
	
}
/**
 * 批量删除
 */
@Override
public void deleteMore(String check[]) {
	
	userDao.deletMore(check);
	
}
@Override
public User queryUser(String name, String pass) {
	return userDao.queryUser(name,pass);
}
@Override
public User findById(int id) {
	return userDao.findById(id);
}
@Override
public User toUpdate(int id) {
	return userDao.findById(id);
}


}
