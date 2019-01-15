package com.sxt.util;

/**
 * 用于注册时检查用户输入是否正确的相关 正则表达式
 * @author pengl
 *
 */
public class Regex {
	/**
	 * 用于id检查的正则表达式
	 * @param id 
	 * @return boolean
	 */
	public static boolean idRegex(String id){
		if ("".equals(id.trim())) {
			return false;
		}
		return id.matches("[a-zA-Z0-9]{4,8}");
	}
	/**
	 * 用于名字的正则表达式
	 * @param name
	 * @return boolean
	 */
	public static boolean nameRegex(String name){
		if ("".equals(name.trim())) {
			return false;
		}
		return name.matches("[^0-9]{2,8}");
	}
	/**
	 * 用于密码的正则表达式
	 * @param pwd 密码
	 * @return boolean
	 */
	public static boolean pwdRegex(String pwd){
		if ("".equals(pwd.trim())) {
			return false;
		}
		return pwd.matches(".{3,8}");
	}
}
