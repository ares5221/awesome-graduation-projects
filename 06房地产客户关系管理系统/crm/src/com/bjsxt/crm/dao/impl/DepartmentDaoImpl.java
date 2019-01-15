package com.bjsxt.crm.dao.impl;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.crm.dao.DepartmentDao;
import com.bjsxt.crm.entity.Department;
import com.bjsxt.crm.entity.Notice;
import com.bjsxt.crm.util.DBUtil;
import com.bjsxt.crm.util.PageBean;




//部门Dao实现类
public class DepartmentDaoImpl implements DepartmentDao {


	//添加部门方法
	public int addDepartment(Department de) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		int n=0;
		try{
		//获取连接
		conn = DBUtil.getConnection();
		//发送命令或获取结果
		
		pstmt = conn.prepareStatement("insert into DEPARTMENT_INFO values(SEQ_DEPARTMENT.nextval,?,?,?)");
		pstmt.setString(1, de.getDepartment_name());
		pstmt.setString(2, de.getDepartment_desc());
		pstmt.setString(3, de.getIs_used());
		
		n = pstmt.executeUpdate();
		
		} catch (SQLException e) {
		e.printStackTrace();
		}finally{
		//关闭资源
		DBUtil.closeAll(null, pstmt, conn);
		}		
		return n;
	}

	
	//查询所有部门方法
	public List<Department> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<Department> deptList  = new ArrayList<Department>();
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			
			//向数据库发送SQL命令并得到结果
			String sql = "select * from DEPARTMENT_INFO order by department_ID";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//处理返回结果
			while(rs.next()){
				//取出结果集当前行各个字段的值
				int department_ID = rs.getInt("department_ID");
				String department_name = rs.getString("department_name");
				String department_desc = rs.getString("department_desc");
				String is_used = rs.getString("is_used");
				//封装成对象
				Department dept = new Department(department_ID, department_name, department_desc, is_used);
				//将对象加入集合
				deptList.add(dept);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return deptList;
	}



	
	//删除所选部门
	public int delete(int department_ID) {
		String sql = "delete from DEPARTMENT_INFO where DEPARTMENT_ID = ?";
		Object [] params = {department_ID};
		return DBUtil.executeUpdate(sql, params);	
	}




	//准备修改所选部门
	public Department toUpdate(int department_ID) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Department dept = null;
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			
			//向数据库发送SQL命令并得到结果
			String sql = "select * from DEPARTMENT_INFO where department_ID =  "+department_ID;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//处理返回结果
			if(rs.next()){
				//取出结果集当前行各个字段的值
				String department_name = rs.getString("department_name");
				String department_desc = rs.getString("department_desc");
				String is_used = rs.getString("is_used");
				//封装成对象
				dept = new Department(department_ID, department_name, department_desc, is_used);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		return dept;
	}


	
	//修改所选部门
	public int update(Department de) {
		String sql = "update DEPARTMENT_INFO set department_name=?,"
				+ " department_desc=?, is_used=? where department_ID = ?";
		Object [] params = {de.getDepartment_name(),de.getDepartment_desc(),de.getIs_used(),de.getDepartment_ID()};
		return DBUtil.executeUpdate(sql, params);
	}


	//条件查询所选部门
	public List<Department> showdept(PageBean pageBean, int department_ID, String department_name) {
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			List<Department> deptList  = new ArrayList<Department>();
			try {
				//建立连接
				conn  = DBUtil.getConnection();
				//向数据库发送SQL命令并得到结果
				StringBuffer sql = new StringBuffer("select * from DEPARTMENT_INFO  where 1=1  ");
				if(department_ID != 0){
					sql.append(" and department_ID = "+department_ID);
				}
				if(department_name != null && !"".equals(department_name)){
					sql.append(" and department_name like '%"+department_name+"%'");
				}			
				sql.append(" order by department_ID desc");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql.toString());
				//处理返回结果
				while(rs.next()){
					//取出结果集当前行中学生字段的的值
					//department_ID  已经有了不用获取
					department_ID = rs.getInt("department_ID");
					//department_name 已经有了 不用获取
					department_name = rs.getString("department_name");
					String department_desc = rs.getString("department_desc");
					String is_used = rs.getString("is_used");
					//封装成学生对象
					
					Department de = new Department(department_ID, department_name, department_desc, is_used);
					
					
					
					//将对象加入集合
					deptList.add(de);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				//关闭数据库资源
				DBUtil.closeAll(rs, stmt, conn);
			}
			
			return deptList;
			
		}

/**
 * 公告方法
 */
	//公告条件查询
	public List<Notice> shownotice(int
			notice_ID, String notice_item,
			String notice_content) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Notice> noList  = new ArrayList<Notice>();
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			//向数据库发送SQL命令并得到结果
			StringBuffer sql = new StringBuffer("select * from NOTICE_INFO  where 1=1  ");
			if(notice_ID != 0){
				sql.append(" and notice_ID = "+notice_ID);
			}
			if(notice_item != null && !"".equals(notice_item)){
				sql.append(" and notice_item like '%"+notice_item+"%'");
			}		
			if(notice_content != null && !"".equals(notice_content)){
				sql.append(" and notice_content like '%"+notice_content+"%'");
			}	
			sql.append(" order by notice_ID desc");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			//处理返回结果
			while(rs.next()){
				//取出结果集当前行中学生字段的的值
				notice_ID = rs.getInt("notice_ID");
				int user_ID = rs.getInt("user_ID");
				notice_item = rs.getString("notice_item");
				notice_content = rs.getString("notice_content");
				Date notice_time=rs.getDate("notice_time");
				Date notice_endtime=rs.getDate("notice_endtime");
				String is_used = rs.getString("is_used");
				//封装成学生对象
				Notice no = new Notice(notice_ID, user_ID, notice_item, notice_content, notice_time, notice_endtime, is_used);
				//将对象加入集合
				noList.add(no);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return noList;
		
	}

	//公告添加方法
	@Override
	public int addNotice(Notice no) {
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		int n=0;
		try{
		//获取连接
		conn = DBUtil.getConnection();
		//发送命令或获取结果
		
		pstmt = conn.prepareStatement("insert into NOTICE_INFO values(SEQ_NOTICE.nextval,?,?,?,?,?,?)");
		pstmt.setInt(1, no.getUser_ID());
		pstmt.setString(2, no.getNotice_item());
		pstmt.setString(3, no.getNotice_content());
		pstmt.setDate(4, no.getNotice_time());
		pstmt.setDate(5, no.getNotice_endtime());
		pstmt.setString(6, no.getIs_used());
		
		n = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		//关闭资源
		DBUtil.closeAll(null, pstmt, conn);
		}		
		return n;
	}


	//删除公告方法
	public void deleteNotice(int notice_ID) {
		String sql = "delete from NOTICE_INFO where notice_ID = ?";
		Object [] params = {notice_ID};
		DBUtil.executeUpdate(sql, params);	
	}


	@Override//公告查询带分页方法1
	public int findCount(String department_name, int ddepartment_ID) {
		Connection conn =DBUtil.getConnection();
		Statement stmt =null;
		ResultSet rs =null;
		int count = 0;
		/**try {
			stmt =conn.createStatement();
			StringBuffer sql = new StringBuffer("select count(*) from DEPARTMENT_INFO where 1=1");
			if(department_name != null && !"".equals(department_name)){
				sql.append(" and department_name like '%"+department_name+"%'");
			}
			if(ddepartment_ID != 0){
				sql.append(" and  department_ID >"+ddepartment_ID);
			}
			rs = stmt.executeQuery(sql.toString());
			rs.next();
			count = rs.getInt(1);
			*/
		try {
			stmt =conn.createStatement();
			StringBuffer sql = new StringBuffer("select * from DEPARTMENT_INFO where 1=1");
			if(department_name != null && !"".equals(department_name)){
				sql.append(" and department_name like '%"+department_name+"%'");
			}
			if(ddepartment_ID != 0){
				sql.append(" and  department_ID ="+ddepartment_ID);
			}
			rs = stmt.executeQuery(sql.toString());
			while(rs.next()){
				count++;
				}
			count = rs.getInt(count);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return count;		
	}
	


	@Override//公告查询带分页方法2
	public List<Department> findDept(int start, int end,
			String sdepartment_name, int sdepartment_ID) {
		Connection conn =DBUtil.getConnection();
		Statement stmt =null;
		ResultSet rs =null;
		List <Department> deptList = new ArrayList<Department>();
		try {
			stmt =conn.createStatement();
			StringBuffer sql = new StringBuffer("select * from DEPARTMENT_INFO where 1=1");
			if(sdepartment_name != null && !"".equals(sdepartment_name)){
				sql.append(" and department_name like '%"+sdepartment_name+"%'");
			}
			if(sdepartment_ID != 0){
				sql.append(" and  department_ID ="+sdepartment_ID);
			}
			sql.append(" order by department_ID desc");
			
			String sql2 = "select  * from (select rownum rn,stu2.* "
					+ "from ( "+sql.toString()+" ) stu2 "
					+ "where rownum <="+end+" ) "
					+ "where rn >"+start;
			rs = stmt.executeQuery(sql2);
			while(rs.next()){
				Department dept = new Department();
				dept.setDepartment_ID(rs.getInt("department_ID"));
				dept.setDepartment_name(rs.getString("department_name"));
				dept.setDepartment_desc(rs.getString("department_desc"));
				dept.setIs_used(rs.getString("is_used"));
				
				deptList.add(dept);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return deptList;
	}


	@Override
	public int findCount(int notice_ID, String notice_item,
			String notice_content) {
		Connection conn =DBUtil.getConnection();
		Statement stmt =null;
		ResultSet rs =null;
		int count = 0;
		try {
			stmt =conn.createStatement();
			StringBuffer sql = new StringBuffer("select * from NOTICE_INFO where 1=1");
			if(notice_ID != 0){
				sql.append(" and  notice_ID ="+notice_ID);
			}
			if(notice_item != null && !"".equals(notice_item)){
				sql.append(" and notice_item like '%"+notice_item+"%'");
			}
			if(notice_content != null && !"".equals(notice_content)){
				sql.append(" and notice_content like '%"+notice_content+"%'");
			}
			
			rs = stmt.executeQuery(sql.toString());
			while(rs.next()){
				count++;
				}
			count = rs.getInt(count);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return count;		
	
	}


	@Override
	public List<Notice> findNotice(int start, int end, int notice_ID,
			String notice_item, String notice_content) {
		Connection conn =DBUtil.getConnection();
		Statement stmt =null;
		ResultSet rs =null;
		List <Notice> List = new ArrayList<Notice>();
		try {
			stmt =conn.createStatement();
			StringBuffer sql = new StringBuffer("select * from NOTICE_INFO where 1=1");
			if(notice_item != null && !"".equals(notice_item)){
				sql.append(" and notice_item like '%"+notice_item+"%'");
			}
			if(notice_content != null && !"".equals(notice_content)){
				sql.append(" and notice_content like '%"+notice_content+"%'");
			}
			if(notice_ID != 0){
				sql.append(" and  notice_ID ="+notice_ID);
			}
			sql.append(" order by notice_ID desc");
			
			String sql2 = "select  * from (select rownum rn,stu2.* "
					+ "from ( "+sql.toString()+" ) stu2 "
					+ "where rownum <="+end+" ) "
					+ "where rn >"+start;
			rs = stmt.executeQuery(sql2);
			while(rs.next()){
				Notice dept = new Notice();
				dept.setNotice_ID(rs.getInt("notice_ID"));
				dept.setUser_ID(rs.getInt("user_ID"));
				dept.setNotice_item(rs.getString("notice_item"));
				dept.setNotice_content(rs.getString("notice_content"));
				dept.setNotice_time(rs.getDate("notice_time"));
				dept.setNotice_endtime(rs.getDate("notice_endtime"));
				dept.setIs_used(rs.getString("is_used"));
				
				List.add(dept);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, stmt, conn);
		}
		return List;
	}

	

}
