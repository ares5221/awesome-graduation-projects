package com.kb.eis.dao;
import java.util.List;
import com.kb.eis.pojo.User;

public interface UserDao {
/**
 * 添加操作员
 */
	public int add(User user);
/**
 * 修改操作员信息
 * @return 
 */
	public int update(User user);
/**
 * 删除操作员
 */
	public void delete(int id);
/**
 * 查询所有操作员
 */
	public List<User> queryAll();
/**
 * 根据姓名模糊查询操作员
 */
	public List<User> queryByName(String name);
/**
 * 根据id修改该操作员的状态	
 * @param id
 */
public void updateStatus(int id, int status);
/**
 * 批量删除操作员
 * @param check
 */
public void deletMore(String[] check);
/**
 * 登录判断用户
 * @param name
 * @param pass
 */
public User queryUser(String name, String pass);

public User findById(int id);


}
