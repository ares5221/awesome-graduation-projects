package com.sxt.util;

import java.io.File;

/**
 * 获得随机头像
 * @author gabriel
 *
 */
public class HeadImage {
public static String getRandomHead(){
	File file=new File("res/headimg");
	File[] files=file.listFiles();
	return files[(int)(Math.random()*files.length)].getName();
}
public static File[] getAllHead(){
	File file=new File("res/headimg");
	File[] files=file.listFiles();
	return files;
}

}
