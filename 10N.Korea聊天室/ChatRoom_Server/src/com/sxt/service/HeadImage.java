package com.sxt.service;

import java.io.File;
/**
 * 随机获得头像类
 * @author gabriel
 *
 */
public class HeadImage {
	/*
	 * 随机获得头像
	 */
public static String getRandomHead(){
	File file=new File("res/headimg");
	File[] files=file.listFiles();
	return files[(int)(Math.random()*files.length)].getName();
}
/*
 * 得到所有头像
 */
public static File[] getAllHead(){
	File file=new File("res/headimg");
	File[] files=file.listFiles();
	return files;
}

}