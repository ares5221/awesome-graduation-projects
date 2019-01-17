package com.v246;
/*
 *无级分类，数据库(MYSQL)建表如下:
 *create table class(Id int(10) not null auto_increment,ParentID int(10) not null,Title varchar(255) not null,ClassDir varchar(255),Flag bit default 0,ChildNum int(10),Target varchar(255),PRIMARY KEY(Id));
 *
 **/
public class NoLevelSort
{
	protected java.util.Collection coll=new java.util.ArrayList();
	private StringAnalysis ana=new StringAnalysis();
	public String[] reTitle;
	public String[] reId;
	private String title="";//用于存储分完类之后的栏目名称,以xxxx##   yyyyyy##    ddddd型式存储,用的时候要用StrngToKen分析出来,然后输出即可得到
	private String id="";//用于存似无级分类相应栏目名称的ID,存储形似同TITLE
	private String [] re=new String[2];//最后的TITLE和ID要存信到这个数组中,以便返回
	private String [][] rows=null;//一具二维数组,里面存储了所有行和列的值
	private String rowCount=null;//得到数据的总行数
	public NoLevelSort()throws Exception
	{
		try
		{
			this.getNoLevelSort();
		}
		catch(Exception e0)
		{
			throw new Exception("Error in NoLevelSort.class 22! "+e0.getMessage());
		}
		for(int i=0;i<reTitle.length;i++)
		{
			coll.add(new NoLevelSortValues(reTitle[i],reId[i]));
		}
	}
	public java.util.Collection getColl()
	{
		return coll;
	}
	public void getNoLevelSort()throws Exception//开始无级分类的分析
	{
		Connections connTmp=new Connections();
		AquGetRows aquGetRows=new AquGetRows();//这个就是用来返回以指定名称的表的所有行和列的值的类
		try
		{
 			rows=aquGetRows.getRows(connTmp.getConnection(),"class");//这是类中的方法,调用方法后就得到了一个存储指定表所有行和列的二维数组,参数(Connection,String(tableName)

		}
		catch(Exception e)
		{
			throw new Exception("error in NoLevelSort.class 43! "+e.getMessage());
		}
		rowCount=String.valueOf(aquGetRows.getRowsCount());//得到数据表部行数(一共有多少条记录)
		this.CheckList("0",rowCount,"");//开始要析取得的数据,形成无级分类
	//	re[0]=title;//存储到一维数组以后返回给用户
	//	re[1]=id;
	//	return re;
		reTitle=ana.startAnalysis(title,"##");
		reId=ana.startAnalysis(id,"##");
	}
	public String[] getTitle()
	{
		return reTitle;
	}
	public String[] getId()
	{
		return reId;
	}
	public void CheckList(String ParentID,String cs,String Str1)//参数说明,ParentID:父级栏目ID(谁是它老爸),cs:数据库中的总记录(行数),Str1:父类间隔
	{
		int i=0;//循环用
		int j=0;//结束递归用
		int Cs=Integer.parseInt(cs);//将字符串转换成数字类型
		String Str2;
     	for (i=0;i<Integer.parseInt(rowCount);i++)//遍历数据库所有记录
     	{
     		
           	if(rows[1][i].equals(ParentID))//如果当前记录ID为父类ID
       	    {                  
            	//Response.write(Str1)
                if (j<Cs-1) //如果下面还有记录,也就是说还有兄弟节点
                	Str2="├";
                else       //如果该ID没有兄弟结点,它是最后一个
                    Str2="└";
                title=title+"##"+Str1+Str2+rows[2][i]; //记录到Title内
            //    System.out.println(title);
				id=id+"##"+rows[0][i];//将当前ID记录到ID内
                if (rows[4][i].equals("true")) //如果该示记为真,也就是说该栏目下面还有子栏目的话
                {
                	if (j<Cs-1) //如果该节点不是最后一个,也就是说没有完成所有遍历
                    	CheckList(rows[0][i],rows[5][i],Str1+"┆");//那么以该结点的ID加上该节点的字女数进行递归并加上|表记,
                    else 
                       	CheckList(rows[0][i],rows[5][i],Str1+"　  ");//关键所在,递归调用 //否则,也就是该结是新节点,重新对该节点进行遍历
            	}
             	j=j+1;//每完成一次遍历,J的值加一,直到完成所有记录的遍历
           	}
     	}
    }
    public static void main(String []args)
    {
    	String[] aqu=null;
    	String[] aqu1=null;
    	NoLevelSort sort=null;
    	try
    	{
    		sort=new NoLevelSort();
//    		aqu1=sort.getNoLevelSort();
    	}
    	catch(Exception e)
    	{
    		
    	}
    	StringAnalysis ana=new StringAnalysis();
	//	System.out.println(aqu1[0]);
		aqu=sort.getTitle();
		for(int y=0;y<aqu.length;y++)
		{
			System.out.println(aqu[y]);
		}
		aqu=sort.getId();
		for(int y=0;y<aqu.length;y++)
		{
			System.out.println(aqu[y]);
		}
    }
}