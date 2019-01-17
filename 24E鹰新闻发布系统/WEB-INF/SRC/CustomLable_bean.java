package com.v246;
public class CustomLable_bean
{
	protected StringBuffer update=new StringBuffer(100);
	protected String sql;//根据用户所输入的信息完成最基本的SQL语句
	protected String withClass;//所属栏目
	protected StringBuffer insert=new StringBuffer(50);//用于执行执行的SQL语句
	protected Connections connTmp=new Connections();
	protected CustomLable_form custom;
	protected java.sql.Connection conn=null;
	protected java.sql.Statement stm=null;
	protected java.sql.ResultSet rs=null;
	protected String modify;//看看是修改标签还是增加标签
	protected String id;//要修改标签的id
	protected String re="custom";//无用
	protected String lableName;//标签名称
	protected String remark;//标签描述
	protected String hot;//是否热门
	protected String news;//是否最新
	protected String barNumber;//显示多少行
	protected String letterNumber;//每行显示多少字
	protected String isUpdate;//是否显示时间
	protected String isClick;//是否显示点击数
	protected String staticed;//静态显示
	protected String dynamic;//动态显示
	protected void initValue()
	{
		modify=custom.getModify();
		id=custom.getId();
		withClass=custom.getWithClass();
		lableName=Aqu.getGB(custom.getLableName());
		remark=custom.getRemark();
		hot=Aqu.getRadioState(custom.getHotOrNews(),"hot");//判断选中的按钮，如果被选中，则返回1否则返回0
		news=Aqu.getRadioState(custom.getHotOrNews(),"news");
		barNumber=custom.getBarNumber();
		letterNumber=custom.getLetterNumber();
		isUpdate=Aqu.getCheckState(custom.getIsUpdate());
		isClick=Aqu.getCheckState(custom.getIsClick());
		staticed=Aqu.getRadioState(custom.getStaticOrDynamic(),"staticed");
		dynamic=Aqu.getRadioState(custom.getStaticOrDynamic(),"dynamic");
		if(hot.equals("1"))//如果显示的是热门文章
		{
			if(withClass.equals("0"))//如果不限定栏目
			{
				sql="select * from article order by Hits desc";//初始化SQL语句
			}
			else//否则如果不是所有栏目（显示指定栏目）
			{
				sql="select * from article where classID="+withClass+" order by Hits desc";
			}
		}
		else
		{
			if(withClass.equals("0"))
			{
				sql="select * from article order by UpdateTime desc";
			}
			else
			{
				sql="select * from article where classID="+withClass+" order by UpdateTime desc";
			}
		}		
	}
	public String addCustomLable(CustomLable_form custom) throws Exception
	{
		this.custom=custom;//由Action处得到的数据对像存储着用户输入的信息
		initValue();//初始化信息
		insert.append("insert into customLable(Sql,withClass,lableName,IsHot,IsNew,barNumber,letterNumber,isUpdateTime,IsClickNumber,staticed,dynamic,remark) values("+Aqu.addIC(sql)+","+withClass+","+"'{$"+lableName+"$}'"+","+hot+","+news+","+barNumber+","+letterNumber+","+isUpdate+","+isClick+","+staticed+","+dynamic+","+Aqu.addIC(remark)+")");
		update.append("update customLable set Sql="+Aqu.addIC(sql)+",withClass="+withClass+",LableName='{$"+lableName+"$}',IsHot="+hot+",IsNew="+news+",BarNumber="+barNumber+",LetterNumber="+letterNumber+",isUpdateTime="+isUpdate+",IsClickNumber="+isClick+",staticed="+staticed+",dynamic="+dynamic+",remark="+Aqu.addIC(remark)+" where id="+id);
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
		}
		catch(Exception e)
		{
			throw new Exception("Error in CustomLable_bean "+e.getMessage());
		}
		try
		{
			if(modify!=null&&modify.equals("modify"))
			{
				stm.executeUpdate(update.toString());
				re="ok";
			}
			else
			{
				rs=stm.executeQuery("select * from customlable where LableName='{$"+lableName+"$}'");
				if(rs.next())
				{
					
					re="error";//如果数据库中以经存在该标签则返回错误
				}
				else//否则返回ok
				{
					stm.executeUpdate(insert.toString());
					re="ok";
				}

			}
					}
		catch(java.sql.SQLException e)
		{
			throw new java.sql.SQLException("Errore in CustomLable_bean NO.8"+e.getMessage());
		}
		finally
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
		return re;
	}
}