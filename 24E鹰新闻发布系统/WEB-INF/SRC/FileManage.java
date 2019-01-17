package com.v246;
/*
 *本类用于删除指定文件，或指定目录(会删除该目录下所有文件和文件夹),本方法为毁灭性操作,无法恢复,请慎用
 **/
public class FileManage
{
	public void deleteFile(String s)
	{
		try
		{
			java.io.File f=new java.io.File(s);
			if(f.exists())
			{
				if(f.isDirectory())//如果是文件夹的话
				{
					java.io.File[] str=f.listFiles();//获取该文件夹下面所有文件的名子
					for(int i=0;i<str.length;i++)//遍历该文件夹下面所有文件及文件夹
					{
						if(str[i].isDirectory())//如果是文件夹的话
						{
							deleteFile(str[i].toString());//递归调用
						}
						else
						{
							str[i].delete();//如果不是文件夹的话,则将其删除
						}	
					}
					f.delete();//最后将该目录也删除
				}
				else
				{
					f.delete();
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void main(String[] args)
	{
		FileManage fm=new FileManage();
		fm.deleteFile("d:\\mmm");
	}
}