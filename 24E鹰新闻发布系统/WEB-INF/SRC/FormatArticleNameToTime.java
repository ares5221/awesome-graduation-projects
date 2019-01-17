package com.v246;
public class FormatArticleNameToTime
{
	public String format(String name)
	{
		StringBuffer re=new StringBuffer(20);
		re.append(name.substring(0,4));
		re.append("-");
		re.append(name.substring(4,6));
		re.append("-");
		re.append(name.substring(6,8));
		re.append(" ");
		re.append(name.substring(8,10));
		re.append(":");
		re.append(name.substring(10,12));
		re.append(":");
		re.append(name.substring(12,14));
		return re.toString();
	}
	public static void main(String[] args)
	{
		FormatArticleNameToTime f=new FormatArticleNameToTime();
		System.out.println(f.format("20050423172359"));
	}
}