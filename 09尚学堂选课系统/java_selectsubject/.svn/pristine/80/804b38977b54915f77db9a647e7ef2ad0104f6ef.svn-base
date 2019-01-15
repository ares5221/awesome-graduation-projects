package com.bjsxt.tomcat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.List;

import com.bjsxt.dao.ManagerDao;
import com.bjsxt.dao.TeacherDao;
import com.bjsxt.entity.Teacher;
import com.bjsxt.utils.Utils;
import com.bjxst.service.ManagerService;
import com.bjxst.service.StudentService;
import com.bjxst.service.TeacherService;

public class Mytomcat implements Runnable{
	Socket scoket =null;
	public Mytomcat(Socket socket){
		this.scoket=socket;
	}
	public static void main(String[] args) throws IOException {
		ServerSocket so=new ServerSocket(8900);
		while(true){
			Socket	accept = so.accept();
			System.out.println("连接成功");
			Mytomcat m=new Mytomcat(accept);
			new Thread(m).start();
		}
	}
	public void run() {
		TeacherService t=new TeacherService();
		ManagerService m=new ManagerService();
		while(true){
		  try{
			PrintWriter pri=new PrintWriter(scoket.getOutputStream());
		    BufferedReader br=new BufferedReader(new InputStreamReader(scoket.getInputStream()));
		    String clientCommand = br.readLine();
		    String[] atr=clientCommand.split(",");
		    String temp="";
		    String ID="";
		    String PW="";
		    //学生登录
		    if("登录".equals(atr[0])){
		    	if(atr[1].length()==6){
		    		if(new StudentService().iftrue(atr[1], atr[2])){
		    			String s="登录,true";
		    			temp="学生";
		    			ID=atr[1];
		    			PW=atr[2];
		    			pri.println(s);
		    			pri.flush();
		    		}else{
		    			String s="登录,false";
		    			pri.println(s);
		    			pri.flush();
		    			continue;
		    		}
		    	//老师登录	
		    	}else if(atr[1].length()==4){
		    		boolean flag = t.teaPW(atr[1],atr[2]);
		    		if(flag){
		    			temp="teacher";
		    			ID=atr[1];
		    			PW=atr[2];
		    			pri.println("登录,true");
			    		pri.flush();
			    	}else{
			    		pri.println("登录,false");
			    		pri.flush();
			    		continue;
			    	}
		    		
		    	//管理员登录	
		    	}else if(atr[1].length()==2){
		    		boolean flsg=m.admPW(atr[1],atr[2]);
		    		if(flsg){
		    			temp="admin";
		    			ID=atr[1];
		    			PW=atr[2];
		    			pri.println("登录,true");
			    		pri.flush();
			    	}else{
			    		pri.println("登录,false");
			    		pri.flush();
			    		continue;
			    	}
		    		
		    	}
		    	while(true){
		    	   //学生端
		    		if(temp.equals("学生")){
		    		String r=br.readLine();
		    		new StudentTomcat(ID,r,pri);
		    		if(r.contains(",")){
		    		String[] s = r.split(",");
		    		if("选课".equals(s[0])){
		    			if(new StudentService().chooseCourse(ID, s[1])){
			    			pri.println("选课,true");
			    			pri.flush();
			    		}else{
			    			pri.println("选课,false");
			    			pri.flush();
			    			}	
			    		}else if("修改旧密码".equals(s[0])){
	    					
	    					String str=Utils.modifyPassword("1", ID, s[1], s[1]);
	    					if("true".equals(str)){
		    					pri.println("修改旧密码,true");
		    					pri.flush();
		    				}else{
		    					pri.println("修改旧密码,false");
		    					pri.flush();
		    				}
	    					
	    				}else if("设置新密码".equals(s[0])){
	    					String str=Utils.modifyPassword("1", ID, PW, s[1]);
	    					if("true".equals(str)){
		    					pri.println("设置新密码,true");
		    					PW=s[1];
		    					pri.flush();
		    				}else{
		    					pri.println("设置新密码,false");
		    					pri.flush();
		    				}
	    				
	    				}
		    		
		    		}
		    		}
		    		//教师端
		    		else if(temp.equals("teacher")){
			    		//等待用户输入
		    			String function= br.readLine();
		    			String[] split = function.split(",");
		    			if("教师个人信息".equals(split[0])){
	    					//调用教师个人信息的方法
	    					String teacherInfo = t.searchTeaId(atr[1]);
	    					pri.println("教师个人信息,"+teacherInfo);
	    					pri.flush();
	    				}else if("所有学生".equals(split[0])){
	    					//调用所有的学生  所有学生，str
	    					List<String> searchAllStuInfo = t.searchAllStuInfo(atr[1]);
	    					if(searchAllStuInfo.size()==0){
	    						pri.println("所有学生,没有任何学生选这门课");
	    						pri.flush();
	    					}else{
	    						for(String s:searchAllStuInfo){
	    							pri.println("所有学生,"+s);
	    							pri.flush();
	    						}
	    					}
	    				}else if("添加课程".equals(split[0])){
	    					//调用添加课程的方法
	    					TeacherDao td=new TeacherDao();
	    					List<Teacher> teaList = td.getTeaList();
	    					String teacherName="";
	    					for(Teacher teacher:teaList){
	    						if(atr[1].equals(teacher.getId())){
	    							teacherName=teacher.getName();
	    						}
	    					}
	    					boolean addCourse = t.addCourse(split[1], split[2], teacherName,atr[1]);
	    					if(addCourse){
	    						//给客户端的信息   添加课程，true
	    						pri.println("添加课程,true");
	    						pri.flush();
	    					}else{
	    						//给客户端的信息   添加课程，false
	    						pri.println("添加课程,false");
	    						pri.flush();
	    					}
	    				}else if("修改旧密码".equals(split[0])){
	    					
	    					String str=Utils.modifyPassword("2", ID, split[1], split[1]);
	    					if("true".equals(str)){
		    					pri.println("修改旧密码,true");
		    					pri.flush();
		    				}else{
		    					pri.println("修改旧密码,false");
		    					pri.flush();
		    				}
	    					
	    				}else if("设置新密码".equals(split[0])){
	    					String str=Utils.modifyPassword("2", ID, PW, split[1]);
	    					if("true".equals(str)){
		    					pri.println("设置新密码,true");
		    					PW=split[1];
		    					pri.flush();
		    				}else{
		    					pri.println("设置新密码,false");
		    					pri.flush();
		    				}
	    				
	    				}
		    			
		    			
			    	}
		    		//管理员
		    		else if(temp.equals("admin")){
		    			ManagerService ms=new ManagerService();
		    			String sr=br.readLine();
		    			String[] art=sr.split(",");
		    			if("添加学生".equals(art[0])){
		    				//效验传入学生id是否存在，存在不允许添加，不存在进行添加
		    				String a=new ManagerDao().stuId(art[1]);
		    				if("true".equals(a)){
		    				ms.addStu(art[1],art[2],art[3],art[4],art[5]);
		    				pri.println("添加学生,true");
		    				pri.flush();
		    				}else{
		    					pri.println("添加学生,false");
			    				pri.flush();
		    				}
		    			}
		    			if("添加教师".equals(art[0])){
		    				//效验传入教师id是否存在，存在不允许添加，不存在进行添加
		    				String a=new ManagerDao().teaId(art[1]);
		    				if("true".equals(a)){
		    				ms.addTea(art[1],art[2],art[3],art[4],art[5]);
		    				pri.println("添加教师,true");
		    				pri.flush();
		    				}else{
		    					pri.println("添加教师,false");
			    				pri.flush();
		    				}
		    			}
		    			if("查看用户信息".equals(art[0])){
		    				int us=art[1].length();
		    				String a="";
		    				switch(us){
		    				case 6:
		    					//效验传入学生id是否存在,存在返回的的false
			    				a=new ManagerDao().stuId(art[1]);
			    				break;
		    				case 4:
		    					//效验传入教师id是否存在,存在返回的的false
			    				a=new ManagerDao().teaId(art[1]);
			    				break;
		    				case 2:
		    					List list=new ManagerDao().getManList();
		    					if(art[1].equals(list.get(0))){
		    						a="false";
		    					}else{
		    						a="true";
		    					}
		    					break;
		    				}
		    				if("false".equals(a)){
	    						String stuInfo=m.showInfo(art[1]);
	    						pri.println("查看用户信息,"+stuInfo);
			    				pri.flush();
	    					}else{
		    					pri.println("查看用户信息,用户不存在");
			    				pri.flush();
		    				}
		    			}
		    			if("修改用户密码".equals(art[0])){
		    				String info=m.showInfo(art[1]);
		    				int id=art[1].length();
		    				String str="";
		    				String[] a=info.split(";");
		    				String[] b=a[2].split(":");
		    				String pass=b[1];
		    				if(id==6){
		    					str=Utils.modifyPassword("1", art[1], pass, art[2]);
		    				}
		    				if(id==4){
		    					str=Utils.modifyPassword("2", art[1], pass, art[2]);
		    				}
		    				if(id==2){
		    					str=Utils.modifyPassword("3", art[1], pass, art[2]);
		    				}
		    				if("true".equals(str)){
		    					pri.println("修改用户密码,true");
		    					pri.flush();
		    				}else{
		    					pri.println("修改用户密码,false");
		    					pri.flush();
		    				}
		    			}
		    		}
		    		}
		    	
		    }
		   }catch(Exception e){
			   System.out.println(scoket.getInetAddress()+"下线了\n");
			   break;
		   }
		  
	  }
	
	}
}
