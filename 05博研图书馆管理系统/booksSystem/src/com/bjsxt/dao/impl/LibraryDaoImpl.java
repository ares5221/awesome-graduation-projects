package com.bjsxt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;














import com.bjsxt.dao.LibraryDao;
import com.bjsxt.entity.BookBaseInfo;
import com.bjsxt.entity.Library;
import com.bjsxt.util.BjsxtJdbc;

public class LibraryDaoImpl implements LibraryDao{
	//查询图书管信息
	@Override
	public Library findLibrary() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		List<BookBaseInfo> list=new ArrayList<>();
		ResultSet rest =null;
		Library library=null;
		 try {
			 conn= BjsxtJdbc.getConnection();
			 String sql="select*from tb_library ";
			 pstmt = BjsxtJdbc.getPreparedStatement(conn,sql);
			rest= pstmt.executeQuery();
			while(rest.next()){
				int lid=rest.getInt("lid");
				String name=rest.getString("name");
				String liber=rest.getString("liber");
				String tel=rest.getString("tel");
				String addr=rest.getString("addr");
				String email=rest.getString("email");
				String url=rest.getString("url");
				Date creatdate=rest.getDate("creatdate");
				String intro=rest.getString("intro");
				library=new Library(lid, name, liber, tel, addr, email, url, creatdate, intro);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return library;
	}

	@Override
	public int modifyLibrary(Library l) {
		String sql="update tb_library set name=?,liber=? ,tel=?,addr=?,email=?,url=?,creatdate=?,intro=? where lid=? ";
		Object[]objs={l.getName(),l.getLiber(),l.getTel(),l.getAddr(),l.getEmail(),l.getUrl(),l.getCreatdate(),l.getIntro(),l.getLid()};
		return BjsxtJdbc.excuteDML(sql, objs);
	}

}
