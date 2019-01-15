package com.zhatian.wzp.util;

/**
 * 对注册、登录的属性的校验工具类
 * 学生客户端和服务器端可调用该类的静态方法进行校验
 * @author Wang zhanpeng
 *
 */

public class Regex {
	
	/**
	 * 校验用户名
	 * @param username
	 * @return true表示格式正确 false表示格式错误
	 */
	public static boolean usernameRegex(String username) {
		boolean flag = false;
		//规定用户名首字母必须为26个字母中的一个，其它可为字母、数字、下划线，总长度为1-10位
		String regex = "[a-zA-Z]\\w{0,9}"; 
		if(username != null) {
			flag = username.matches(regex);
			return flag;
		}
		return flag;	
	}
	
	/**
	 * 校验密码
	 * @param password
	 * @return true表示格式正确 false表示格式错误
	 */
	public static boolean passwordRegex(String password) {
		boolean flag = false;
		//规定密码组成可为字母、数字、下划线，长度要求为6-12位
		String regex = "[\\w]{6,12}";
		if(password != null) {
			flag = password.matches(regex);
			return flag;
		}
		return flag;
	}
	
	/**
	 * 校验姓名
	 * @param name
	 * @return true表示格式正确 false表示格式错误
	 */
	public static boolean nameRegex(String name) {
		boolean flag = false;
		//规定姓名为中文汉字，长度为2-4
		String regex = "[\u4e00-\u9fa5]{2,4}";
		if(name != null) {
			flag = name.matches(regex);
			return flag;
		}
		return flag;
	}
	
	/**
	 * 性别校验
	 * @param sex
	 * @return true表示格式正确 false表示格式错误
	 */
	public static boolean sexRegex(String sex) {
		boolean flag = false;
		//规定性别只能为男或女
		String regex = "[男|女]";
		if(sex != null) {
			flag = sex.matches(regex);
			return flag;
		}
		return flag;
	}
	
	/**
	 * 校验年龄
	 * @param age
	 * @return true表示格式正确 false表示格式错误
	 */
	public static boolean ageRegex(String age) {
		boolean flag = false;
		//规定年龄范围为0-100
		String regex = "[1-9][\\d]|[0-9]{1}|100";
		if(age != null) {
			flag = age.matches(regex);
			return flag;
		}
		return flag;
	}
	
	/**
	 * 检验班级
	 * @param _class
	 * @return true表示格式正确 false表示格式错误
	 */
	public static boolean classRegex(String _class) {
		boolean flag = false;
		//规定班级格式只能为三位数字(1-999)
		String regex = "[1-9][\\d][\\d]|[1-9][\\d]|[1-9]{1}";
		if(_class != null) {
			flag = _class.matches(regex);
			return flag;
		}
		return flag;
	}
	
	/**
	 * 检验日期
	 * @param date
	 * @return true表示格式正确 false表示格式错误
	 */
	public static boolean dateRegex(String date) {
		boolean flag = false;
		//规定日期格式只能为yyyy-MM-dd
		String regex = "(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)";
		if(date != null) {
			flag = date.matches(regex);
			return flag;
		}
		return flag;
	}
	
}
