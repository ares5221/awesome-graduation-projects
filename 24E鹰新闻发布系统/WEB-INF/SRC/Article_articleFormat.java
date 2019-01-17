package com.v246;
public class Article_articleFormat
{
	protected CustomLableFormat customFormat=new CustomLableFormat();
	protected String url=null; //存储网站的安装目录
	protected StringBuffer navigationScript=new StringBuffer(200); //用于存储网站导航的javaScript代码
	protected ArticleNonceLocation loca=new ArticleNonceLocation();//存储当前位置
	protected WriteHtml writeHtml=new WriteHtml();//生成HTML
	protected java.sql.Connection conn;
	protected java.sql.Statement stm=null;
	protected java.sql.ResultSet rs=null;
	protected Connections connTmp=new Connections();
	protected String navigation="{$navigation$}";
	protected String nonceLocation="{$nonceLocation$}";//当前位置
	protected String title="{$title$}";//简短标题：
	protected String titleIntact="{$titleIntact$}";//完整标题：
	protected String subheading="{$subheading$}";//副 标 题
	protected String author="{$author$}";//文章作者
	protected String copyFrom="{$copyFrom$}";//文章来源
	//protected String intro="{$intro$}";//文章简介
	protected String content="{$content$}";//文章内容
	protected String updateTime="{$updateTime$}";//录入时间
	protected String click="{$click$}";//点击数
	protected String clickScript=null;
	protected Article_addArticle article;
	protected String template;
	protected ReplaceAll replaceAll=new ReplaceAll();
	public void getTemplate()throws Exception //连接数据库，读取模板内容
	{

		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
			rs=stm.executeQuery("select * from template where WithType='10' and IsDefault='1'");
		}
		catch(Exception e2)
		{
			throw new Exception("Error in Article_articleFormat.class NO.5 "+e2.getMessage());
		}
		try
		{
			rs.next();
			template=rs.getString("Content");
		}
		catch(Exception e3)
		{
			throw new Exception("Error in Article_articleFormat.class NO.4 "+e3.getMessage());
		}
		finally
		{
			
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
		//System.out.println("++++++++++++++++++++++++++++++++++++++++++"+template);

	}
	protected void initNavigationScript()throws Exception
	{
		try
		{
			url=Aqu.getUrl(connTmp.getConnection(),"config","url");
		}
		catch(Exception e)
		{
			throw new Exception("Error in Article_articleFormat.java NO.3 "+e.getMessage());
		}
		navigationScript.append("<script language='JavaScript' type='text/JavaScript' src='"+url+"/Article/js/menu.js'></script> <script type='text/javascript' language='JavaScript1.2' src='"+url+"/Article/js/stm31.js'></script> <script language='JavaScript1.2' type='text/JavaScript' src='"+url+"/Article/js/ShowClass_Menu.js'></script>");
	}
	protected void format() throws Exception//格式化操作，将标签替换成它代表的真实内容
	{
		String custom[][]=null;
		try
		{
			custom=customFormat.lableFormat();
		}
		catch(Exception e)
		{
			throw new Exception("Error in Article_articleFormat.java NO.2 "+e.getMessage());
		}
		for(int i=0;i<custom.length;i++)
		{
			template=replaceAll.replaceAll(template,custom[i][0],custom[i][1]);
		}
		initNavigationScript();
		template=replaceAll.replaceAll(template,click,clickScript);
		template=replaceAll.replaceAll(template,navigation,navigationScript.toString());
		template=replaceAll.replaceAll(template,title,article.getTitle());
		template=replaceAll.replaceAll(template,titleIntact,article.getTitleIntact());
		template=replaceAll.replaceAll(template,subheading,article.getSubheading());
		template=replaceAll.replaceAll(template,author,article.getAuthor());
		template=replaceAll.replaceAll(template,copyFrom,article.getCopyFrom());
		
		template=replaceAll.replaceAll(template,updateTime,article.getUpdateTime());
		template=replaceAll.replaceAll(template,nonceLocation,loca.getLocation(article.getClassID()));
		template=replaceAll.replaceAll(template,content,article.getContent());
	}
	private String getID() throws Exception
	{
		String re=null;
		java.sql.Connection conn1=null;
		java.sql.Statement stm1=null;
		java.sql.ResultSet rs1=null;
		try
		{			
			conn1=connTmp.getConnection();
			stm1=conn1.createStatement();
			rs1=stm1.executeQuery("select * from Article where UpdateTime='"+article.getUpdateTime()+"'");
			if(rs1.next())
			{
				re=String.valueOf(rs1.getInt("ArticleID"));
			}
			else
			{
				re=null;
			}
			
		}
		catch(Exception e)
		{
			throw new Exception("Error in Article_articleFormat.java NO.1 "+e.getMessage());
		}
		finally
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
			
		}
		return re;
		
	}
	

	public void addArticle(Article_addArticle article)throws Exception
	{
		
		StringBuffer classPath=new StringBuffer(); 
		FullClassDir classDir=new FullClassDir(); //初始化栏目路径对象
		classPath.append("\\Article");//文件目录
		classPath.append(classDir.getClassDir(Integer.parseInt(article.getClassID())));//得到指定ID的栏目的总目录(因为有可以有有父亲栏目的）
		String tmpUpdateTime=article.getUpdateTime();//得到文章添加时间
		this.article=article;
		getTemplate();//得到模板
		clickScript="<script src='"+Aqu.getUrl(connTmp.getConnection(),"config","url")+"/showClickNumber.jsp?id="+getID()+"'></script>";
		format();//开始格式化模板（将标签替换成它代表的实际内容
		tmpUpdateTime=FormatTimeToArticleName.format(tmpUpdateTime);//以时间初始化要生成的文件名
		classPath.append("\\"+tmpUpdateTime.subSequence(0,4)+"\\"+tmpUpdateTime.subSequence(4,6));//得到年（2005）分年存储，一年存一个目录
		writeHtml.save(template,classPath.toString(),tmpUpdateTime);//开始生成HTML,classpath就是最要存储的位置及文件名
	}





}