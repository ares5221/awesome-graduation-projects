package com.v246;
public class GB
{
	public String getGB(String str)
	{
		try
		{
			byte array[]=str.getBytes("ISO-8859-1");
			str=new String(array);
		}
		catch(Exception e)
		{
		}
		return str;
	}
	public static String getU(String str)
	{
		try
		{
			byte array[]=str.getBytes("UNICODE");
			str=new String(array);
		}
		catch(Exception e)
		{
			
		}
		return str;
	}
	public static void main(String args[])
	{
		System.out.print(getU("'"));
	}
}