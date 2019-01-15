package TestDbutil;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.kb.eis.dao.impl.RKDaoImpl;
import com.kb.eis.pojo.KhInfo;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.util.DBUtil;

public class Test {
	@org.junit.Test
	public void test() throws Exception {
		String sql = "select * from tab_khinfo";
		Connection conn = DBUtil.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			KhInfo kh = null;
			while(rs.next()){
				kh = DBUtil.packaging(KhInfo.class, rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@org.junit.Test
	public void testRKDao(){
		RKDaoImpl dao = new RKDaoImpl();
		List<Pojo> list = dao.query();
		
	}
}
