package com.kb.eis.service;
import java.util.List;
import com.kb.eis.pojo.User;

public interface UserService {

	/**
	 * 添加管理员
	 */
		public int add(User user);
	/**
	 * 修改管理员信息
	 */
		public int update(User user);
	/**
	 * 删除管理员
	 */
		public void delete(int id);
	/**
	 * 查询所有操作员
	 */
		public List<User> queryAll();
	/**
	 * 根据姓名模糊查询管理员
	 */
	public List<User> queryByName(String uName);
	/**
	 * 根据id修改该管理员的状态
	 * @param id
	 */
	public void updateStatus(int id, int status);
	/**
	 * 批量删除管理员
	 * @param check
	 */
	public void deleteMore(String check[]);
	/**
	 * 查询登录是否成功
	 * @param name
	 * @param pass
	 * @return
	 */
	public User queryUser(String name, String pass);
	/**
	 * 通过id查找管理员信息
	 * @param sno
	 * @return
	 */
	public User findById(int id);
	/**
	 * 查询要修改的管理员信息
	 * @param id
	 * @return
	 */
	public User toUpdate(int id);
	
	

	
}
