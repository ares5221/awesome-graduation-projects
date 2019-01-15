package com.bjsxt.crm.dao;

import java.util.List;

import com.bjsxt.crm.entity.Department;
import com.bjsxt.crm.entity.Notice;
import com.bjsxt.crm.util.PageBean;

/**
 * 部门Dao接口
 * @author Administrator
 *
 */
public interface DepartmentDao {

	
	//	添加部门
	public int addDepartment(Department departenmt);
	
	//查询所有部门
	public List<Department> findAll();

	//删除所选部门
	public int delete(int department_ID);

	//准备修改所选的部门
	public Department toUpdate(int department_ID);
	
	//修改所选部门
	public int update(Department department);

	
	//条件查询部门
	public List<Department> showdept(PageBean pageBean, int department_ID, String department_name);

	
	/**
	 * 公告方法
	 * @param snotice_ID
	 * @param notice_item
	 * @param notice_content
	 * @return
	 */
	//公告条件查询
	public List<Notice> shownotice(int snotice_ID, String notice_item,
			String notice_content);
	
	//添加公告方法
	public int addNotice(Notice no);

	//删除公告方法
	public void deleteNotice(int notice_ID);

	//查询分页1部门
	public int findCount(String department_name, int department_ID);

	//查询分页2部门
	public List<Department> findDept(int start, int end,
			String department_name, int department_ID);
	
	//	公告分页查询1
	public int findCount(int notice_ID, String notice_item,
			String notice_content);
	
	//	公告分页查询2
	public List<Notice> findNotice(int start, int end, int notice_ID,
			String notice_item, String notice_content);

	

}
