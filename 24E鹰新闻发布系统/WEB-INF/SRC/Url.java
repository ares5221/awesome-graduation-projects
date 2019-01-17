package com.v246;
public class Url
{
	public static String getUrl()
	{
		String url=null;
		Connections connTmp=new Connections();
		try
		{
			url=Aqu.getUrl(connTmp.getConnection(),"config","url");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return url;
	}
}