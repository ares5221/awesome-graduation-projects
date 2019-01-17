package com.v246;
public class StringAnalysis
{
	public String[] startAnalysis(String str,String s)
	{
		int i=0;
		java.util.StringTokenizer analysis=new java.util.StringTokenizer(str,s);
		String[] re=new String[analysis.countTokens()];
		while(analysis.hasMoreTokens())
		{
			re[i]=analysis.nextToken();
			i++;
		}
		return re;
	}
	public String[] startAnalysis(String str)
	{
		int i=0;
		java.util.StringTokenizer analysis=new java.util.StringTokenizer(str);
		String[] re=new String[analysis.countTokens()];
		while(analysis.hasMoreTokens())
		{
			re[i]=analysis.nextToken();
			i++;
		}
		return re;
	}
	public static void main(String[] args)
	{
		StringAnalysis aqu=new StringAnalysis();
		String a="ø®∫≈:29489248439##√‹¬Î:938492384";
		String[] b;
		b=aqu.startAnalysis(a,"##");
		for(int i=0;i<b.length;i++)
		{
			System.out.println(b[i]);
		}
		
	}
}