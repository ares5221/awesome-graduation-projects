package com.bjsxt.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

public class Service {
//发送一个数据
	public static void send(PrintWriter pw, String str) {
		pw.println(str);
		pw.flush();
	}
//接受一个数据
	public static String listen(BufferedReader br) {
		String str = null;
		try {
			str = br.readLine();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	
}
