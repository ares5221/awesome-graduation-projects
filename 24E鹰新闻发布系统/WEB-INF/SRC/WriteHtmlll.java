package com.v246;

import java.io.*;

public class WriteHtmlll 
{

	public WriteHtmlll() 
	{
	}

	public static String save(String s, String s1, String s2) throws Exception//完整的HTML内容，s1:目录（栏目),s2:文件名

	{
		String a="1024";
	//	a=System.getProperty("file.separator");
		
		
		Path path=new Path();
		try
		{
			a=path.getPathFromClass(Path.class); //得到Path.class类的全路径
		}
		catch(Exception e)
		{
			throw new Exception(e.getMessage());
		}
		StringBuffer str=new StringBuffer(a);
		str.replace(a.indexOf("\\WEB-INF\\classes"),a.length(),"");//得到虚拟空间上的网站路径
		str.append(s1+"\\");//在后面加上\
		s1=str.toString();//转换成字符串型
		try 
		{
			a(s1);//看看有没有指定的目录，如果没有，则建一个！
			FileOutputStream fileoutputstream = new FileOutputStream(s1 + s2);//建立文件
			byte abyte0[] = s.getBytes();//将字符串型的数据转换成BYTE型的
			fileoutputstream.write(abyte0);//将刚刚转换完成的BYTE数组写入到文件中
			fileoutputstream.close();//关闭文件流
			//System.out.println(s1+s2);
		} 
		catch (IOException e)
		{
			System.out.println("write html error" + e.getMessage());
			throw new Exception(e.getMessage());
		}
		a=a+"#########"+s1;
		return a;
	}

	private static void a(String s) 
	{
		try 
		{
			File file = new File(s); //建立文件
			if (!file.exists())//如果没有指定目录
				file.mkdirs();//建一个
		} 
		catch (Exception e) 
		{
			System.out.println("mkdirs error!" + e.getMessage());
		}
	}
	public static void main(String []args)
	{
		String a;
		a=System.getProperty("file.separator");
		
		
		Path path=new Path();
		try
		{
			a=path.getPathFromClass(Path.class);
		}
		catch(Exception e)
		{
			
		}
		StringBuffer str=new StringBuffer(a);
		str.replace(a.indexOf("\\WEB-INF\\classes"),a.length(),"");
		System.out.println(str);
	}
}