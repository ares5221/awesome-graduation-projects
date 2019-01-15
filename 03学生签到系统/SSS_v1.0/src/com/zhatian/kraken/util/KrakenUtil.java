package com.zhatian.kraken.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class KrakenUtil {
	
	
	
	
	
	public static String getHostPath() throws IOException{
		File file = new File("resource/server.properties");// 参数是文件路径；
		InputStream is = null;
		String path = null;
		try {
			is = new FileInputStream(file);
			Properties p = new Properties();// 创建资源文件对象；
			p.load(is);// 加载资源文件
			path = p.getProperty("serverPath");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// 建立此文件的输入流；
		
		return path;
		// getProperty()的参数是资源文件中的key值，可以输入“apple”，“orange”,“banana”,”carrot”.
	}
}
