package com.bjsxt.crm.service.impl;

import java.util.List;






import com.bjsxt.crm.dao.DepartmentDao;
import com.bjsxt.crm.dao.impl.DepartmentDaoImpl;
import com.bjsxt.crm.entity.Department;
import com.bjsxt.crm.entity.Notice;
import com.bjsxt.crm.service.DepartmentService;
import com.bjsxt.crm.util.PageBean;
/**部门Service实现类
 * 
 * @author Administrator
 *
 */
public class DepartmentServiceImpl implements DepartmentService {
	private DepartmentDao departmentDao=new DepartmentDaoImpl();

	//添加部门
	public int add(Department departenmt) {
		return this.departmentDao.addDepartment(departenmt);
		
	}

	//查询所有部门
	public List<Department> findAll() {
		
		return this.departmentDao.findAll();
	}

	//删除所选部门
	public int delete(int department_ID) {
		return this.departmentDao.delete(department_ID);
	}

	//准备修改所选部门
	public Department toUpdate(int department_ID) {
		return this.departmentDao.toUpdate(department_ID);
	}

	//修改所选部门
	public int update(Department department) {
		
		return this.departmentDao.update(department);
	}

	
	//带分页的条件查询
	public void showdept(PageBean pageBean,int department_ID, String department_name) {
		//获取符合查询条件的学生记录数(完善，直接使用select count(*) from student获取记录总数)		
				int totalCount = this.departmentDao.findCount(department_name,department_ID);
				//根据学生记录数计算pageBean的其他属性(totalCount,totalPageCount,numbers)，就差学生数据了
				pageBean.setTotalCount(totalCount);
				
				//调用dao层获取指定页的数据并放入pageBean（list属性） oracle分页查询语句  三层子查询  rownum
				int start = pageBean.getStartRow();
				int end = pageBean.getEndRow();
				List<Department> deptList = this.departmentDao.findDept(start,end,department_name,department_ID);
				pageBean.setList(deptList);
				
		
	}

	//公告条件查询方法
	public List<Notice> shownotice(int snotice_ID, String notice_item,
			String notice_content) {
		return this.departmentDao.shownotice(snotice_ID,notice_item,notice_content);
	}

	//添加公告方法
	public int addNotice(Notice no) {
		
		return this.departmentDao.addNotice(no);
	}

	//删除公告方法
	public void deleteNotice(int notice_ID) {
		this.departmentDao.deleteNotice(notice_ID);
		
	}

	//条件查询公告办法带分页
	@Override
	public void shownotice(PageBean pageBean, int notice_ID,
			String notice_item, String notice_content) {
		//获取符合查询条件的学生记录数(完善，直接使用select count(*) from student获取记录总数)		
		int totalCount = this.departmentDao.findCount(notice_ID,notice_item,notice_content);
		//根据学生记录数计算pageBean的其他属性(totalCount,totalPageCount,numbers)，就差学生数据了
		pageBean.setTotalCount(totalCount);
		
		//调用dao层获取指定页的数据并放入pageBean（list属性） oracle分页查询语句  三层子查询  rownum
		int start = pageBean.getStartRow();
		int end = pageBean.getEndRow();
		List<Notice> noList = this.departmentDao.findNotice(start,end,notice_ID,notice_item,notice_content);
		pageBean.setList(noList);
		
		
	}

	


}
