package com.bjsxt.crm.listener;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

/**
 * 记录每个请求的时间，客户端IP，URL地址到日志文件中
 * @author Administrator
 * 
 *<listener>
  	<listener-class>com.bjsxt.sscs.listener.LogListener</listener-class>
  </listener>
 *
 */
public class LogListener implements ServletRequestListener{

	@Override
	public void requestDestroyed(ServletRequestEvent arg0) {
		
	}

	@Override
	public void requestInitialized(ServletRequestEvent srevent) {
		//1.获取当前请求的时间，客户端IP，URL地址
		//时间
		Date now = new Date();
		//客户端IP
		ServletRequest request = srevent.getServletRequest();
		String ip = request.getRemoteAddr();
		//URL地址
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		String url = httpRequest.getRequestURL().toString(); // ?method=show
		String qs = httpRequest.getQueryString();
		if(qs!=null){
			url = url +"?"+ qs;
		}
		//2.记录当前请求的时间，客户端IP，URL地址到日志文件中
		PrintWriter out = null;
		try {
			//out =  new PrintWriter("d:/bjsxt.txt");
			out = new PrintWriter(new FileOutputStream(new File("crm.txt"), true));
			out.println(now+"  "+ip+"  "+url);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			out.close();
		}
		
		
	}


}
