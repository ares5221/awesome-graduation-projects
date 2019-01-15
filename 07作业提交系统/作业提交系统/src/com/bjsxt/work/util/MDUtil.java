/**
 * 
 */
package com.bjsxt.work.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.junit.Test;

/**
 * @author 李军伟
 * @功能：md5加密算法
 * @时间：2017年9月14日
 * 
 */
public class MDUtil {

	/**
	 * 二进制转换为16进制
	 * @param b
	 * @return 16进制编码
	 */
	public static String getHex(byte[] bytes) {
		String hex = "";
		for (int i = 0; i < bytes.length; i++) {
			// 2 把每一位二进制数都用16进制数表示
			String string = Integer.toHexString(bytes[i] & 0xff);
			if (string.length() < 2) {
				hex += "0" + string;
			} else {
				hex += string;
			}
		}
		
		return hex;
	}
	
	
	/**
	 * @param type 加密类型md5 md2
	 * @param message  需要进行加密的字符串
	 * @return 加密后的字符串
	 */
	public static String getMD(String type, String message) {
		String temp = "";
		try {
			byte[] digest = MessageDigest.getInstance(type).digest(message.getBytes());
			temp = getHex(digest);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return temp;
	}
	
	@Test
	public void testMD() {
		System.out.println(getMD("md5", "admin"));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
