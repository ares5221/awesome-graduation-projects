package com.v246;
public class ReplaceAll
{
	public  static String replaceAll(String str1,String str2,String str3)
	{
		StringBuffer strBuf = new StringBuffer(str1);
	    int index=0;
	   // System.out.println("str1==="+str1+"STR2==="+str2+"STR3===="+str3);
		while(str1.indexOf(str2,index)!=-1)//如果在str1中包含有str2
		{
			index=str1.indexOf(str2,index);//记录STR2出现的位置
			strBuf.replace(str1.indexOf(str2,index),str1.indexOf(str2,index)+str2.length(),str3);//替换操作，将str2替换成str3
			index=index+str3.length();//记录替换完后的位置

			 str1=strBuf.toString();
		}
		return strBuf.toString();
	} 
}