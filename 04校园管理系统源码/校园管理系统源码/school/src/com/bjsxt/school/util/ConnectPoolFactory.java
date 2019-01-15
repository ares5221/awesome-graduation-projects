package com.bjsxt.school.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import org.logicalcobwebs.proxool.configuration.PropertyConfigurator;

public class ConnectPoolFactory {

	private static ConnectPoolFactory connectPoolFactory = null;

	private ConnectPoolFactory() {// 构造方法
		init();
	}

	public void init() {// 把properties文件加载到链接对象
		InputStream is = ConnectPoolFactory.class
				.getResourceAsStream("/proxool.properties");
		Properties properties = new Properties();
		try {
			properties.load(is);
			PropertyConfigurator.configure(properties);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static ConnectPoolFactory getInstance() {// 单例
		if (null == connectPoolFactory) {
			connectPoolFactory = new ConnectPoolFactory();
		}

		return connectPoolFactory;
	}

	public Connection getConnect() {
		Connection conn = null;
		try {
			Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
			conn = DriverManager.getConnection("proxool.test");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

}
