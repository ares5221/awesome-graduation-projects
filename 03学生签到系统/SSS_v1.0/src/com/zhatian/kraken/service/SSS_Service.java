package com.zhatian.kraken.service;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.zhatian.kraken.util.KrakenRecord;

/**
 * 服务器
 * @author ask-kraken
 * @version 1.0
 */
public class SSS_Service {
	public static void main(String[] args) throws Exception {
		ExecutorService pool = Executors.newCachedThreadPool();//线程池
		ServerSocket server = new ServerSocket(9000);//套接字
		//KrakenRecord.setLogEnable(KrakenRecord.DISABLE);
		KrakenRecord.log("启动服务器");
		while(true){
			Socket socket  = server.accept();
			KrakenRecord.log("有服务器连接"+socket.getInetAddress().getHostAddress());
			SSS_Service_Thread myThread = new SSS_Service_Thread(socket);	
			Thread thread = new Thread(myThread);
			pool.execute(thread);
		}
	}
}
