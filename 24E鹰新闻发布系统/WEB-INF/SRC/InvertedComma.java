package com.v246;
/*
 *本类用于在字符串前后两端加单引号，以便以后往数据库里插入
 **/
public class InvertedComma
{
	String inverted_string=new String("'");
	String getIC(String s)
	{
		inverted_string="'"+s+"'";
		if(inverted_string==null||inverted_string.equals("''"))
		{
			inverted_string=new String("'0'");
		}
		else if(inverted_string.equals("'yes'"))
		{
			inverted_string=new String("'1'");
		}
		return inverted_string;
	}
}