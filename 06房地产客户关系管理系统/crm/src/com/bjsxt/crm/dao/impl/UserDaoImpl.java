package com.bjsxt.crm.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.crm.dao.UserDao;
import com.bjsxt.crm.entity.Department;
import com.bjsxt.crm.entity.Role;
import com.bjsxt.crm.entity.User;
import com.bjsxt.crm.util.DBUtil;


public class UserDaoImpl implements UserDao {

	@Override
	public int add(User user) {
		
		String sql = "INSERT INTO User_Info (User_ID,Department_ID,Role_ID,User_name,User_sex,User_mobile,User_age,User_address,User_num,User_pw,User_tel,User_idnum,User_email,User_addtime,User_addman,User_intest,User_diploma,User_bankcard,User_nation,Is_married ) VALUES (seq_user.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object []params = {user.getDepartment_ID(),user.getRole_ID(),user.getUser_name(),
				user.getUser_sex(),user.getUser_mobile(),user.getUser_age(),user.getUser_address(),user.getUser_num(),
				user.getUser_pw(),user.getUser_tel(),user.getUser_idnum(),user.getUser_email(),user.getUser_addtime(),
				user.getUser_addman(),user.getUser_intest(),user.getUser_diploma(),user.getUser_bankcard(),user.getUser_nation(),user.getIs_married()};
		return DBUtil.executeUpdate(sql, params);
	}

//	@Override
//	public List<User> findAll() {
//		//创建连接
//		
//		PreparedStatement pstmt= null;
//		Connection conn = null;
//		ResultSet rs = null;
//		List<User>userList = new ArrayList<User>();
//		try {
//			//创建连接
//			conn = DBUtil.getConnection();
//			//创建sql
//			String sql = "SELECT * FROM USER_INFO";
//			pstmt  = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			//返回结果集
//			while(rs.next()){
//				int userId = Integer.parseInt(rs.getString("user_ID"));
//				String userName = rs.getString("user_name");
//				String userNum = rs.getString("user_num");
//				int userAge = Integer.parseInt(rs.getString("user_age"));
//				String  userPw = rs.getString("user_pw");
//				String userSex = rs.getString("user_sex");
//				String userNation = rs.getString("user_nation");
//				String userDiploma = rs.getString("user_diploma");
//				String isMarried =rs.getString("is_married");
//				int departmentId = Integer.parseInt(rs.getString("department_ID"));
//				int roleId = Integer.parseInt(rs.getString("role_ID"));
//				String userTel = rs.getString("user_tel");
//				String userIntest = rs.getString("user_intest");
//				String userBankcard = rs.getString("user_bankcard");
//				String  userMobile = rs.getString("user_mobile");
//				String userIdnum = rs.getString("user_idnum");
//				Date userAddtime = rs.getDate("user_addtime");
//				String userAddress = rs.getString("user_address");
//				String userAddman = rs.getString("user_addman");
//				String userEmail = rs.getString("user_email");
//				Date userChangetime = rs.getDate("user_changetime");
//				String userChangeman = rs.getString("user_addman");
//				String  is_used = rs.getString("is_used");
//				//封装
//				User user = new User(userId, departmentId, roleId, userName, userSex, userMobile, userAge, userAddress, userNum, userPw, userTel, userIdnum, userEmail, userAddtime, userAddman, userChangetime, userChangeman, userIntest, userDiploma, userBankcard, userNation, isMarried, is_used);
//				userList.add(user);
//			}
//		
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally{
//			DBUtil.closeAll(rs, pstmt, conn);
//		}
//		return userList;
//	}

	//根据userId删除指定用户
	public int delete(int userId) {
		
		String sql = "DELETE FROM USER_INFO WHERE user_ID = ?";
		Object [] params = {userId};
		return DBUtil.executeUpdate(sql, params);
		
	}

	/**
	 * 角色增删改查
	 * @param role
	 * @return
	 */
	
	//添加角色方法
	public int addRole(Role r) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int n=0;
		try{
		//获取连接
		conn = DBUtil.getConnection();
		//发送命令或获取结果
		
		pstmt = conn.prepareStatement("insert into USER_ROLE values(SEQ_ROLE.nextval,?,?,?)");
		pstmt.setString(1, r.getRole_name());
		pstmt.setInt(2, r.getRole_power());
		pstmt.setString(3, r.getIs_used());
		
		n = pstmt.executeUpdate();
		
		} catch (SQLException e) {
		System.out.println("部门添加失败");
		}finally{
		//关闭资源
		DBUtil.closeAll(null, pstmt, conn);
		}		
		return n;
	}

	//条件查询角色
	public List<Role> showRole(String role_name, int role_power) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Role> roleList  = new ArrayList<Role>();
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			//向数据库发送SQL命令并得到结果
			StringBuffer sql = new StringBuffer("select * from USER_ROLE  where 1=1  ");
			if(role_power != 0){
				sql.append(" and role_power = "+role_power);
			}
			if(role_name != null && !"".equals(role_name)){
				sql.append(" and role_name like '%"+role_name+"%'");
			}			
			sql.append(" order by role_ID desc");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			//处理返回结果
			while(rs.next()){
				//取出结果集当前行中学生字段的的值
				int role_ID = rs.getInt("role_ID");
				role_name = rs.getString("role_name");
				role_power = rs.getInt("role_power");
				String is_used = rs.getString("is_used");
				//封装成角色对象
				
				Role  r= new Role(role_ID, role_name, role_power, is_used);
				
				
				
				//将对象加入集合
				roleList.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		
		return roleList;
		
	}

	//删除指定ID的角色
	public void deleteRole(int role_ID) {
		String sql = "delete from USER_ROLE where role_ID = ?";
		Object [] params = {role_ID};
		 DBUtil.executeUpdate(sql, params);	
		
	}

	//准备修改角色
	public Role toUpdateRole(int role_ID) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Role role = null;
		try {
			//建立连接
			conn  = DBUtil.getConnection();
			
			//向数据库发送SQL命令并得到结果
			String sql = "select * from USER_ROLE where role_ID =  "+role_ID;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//处理返回结果
			if(rs.next()){
				//取出结果集当前行各个字段的值
				String role_name = rs.getString("role_name");
				int role_power = rs.getInt("role_power");
				String is_used = rs.getString("is_used");
				//封装成对象
				role= new Role(role_ID, role_name, role_power, is_used);
				
			}
			
		} catch (SQLException e) {
			System.out.println("没有这个角色");
		}finally{
			//关闭数据库资源
			DBUtil.closeAll(rs, stmt, conn);
		}
		return role;
	}

	//修改角色
	public int update(Role role) {
		String sql = "update USER_ROLE set role_name=?,"
				+ " role_power=?, is_used=? where role_ID = ?";
		Object [] params = {role.getRole_name(),role.getRole_power(),role.getIs_used(),role.getRole_ID()};
		
		return DBUtil.executeUpdate(sql, params);
	}

	@Override
	public List<User>  find(String queryType,String content) {
				//创建连接
		
 				Statement stmt = null;
				Connection conn = null;
				ResultSet rs = null;
				List<User>userList = new ArrayList<User>();
				User user = null;
				try {
					//创建连接
					conn = DBUtil.getConnection();
					//创建sql
					//String sql = "SELECT * FROM USER_INFO where 1=1 user_ID="+userId;
//					StringBuffer sql = new StringBuffer("SELECT * FROM user_role r JOIN（SELECT * "
//							+ "FROM USER_INFO join department_info on user_info.department_ID = "
//							+ "department_info.department_ID）e ON  r.role_id = e.role_id where 1=1 ");
					StringBuffer sql = new StringBuffer("SELECT * FROM User_Info i,"
							+ "User_Role r,department_info d WHERE i.department_id"
							+ " = d.department_id AND i.role_id = r.role_id");
					if(queryType!=null&& !"".equals(queryType)){
						if(queryType=="uname"||"uname".equals(queryType)){
							if(content!=null){
								sql.append(" and user_name like '%"+content+"%'");
							}
						}if(queryType=="udept"||"udept".equals(queryType)){
							sql.append(" and department_name like '%"+content+"%'");
						}if(queryType=="urole"||"urole".equals(queryType)){
							if(content!=null){
								sql.append(" and role_name like '%"+content+"%'");
							}else{sql.append(" and i.role_id = 1");}
						}if(queryType=="udm"||"udm".equals(queryType)){
							sql.append(" and user_diploma like '%"+content+"%'");
						}
						//sql.append(" and user_info.department_ID = department_info.department_ID ");
					}
					stmt  = conn.createStatement();
					rs=stmt.executeQuery(sql.toString());
					//返回结果集
					while(rs.next()){
						int userId = Integer.parseInt(rs.getString("user_ID"));
						String userName = rs.getString("user_name");
						String userNum = rs.getString("user_num");
						int userAge = Integer.parseInt(rs.getString("user_age"));
						String  userPw = rs.getString("user_pw");
						String userSex = rs.getString("user_sex");
						String userNation = rs.getString("user_nation");
						String userDiploma = rs.getString("user_diploma");
						String isMarried =rs.getString("is_married");
						int departmentId = rs.getInt("DEPARTMENT_ID");
						int roleId = Integer.parseInt(rs.getString("role_ID"));
						String userTel = rs.getString("user_tel");
						String userIntest = rs.getString("user_intest");
						String userBankcard = rs.getString("user_bankcard");
						String  userMobile = rs.getString("user_mobile");
						String userIdnum = rs.getString("user_idnum");
						Date userAddtime = rs.getDate("user_addtime");
						String userAddress = rs.getString("user_address");
						String userAddman = rs.getString("user_addman");
						String userEmail = rs.getString("user_email");
						Date userChangetime = rs.getDate("user_changetime");
						String userChangeman = rs.getString("user_addman");
						String  is_used = rs.getString("is_used");
						
						String departmentName = rs.getString("DEPARTMENT_NAME");
						String departmentDesc = rs.getString("DEPARTMENT_DESC");
						String roleName = rs.getString("ROLE_NAME");
						int rolePower = rs.getInt("ROLE_POWER");
						//封装
						Role role = new Role(roleName, rolePower, is_used);
						Department department = new Department(departmentId, departmentName, departmentDesc, is_used);
						 user = new User(userId, departmentId, roleId, userName, userSex, userMobile, userAge, userAddress, userNum, userPw, userTel, userIdnum, userEmail, userAddtime, userAddman, userChangetime, userChangeman, userIntest, userDiploma, userBankcard, userNation, isMarried, is_used,department,role);
						userList.add(user);
					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					DBUtil.closeAll(rs, stmt, conn);
				}
				return userList;
			}

	@Override
	public int upDate(User user) {
		String sql = "UPDATE USER_INFO SET USER_NAME=?,USER_AGE=?,"
				+ "USER_SEX=?,USER_NATION=?,USER_DIPLOMA=?,IS_MARRIED=?,"
				+ "DEPARTMENT_ID=?,ROLE_ID=?,USER_TEL=?,USER_INTEST=?,"
				+ "USER_BANKCARD=?,USER_MOBILE=?,USER_IDNUM=?,USER_CHANGETIME=?,"
				+ "USER_ADDRESS=?,USER_CHANGEMAN=?,USER_EMAIL=? WHERE USER_ID=?";
				
		Object [] params = {user.getUser_name(),user.getUser_age(),user.getUser_sex(),
				user.getUser_nation(),user.getUser_diploma(),user.getIs_married(),
				user.getDepartment_ID(),user.getRole_ID(),user.getUser_tel(),user.getUser_intest(),
				user.getUser_bankcard(),user.getUser_mobile(),user.getUser_idnum(),
				user.getUser_changetime(),user.getUser_address(),user.getUser_changeman(),user.getUser_email(),
				user.getUser_ID()};
		return DBUtil.executeUpdate(sql, params);
	}



	
	

	@Override
	public User findById(int userId) {
		//创建连接
		
		PreparedStatement pstmt= null;
		Connection conn = null;
		ResultSet rs = null;
		//List<User>userList = new ArrayList<User>();
		User user = null;
		try {
			//创建连接
			conn = DBUtil.getConnection();
			//创建sql
			String sql = "SELECT * FROM USER_INFO where user_ID="+userId;
			pstmt  = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			//返回结果集
			while(rs.next()){
				//int userId = Integer.parseInt(rs.getString("user_ID"));
				String userName = rs.getString("user_name");
				String userNum = rs.getString("user_num");
				int userAge = Integer.parseInt(rs.getString("user_age"));
				String  userPw = rs.getString("user_pw");
				String userSex = rs.getString("user_sex");
				String userNation = rs.getString("user_nation");
				String userDiploma = rs.getString("user_diploma");
				String isMarried =rs.getString("is_married");
				int departmentId = Integer.parseInt(rs.getString("department_ID"));
				int roleId = Integer.parseInt(rs.getString("role_ID"));
				String userTel = rs.getString("user_tel");
				String userIntest = rs.getString("user_intest");
				String userBankcard = rs.getString("user_bankcard");
				String  userMobile = rs.getString("user_mobile");
				String userIdnum = rs.getString("user_idnum");
				Date userAddtime = rs.getDate("user_addtime");
				String userAddress = rs.getString("user_address");
				String userAddman = rs.getString("user_addman");
				String userEmail = rs.getString("user_email");
				Date userChangetime = rs.getDate("user_changetime");
				String userChangeman = rs.getString("user_addman");
				String  is_used = rs.getString("is_used");
				//封装
				 user = new User(userId, departmentId, roleId, userName, userSex, userMobile, userAge, userAddress, userNum, userPw, userTel, userIdnum, userEmail, userAddtime, userAddman, userChangetime, userChangeman, userIntest, userDiploma, userBankcard, userNation, isMarried, is_used);
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(rs, pstmt, conn);
		}
		return user;
	}

	
	
	@Override//角色查询带分页方法1
	public int findCount(String role_name, int role_power) {
		Connection conn =DBUtil.getConnection();
		Statement stmt =null;
		ResultSet rs =null;
		int count = 0;
		try {
			stmt =conn.createStatement();
			StringBuffer sql = new StringBuffer("select * from USER_ROLE where 1=1");
			if(role_name != null && !"".equals(role_name)){
				sql.append(" and role_name like '%"+role_name+"%'");
			}
			if(role_power != 0){
				sql.append(" and  role_power ="+role_power);
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
	

	@Override//角色查询带分页方法2
	public List<Role> findRole(int start, int end, String role_name,
			int role_power) {
		Connection conn =DBUtil.getConnection();
		Statement stmt =null;
		ResultSet rs =null;
		List <Role> List = new ArrayList<Role>();
		try {
			stmt =conn.createStatement();
			StringBuffer sql = new StringBuffer("select * from USER_ROLE where 1=1");
			if(role_name != null && !"".equals(role_name)){
				sql.append(" and role_name like '%"+role_name+"%'");
			}
			if(role_power != 0){
				sql.append(" and  role_power ="+role_power);
			}
			sql.append(" order by ROLE_ID desc");
			
			String sql2 = "select  * from (select rownum rn,stu2.* "
					+ "from ( "+sql.toString()+" ) stu2 "
					+ "where rownum <="+end+" ) "
					+ "where rn >"+start;
			rs = stmt.executeQuery(sql2);
			while(rs.next()){
				Role dept = new Role();
				dept.setRole_ID(rs.getInt("role_ID"));
				dept.setRole_name(rs.getString("role_name"));
				dept.setRole_power(rs.getInt("role_power"));
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


