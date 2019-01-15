package com.bjsxt.listener;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;
/**
 * 记录每个请求的时间，客户端IP，URL地址到日志文件中

<listener>
  	<listener-class>com.bjsxt.sscs.listener.LogListener</listener-class>
  </listener>
  
 * @author Administrator
 *
 */
public class LogListener implements ServletRequestListener,ServletRequestAttributeListener {

	@Override
	public void requestDestroyed(ServletRequestEvent sre) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void requestInitialized(ServletRequestEvent sre) {
		//时间
		Date now = new Date();
		//IP
		HttpServletRequest request = (HttpServletRequest)sre.getServletRequest();
		String ip = request.getRemoteAddr();
		//url
		String url = request.getRequestURL().toString();
		String qs = request.getQueryString();
		
		//写入文件
		PrintWriter  out = null;
	
		try {
			 out = new PrintWriter(new FileOutputStream(new File("g:/log.txt"), true));
			 if(qs != null){
				 out.println("当前的时间是："+now.toLocaleString()+"，客户端的IP地址："+ip+",url："+url+"?"+qs);
			 }else{
				 out.println("当前的时间是："+now.toLocaleString()+"，客户端的IP地址："+ip+",url："+url);
			 }
		
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
		
		
	}

	@Override
	public void attributeAdded(ServletRequestAttributeEvent srae) {
		//request.setAttribute("uname",'bjsxt');
		//request.setAttribute("password",'bjsxt');
	}

	@Override
	public void attributeRemoved(ServletRequestAttributeEvent srae) {
		// TODO Auto-generated method stub
		//request.removeAttribute("uname");
		
	}

	@Override
	public void attributeReplaced(ServletRequestAttributeEvent srae) {
		//request.setAttribute("uname",'sxtsh');
		
	}

}
