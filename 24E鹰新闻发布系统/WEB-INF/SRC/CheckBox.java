package com.v246;
/*
 *本类用于判断复选框的选中状态，如果为选中状态则返回1否则返回0
 **/
public class CheckBox
{
	String tmp;
	public String getValue(String checkBox)
	{
			if(checkBox!=null&&checkBox.equals("Yes"))
			{
				tmp=new String("'1'");
			}
			else
			{
				tmp=new String("'0'");
			}

			return tmp;
	}
}