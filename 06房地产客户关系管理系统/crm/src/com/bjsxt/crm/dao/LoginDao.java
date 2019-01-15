package com.bjsxt.crm.dao;

import com.bjsxt.crm.entity.User;

public interface LoginDao {
	/**
	 * °´ÕÕÕË»§ ÃÜÂë²éÑ¯µÇÂ½
	 * @param user_num
	 * @param user_pw
	 * @return
	 */
	User find(String user_num, String user_pw);

}
