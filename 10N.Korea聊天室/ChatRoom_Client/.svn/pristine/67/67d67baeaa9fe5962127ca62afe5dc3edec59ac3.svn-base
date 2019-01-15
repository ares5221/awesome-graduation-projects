package com.sxt.request;

import java.net.Socket;
/**
 * 获得socket，和 服务器进行连接
 * @author gabriel
 *
 */
public class ConnectionServer {
	private static Socket socket;
	private ConnectionServer() {
	}
	
	/**
	 * 获取与服务器连接的socket
	 * @return socket
	 * @throws Exception
	 */
	public static Socket getSocket() throws Exception {
		if(socket==null){
			socket=new Socket("192.168.143.50",8888);	
			return socket;
		}else{
			 return socket;
		}
	}
	
}
