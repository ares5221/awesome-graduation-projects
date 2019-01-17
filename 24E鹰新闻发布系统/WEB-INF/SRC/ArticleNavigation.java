package com.v246;
public class ArticleNavigation
{
	int x,a,b,c,d;//标记用变量
	String url=null;//网站域名
	FullClassDir fullDir=new FullClassDir();//指定ID的全路径/Article/abc/dir
	AquGetRows getRows=new AquGetRows();//用于得到记录集的类
	String rows[][]=null;//用于存储getRows 返回的记录集是个二维数组
	java.sql.Connection conn=null;
	Connections connTmp=new Connections();
	StringBuffer okString=new StringBuffer(1024);//用于存储最终字符串
	public ArticleNavigation()//作必要的初始化
	{
		x=0;//只能执行一次stm_bp('p1',[1,4,0,0,2,3,6,7,100,'pr动作
		a=0;//看看是不是弟一条一级分类栏目
		b=1;//JS文件中用于区分上下级用地
		c=0;//看看是滞是getString()方法第一次调用findChild()方法
		d=0;//确保一级分类下面只有一个栏目时菜单样式也是下拉式的，而不是右拉式的！标记型变量
		getUrl();
		okString.append("stm_bm(['uueoehr',400,'','/images/blank.gif',0,'','',0,0,0,0,0,1,0,0]);\n stm_bp('p0',[0,4,0,0,2,2,0,0,100,'',-2,'',-2,90,0,0,'#000000','transparent','',3,0,0,'#000000']);stm_ai('p0i0',[0,'|','','',-1,-1,0,'','_self','','','','',0,0,0,'','',0,0,0,0,1,'#f1f2ee',1,'#cccccc',1,'','',3,3,0,0,'#fffff7','#000000','#000000','#000000','9pt 宋体','9pt 宋体',0,0]);\n stm_aix('p0i1','p0i0',[0,'首页','','',-1,-1,0,'"+url+"/index.html','_self','"+url+"/Index.html','','','',0,0,0,'','',0,0,0,0,1,'#f1f2ee',1,'#cccccc',1,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体','9pt 宋体']);\n stm_aix('p0i2','p0i0',[0,'|','','',-1,-1,0,'','_self','','','','',0,0,0,'','',0,0,0,0,1,'#f1f2ee',1,'#cccccc',1,'','',3,3,0,0,'#fffff7','#000000','#000000','#000000','9pt 宋体','9pt 宋体',0,0]);");
	}
	protected  void getUrl()
	{
		try
		{
			url=Aqu.getUrl(connTmp.getConnection(),"config","url");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	private void getOkString()
	{
		try
		{
			rows=getRows.getRows(connTmp.getConnection(),"class");//得到class表的记录集
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		for(int i=0;i<rows[0].length;i++)
		{
		//	System.out.println(i);
			if(rows[1][i].equals("0"))//查找根栏目，也就是一级分类
			{
				try
				{			
					if(a==0&&rows[4][i].equals("true"))//如果是头一条记录的话，则不加|标志，如果前沿一条记录就有下级栏目的话，就得加上stm_bp('p1',[1,4,0,0,2,3,6,7,100,'pr动作
					{				
						okString.append("stm_aix('p0i"+rows[0][i]+"','p0i0',[0,'"+rows[2][i]+"','','',-1,-1,0,'"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','_self','"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','','','',0,0,0,'/images/arrow_r.gif','/images/arrow_w.gif',0,0,0,0,1,'#f1f2ee',1,'#cccccc',1,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体','9pt 宋体']);\r"+"stm_bp('p"+b+"',[1,4,0,0,2,3,6,7,100,'progid:DXImageTransform.Microsoft.Fade(overlap=.5,enabled=0,Duration=0.43)',-2,'',-2,67,2,3,'#999999','#ffffff','',3,1,1,'#aca899']);\n");
						x++;//确保只进行了一次stm_bp('p1',[1,4,0,0,2,3,6,7,100,'pr动作
						
						//System.out.println("====================="+a);
					}
					else if(a==0&&rows[4][i].equals("false"))
					{
						okString.append("stm_aix('p0i"+rows[0][i]+"','p0i0',[0,'"+rows[2][i]+"','','',-1,-1,0,'"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','','','','','',0,0,0,'','',0,0,0,0,1,'#f1f2ee',1,'#cccccc',1,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体','9pt 宋体']);\r");
					}
					else if(rows[4][i].equals("false"))//如果不是第一条记录，则在春最后加|
					{
						okString.append("stm_aix('p0i2','p0i0',[0,'|','','',-1,-1,0,'','_self','','','','',0,0,0,'/images/arrow_r.gif','/images/arrow_w.gif',0,0,0,0,1,'#f1f2ee',1,'#cccccc',1,'','',3,3,0,0,'#fffff7','#000000','#000000','#000000','9pt 宋体','9pt 宋体',0,0]);\r"+"stm_aix('p0i"+rows[0][i]+"','p0i0',[0,'"+rows[2][i]+"','','',-1,-1,0,'"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','','','','','',0,0,0,'','',0,0,0,0,1,'#f1f2ee',1,'#cccccc',1,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体','9pt 宋体']);\r");
					}
					else if(x==0&&rows[4][i].equals("true"))
					{
						okString.append("stm_aix('p0i2','p0i0',[0,'|','','',-1,-1,0,'','_self','','','','',0,0,0,'/images/arrow_r.gif','/images/arrow_w.gif',0,0,0,0,1,'#f1f2ee',1,'#cccccc',1,'','',3,3,0,0,'#fffff7','#000000','#000000','#000000','9pt 宋体','9pt 宋体',0,0]);\r"+"stm_aix('p0i"+rows[0][i]+"','p0i0',[0,'"+rows[2][i]+"','','',-1,-1,0,'"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','_self','"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','','','',0,0,0,'/images/arrow_r.gif','/images/arrow_w.gif',0,0,0,0,1,'#f1f2ee',1,'#cccccc',1,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体','9pt 宋体']);\r"+"stm_bp('p"+b+"',[1,4,0,0,2,3,6,7,100,'progid:DXImageTransform.Microsoft.Fade(overlap=.5,enabled=0,Duration=0.43)',-2,'',-2,67,2,3,'#999999','#ffffff','',3,1,1,'#aca899']);\n");
						x++;
					}

					if(i==rows[0].length-1)
					{
						okString.append("stm_aix('p0i2','p0i0',[0,'|','','',-1,-1,0,'','_self','','','','',0,0,0,'/images/arrow_r.gif','/images/arrow_w.gif',0,0,0,0,1,'#f1f2ee',1,'#cccccc',1,'','',3,3,0,0,'#fffff7','#000000','#000000','#000000','9pt 宋体','9pt 宋体',0,0]);\r");
					}
					a++;//a自加后，代表不是头一条记录
					//System.out.println(a);
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				if(rows[4][i].equals("true"))//如果该记录有下级记录的话
				{
					
					findChild(rows[0][i]);//对其下级记录进行操作

					c=1;//使C=1因为它现在以经没有用了，避免重复添加记录或添加错误记录，
					d=0;//使D==0因为后面还要用到

				}
			}
		}
		okString.append("stm_em();");//添加结束标志
	}
	public void findChild(String id)
	{
		
		
		for(int i=0;i<rows[0].length;i++)
		{
	
			if(rows[1][i].equals(id)&&rows[4][i].equals("false"))//如果当前记录的父亲ID正好是id的而该记录又没有下级记录的话
			{
				int tmp=0;//标记型变量，因为本IF中只能执行一次okString的添加动作，执行多了会重复
				try
				{
					for(int x=0;x<i;x++)//查找该记录之前的记录，看看该记录有没有同级记录（兄弟记录）
					{
						
						if(rows[1][x].equals(id)&&tmp==0)//如果有同级记录，就不能添加(p2,p1)字样
						{
							okString.append("stm_aix('p"+(b+1)+"i0','p0i0',[0,'"+rows[2][i]+"','','',-1,-1,0,'"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','_blank','"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','"+rows[2][i]+"','','',3,0,0,'','',0,0,0,0,1,'#f1f2ee',1,'#cccccc',0,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体']);\r");
							tmp++;
						//	System.out.println("8888888888888888888888888888888888888888888888"+rows[2][i]);
							
						}
						else if(d==0&&tmp==0&&x==i-1&&c!=0)//如果该一级分类下面只有一个栏目则[1,4,0,0,2,3,6]确保菜单样式是下拉式地
						{
							okString.append("stm_bpx('p"+(b+1)+"','p"+b+"',[1,4,0,0,2,3,6]);"+"stm_aix('p"+(b+1)+"i0','p0i0',[0,'"+rows[2][i]+"','','',-1,-1,0,'"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','_blank','"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','"+rows[2][i]+"','','',3,0,0,'','',0,0,0,0,1,'#f1f2ee',1,'#cccccc',0,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体']);\r");
							b++;
							d++;
						}
						else if(tmp==0&&x==i-1&&c!=0)//如果没有查找到该记录的同级记录的话，就必须加上(p2,p1)字样
						{
							okString.append("stm_bpx('p"+(b+1)+"','p"+b+"',[1,2,-2,-3,2,3,0]);"+"stm_aix('p"+(b+1)+"i0','p0i0',[0,'"+rows[2][i]+"','','',-1,-1,0,'"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','_blank','"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','"+rows[2][i]+"','','',3,0,0,'','',0,0,0,0,1,'#f1f2ee',1,'#cccccc',0,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体']);\r");
							b++;
						}
						else if(tmp==0&&x==i-1&&c==0)
						{
							okString.append("stm_aix('p"+(b+1)+"i0','p0i0',[0,'"+rows[2][i]+"','','',-1,-1,0,'"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','_blank','"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','"+rows[2][i]+"','','',3,0,0,'','',0,0,0,0,1,'#f1f2ee',1,'#cccccc',0,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体']);\r");
							tmp++;
						}
					}
					
					
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				
				
			}
			else if(rows[1][i].equals(id)&&rows[4][i].equals("true"))//否则如果该记录有下级（孩子）的话
			{
				int tmp=0;//标记型变量，因为在本IF中只能执行一次okString的添加动作，如果执行多了，就会重复				
				try
				{		

					for(int x=0;x<i;x++)//查找该记录前看看是否还有同级记录（兄弟）
					{
						
						if(rows[1][x].equals(id)&&tmp==0)//如果有同级记录的话就不能添加(p2,p1)字样
						{
							okString.append("stm_aix('p"+(b+1)+"i0','p0i0',[0,'"+rows[2][i]+"','','',-1,-1,0,'"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','_blank','"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','"+rows[2][i]+"','','',6,0,0,'/images/arrow_r.gif','/images/arrow_w.gif',7,7,0,0,1,'#f1f2ee',1,'#cccccc',0,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体']);\r");
							tmp++;
							
						}
						else if(c==0&&x==i-1)//如果是getOkstring()的第一次调用本方法(findChild)（也就是该记录是最靠近stm_bp('p1',[1,4,0,0,2　。。。。的）该记录如果加上(p2,p1)字样会倒至js文件不能被正确的执行
						{
							okString.append("stm_aix('p"+(b+1)+"i0','p0i0',[0,'"+rows[2][i]+"','','',-1,-1,0,'"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','_blank','"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','"+rows[2][i]+"','','',0,0,0,'/images/arrow_r.gif','/images/arrow_w.gif',7,7,0,0,1,'#f1f2ee',1,'#cccccc',0,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体']);\r");
							d++;//类为只有一个一级栏目时菜单样式会自动为下拉式的所以d要++
						}
						else if(d==0&&tmp==0&&x==i-1)//确保该一级分类下面只有一个栏目时菜单样式为下拉式的
						{
							okString.append("stm_bpx('p"+(b+1)+"','p"+b+"',[1,4,0,0,2,3,6]);"+"stm_aix('p"+(b+1)+"i0','p0i0',[0,'"+rows[2][i]+"','','',-1,-1,0,'"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','_blank','"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','"+rows[2][i]+"','','',3,0,0,'/images/arrow_r.gif','/images/arrow_w.gif',0,0,0,0,1,'#f1f2ee',1,'#cccccc',0,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体']);\r");
							b++;
							d++;
						}
						else if(tmp==0&&x==i-1)//如果是最后一条记录，而且tmp为0也就是没找到同级记录的话，就必须加上(p2,p1)字样
						{
							okString.append("stm_bpx('p"+(b+1)+"','p"+b+"',[1,2,-2,-3,2,3,0]);"+"stm_aix('p"+(b+1)+"i0','p0i0',[0,'"+rows[2][i]+"','','',-1,-1,0,'"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','_blank','"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]),"/")+"/index.html','"+rows[2][i]+"','','',6,0,0,'/images/arrow_r.gif','/images/arrow_w.gif',7,7,0,0,1,'#f1f2ee',1,'#cccccc',0,'','',3,3,0,0,'#fffff7','#ff0000','#000000','#cc0000','9pt 宋体']);\r");
							b++;
						}
					}
				c=1;//避免由于C的值没变，而使记录重复,因为C的值一变就不是第一次执行本方法了
				findChild(rows[0][i]);//进行递归遍历所有栏目
				
				
				}
				catch(Exception e)		
				{
					e.printStackTrace();
				}
				
				
			
			}
			if(i>=rows[0].length-1)//如果以经行完了该次循环
			{
			
				okString.append("stm_ep();\r");//用于JS中返回上级菜单以便进行工作
			}
		}
	}
	public void write()
	{
		getOkString();
		WriteHtml writeHtml=new WriteHtml();
		writeHtml.save(okString.toString(),"/Article/js","ShowClass_Menu.js");//生成JS文件
	}
	public static void main(String []args)
	{
		ArticleNavigation navigation=new ArticleNavigation();
		navigation.write();
	}
}