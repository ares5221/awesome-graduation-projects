package com.v246;
public class FormatTimeToArticleName
{
	public static String format(String s) //格式化时间将2005-07-15 23:22:09格式化成20050715232209这种型式
	{
		StringBuffer re=new StringBuffer();
		java.util.StringTokenizer analysis=new java.util.StringTokenizer(s,"- :");
		while(analysis.hasMoreTokens()) //循环输出格式完后返回的数组的内容
		{
			re.append(analysis.nextToken());
		}
		re.append(".html");//将格式化完民后的字符串作化文件名
		return re.toString();//返回格式化完成后的字符串
	}
}