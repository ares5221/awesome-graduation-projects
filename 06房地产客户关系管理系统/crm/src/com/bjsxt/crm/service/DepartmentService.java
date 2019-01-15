package com.bjsxt.crm.service;

import java.util.List;

import com.bjsxt.crm.entity.Department;
import com.bjsxt.crm.entity.Notice;
import com.bjsxt.crm.util.PageBean;

/**
 * 部门Service
 * @author Administrator
 *
 */
public interface DepartmentService {

	
	//	添加部门
	public int add(Department departenmt);

	//查询所有部门
	public List<Department> findAll();

	//删除所选部门
	public int delete(int department_ID);

	//准备修改所选部门
	public Department toUpdate(int department_ID);

	//修改所选部门
	public int update(Department department);

	//条件查询所选部门
	public void showdept(PageBean pageBean, int department_ID, String department_name);

	
	/**公告方法
	 * 
	 * @param snotice_ID
	 * @param notice_item
	 * @param notice_content
	 * @return
	 */
	//公告条件查询方法
	public List<Notice> shownotice(int snotice_ID, String notice_item,
			String notice_content);

	//添加公告方法
	public int addNotice(Notice no);

	//删除公告方法
	public void deleteNotice(int notice_ID);
	
//带分页的公告查询
	public void shownotice(PageBean pageBean, int notice_ID,
			String notice_item, String notice_content);

	

}
