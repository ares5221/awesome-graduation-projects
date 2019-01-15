<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>"></base>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>欢迎登录校园管理系统</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/css.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="js/jquery.js"></script>
	<script src="js/cloud.js" type="text/javascript"></script>

	<script language="javascript">
		$(function(){
	   		$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
			$(window).resize(function(){  
	   			$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	    	});
	    	
		}); 
		
		function changeJPG(){
			var img = document.getElementById("imgrand");
			img.src = "random.jpg?time="+new Date().toLocaleString();
		}
	</script>
	
	<%
		String username="";
		String password="";
		String check="";
		Cookie [] cookies=request.getCookies();
		if(cookies!=null){
			for(int i=0; i<cookies.length;i++){
				Cookie cookie=cookies[i];
				if("userId".equals(cookie.getName())){
					username=cookie.getValue();
					username=URLDecoder.decode(username, "utf-8");
					check="checked";
				}
				if("password".equals(cookie.getName())){
					password=cookie.getValue();
				}
			}
		}
	
	 %> 
</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  
	<div class="loginbody">
	    <span class="systemlogo"></span> 
    	<div class="loginbox loginbox2">
    	<form action="servlet/UserServlet?method=login"  method="post">
		    <ul>
		    
			    <li><input name="userId" id="username" type="text" class="loginuser" value="<%=username %>" /></li>
			    <li><input name="password" id="password" type="password" class="loginpwd" value="<%=password %>"/></li>
			    <li class="yzm">
			    <span><input name="verifyCode" type="text" value="验证码" onclick="JavaScript:this.value=''"  /></span>
			    <cite>
			    	<img src="random.jpg" onclick="changeJPG()" id="imgrand" height="100%" width="100%" />
			    </cite> 
			    </li>
			    <li>
			    <input name="submit" type="submit" class="loginbtn" value="登录"/>
			    <label><input name="remember" type="checkbox" value="yes" <%=check %> />十天免登录</label>
			    </li>
			    <li style="color: #FF0">
			    <label style="color: red">${error }</label>
			    </li>
			  
		    </ul>
		    </form>
    	</div>
    </div>
    
    
</body>

</html>

