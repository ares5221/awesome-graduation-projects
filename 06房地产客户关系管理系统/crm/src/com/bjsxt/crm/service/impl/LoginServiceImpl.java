package com.bjsxt.crm.service.impl;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.bjsxt.crm.dao.LoginDao;
import com.bjsxt.crm.dao.impl.LoginDaoImpl;
import com.bjsxt.crm.entity.Notice;
import com.bjsxt.crm.entity.User;
import com.bjsxt.crm.service.DepartmentService;
import com.bjsxt.crm.service.LoginService;

public class LoginServiceImpl implements LoginService {
	private LoginDao loginDao =new LoginDaoImpl();
	@Override
	public User login(String user_num, String user_pw) {
		User user =loginDao.find(user_num,user_pw);
		//判断公告是否有过期的并删除
		compareDate();
		return user;
	}
	
	//	判断公告是否到期并删除的方法
		public void compareDate(){
		Date d = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String s = simpleDateFormat.format(d);
		//2获取公告结束日期
		DepartmentService de=new DepartmentServiceImpl();
		//定义三个变量用于调用shownotice查询方法
		int snotice_ID=0;	
		String notice_item="";
		String notice_content="";
		List<Notice> shownotice = de.shownotice(snotice_ID, notice_item, notice_content);
		//循环便利获取的多个公告的个个结束日期
		int dateNow=0;
		int dateEnd=1;
		for(int i =0;i<shownotice.size();i++){
			Notice notice = shownotice.get(i);
			Date notice_endtime = notice.getNotice_endtime();
			int notice_ID = notice.getNotice_ID();
			//将notice_endtime 转化成为字符串类型
			String now = notice_endtime.toString();
			//拆分字符串获得数组
			String[] s1 = s.split("-");
			String[] s2 = now.split("-");
			
			String str1="";
			String str2="";
			for(int j =0 ;j<3;j++){
				String str11= s1[j];
				String str22 = s2[j];
				//获取每个字符串并且拼接
				str1=str1+str11;
				str2=str2+str22;
			}
			try{
				//将获取的日期String转换成int类型
				dateNow = Integer.parseInt(str1);
				dateEnd = Integer.parseInt(str2);
			}catch(NumberFormatException e){
				System.out.println("转换失败");
			}
			//进行判断并根据判断确定是否删除
			if(dateEnd-dateNow<=0){
				DepartmentServiceImpl departmentServiceImpl = new DepartmentServiceImpl();
				departmentServiceImpl.deleteNotice(notice_ID);
				System.out.println("公告编号："+notice_ID+"到期已删除");
			}else{
				System.out.println("公告编号："+notice_ID+"没有到期不用删除");
			}
		}
	}
	

	
		
	
}
