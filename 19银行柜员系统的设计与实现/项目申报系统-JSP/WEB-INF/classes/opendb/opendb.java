/* opendb.java  3.30.2003
   Bean to connect database */

package opendb;
import java.sql.*;

public class opendb
{ 
    String strDBDriver="sun.jdbc.odbc.JdbcOdbcDriver";
    String strDBUrl="jdbc:odbc:wgl.dsn";
    private Connection conn=null;
    private Statement stmt=null;
    ResultSet rs=null;
    //<!--注册数据库驱动程序-->
    public opendb()
    {
    	try
    	{
    	    Class.forName(strDBDriver);
    	}
    	//异常处理
    	catch(java.lang.ClassNotFoundException e) 
        {
            System.err.println("opendb():"+e.getMessage());
        }
    }
    //<!--建立数据库连接及定义数据查询-->
    public ResultSet executeQuery(String sql)
    {
        rs=null;
        try
        {
    	    conn=DriverManager.getConnection(strDBUrl,"sa","");//创建数据库连接对象 
            stmt=conn.createStatement();
            rs=stmt.executeQuery(sql);
        }
        catch(SQLException ex) 
        {
    	    System.err.println("aq.executeQuery:"+ex.getMessage());
        }
        return rs;
    }
    //<!--定义数据操作-->
    public void executeUpdate(String sql)
    {
        stmt=null;
        rs=null;
        try
        {
    	    conn=DriverManager.getConnection(strDBUrl,"sa","");
    	    stmt=conn.createStatement();
    	    stmt.executeQuery(sql);
    	    stmt.close();
    	    conn.close();
        }
        catch(SQLException ex)
        {
            System.err.println("aq.executeQuery:"+ex.getMessage());
        }
    }
    //<!--关闭数据库连接-->
    public void closeStmt()
    {
        try
        {
        	stmt.close();
        }
        catch(SQLException e)
        {
    	    e.printStackTrace();
        }
    }
    public void closeConn()
    {
	    try
	    {
		    conn.close();
	    }
	    catch(SQLException e)
	    {
		    e.printStackTrace();
	    }
    }
}