package com.kb.eis.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

public class DBUtil {
	/**
	 * 获取数据库连接
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		// Connection conn = null;
		// String driver ="oracle.jdbc.OracleDriver";
		// String url ="jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		// String user="bjsxt";
		// String password ="bjsxt";
		// try {
		// //加载驱动
		// Class.forName(driver);
		// //（和数据库）建立连接
		// conn = DriverManager.getConnection(url, user, password);
		// } catch (ClassNotFoundException e) {
		// e.printStackTrace();
		// } catch (SQLException e) {
		// e.printStackTrace();
		// }

		 //Connection conn = ConnectPoolFactory.getInstance().getConnect();

		 //Connection conn = ConnectPoolFactory.getInstance().getConnect();


		Connection conn = null;
		try {
			Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
			conn = DriverManager.getConnection("proxool.test");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 关闭数据库资源 PrepraredStataement是Statement的子接口，也可以传入
	 * 
	 * @param rs
	 * @param stmt
	 * @param conn
	 */
	public static void closeAll(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 完成DML操作：insert，update和delete
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public static int executeUpdate(String sql, Object[] params) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int n = 0;
		try {
			// （和数据库）建立连接
			conn = getConnection();
			// （向数据库）发送命令并得到结果
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pstmt.setObject(i + 1, params[i]);
			}
			n = pstmt.executeUpdate();
			// 处理结果
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			closeAll(rs, pstmt, conn);
		}
		// 返回数据
		return n;
	}

	/**
	 * 绑定具体数据
	 * 
	 * @param pstmt
	 * @param obj
	 */
	public static void binding(PreparedStatement pstmt, Object... obj) {
		for (int i = 0; i < obj.length; i++) {
			try {
				// 给预处理发送器绑定具体数据 索引从1开始所以为i+1
				pstmt.setObject(i + 1, obj[i]);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 单表 此方法使用需要注意 实体类如果有数据库对应表没有的数据会报异常 字段名不对 谨慎使用 可以大量的节省代码
	 * 
	 * @param cls
	 * @param r
	 * @return
	 */
	public static <E> List<E> encapsulation(Class<E> cls, ResultSet r) {
		List<E> l = new ArrayList<E>();
		// 通过反射来获取所有成员变量 成员变量名定义时和数据库字段名一样
		Field[] dif = cls.getDeclaredFields();
		try {
			while (r.next()) {
				// 通过反射来创建对象
				E bean = cls.newInstance();
				// 通过对变量数组的遍历来
				for (int i = 0; i < dif.length; i++) {
					// 通过成员变量点getName方法来获取变量名
					String name = dif[i].getName();
					// 通过调用工具类的方法，给反射生成对象的变量赋值
					BeanUtils.setProperty(bean, name, r.getObject(name));
				}
				l.add(bean);
			}
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}
	/**
	 * 封装实体类   只对实体类进行封装 不对rs进行循环   用于多表封装多个实体类 
	 * 用法可以在rs.next循环中来多次调用该方法
	 * @param cls
	 * @param r
	 * @return
	 */
	public static <E> E packaging(Class<E> cls, ResultSet r) {
		// 通过反射来获取所有成员变量 成员变量名定义时和数据库字段名一样
		Field[] dif = cls.getDeclaredFields();
		// 通过反射来创建对象
		E bean = null;
		try {
			bean = cls.newInstance();
			// 通过对变量数组的遍历来
			for (int i = 0; i < dif.length; i++) {
				// 通过成员变量点getName方法来获取变量名
				String name = dif[i].getName();
				// 通过调用工具类的方法，给反射生成对象的变量赋值
				BeanUtils.setProperty(bean, name, r.getObject(name));
			}
		} catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}
}
