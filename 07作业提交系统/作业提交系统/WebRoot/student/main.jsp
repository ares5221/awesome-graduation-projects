<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>学生端</title>
	<link rel="shortcut icon bookmark" href="images/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery-3.2.0.min.js"></script>
	<script src="js/checkdata.js"></script>
	<script src="js/pintuer.js"></script>
	<script src="js/calendar.js"></script>
</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				<img src="images/sxt.jpg" class="radius-circle rotate-hover"
					height="50" alt="logo" />学生端
			</h1>
		</div>
		<div class="head-l">
			<a class="button button-little bg-green" href="student/main.jsp"
				target="_blank"><span class="icon-home"></span> 首页</a>
			&nbsp;&nbsp; 
			<a class="button button-little bg-red" href="servlet/StudentServlet?method=logout"><span
				class="icon-power-off"></span> 退出登录</a>
		</div>
		<!-- 显示当前登录的用户名 -->
		<div class="head-l">
			<a class="button button-little bg-blue">
				<span class="icon-user"><b>&nbsp;:&nbsp;&nbsp;${user.sname }</b></span> 
			</a>
		</div>
		<div class="right-time" align="right" style="padding-right:20px;padding-top:10px">
			<img src="images/headerflag.jpg" width="9" height="9">&nbsp;&nbsp;
			<font color="red"><b>今天是 <span id="dtField"> </span></b></font>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<h2>
			<span class="icon-user"></span>基本设置
		</h2>
		<ul style="display: block">
			<li><a href="servlet/StudentServlet?method=toRepasswordPage" target="right"><span
					class="icon-caret-right"></span>修改密码</a></li>
		</ul>
		
		<h2><span class="icon-pencil-square-o"></span>作业</h2>
		<ul>
			<li><a href="student/workList.jsp" target="right"><span class="icon-caret-right"></span>查看作业要求</a></li>
			<li><a href="servlet/StudentServlet?method=toUploadPage" target="right"><span class="icon-caret-right"></span>提交作业</a></li>
		</ul>
		
		<h2><span class="icon-pencil-square-o"></span>查看排名</h2>
		<ul>
			<li><a href="servlet/RankingServlet?method=toClazzRanking" target="right"><span class="icon-caret-right"></span>班级排名</a></li>
			<li><a href="servlet/RankingServlet?method=toGroupRanking" target="right"><span class="icon-caret-right"></span>小组排名</a></li>
		</ul>
		<h2><span class="icon-pencil-square-o"></span>班级公告</h2>
		<ul>
			<li><a href="servlet/InformServlet?method=findInform" target="right"><span class="icon-caret-right"></span>班级公告</a></li>
		</ul>
		
		
	</div>
	<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  });
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  });
});
</script>
	<ul class="bread">
		<!-- <li><a href="student/main.jsp" class="icon-home"> 首页</a></li> -->
	</ul>
	<div class="admin">
	 	<iframe src="welcome.html" name="right" width="100%" height="100%"></iframe>	
	</div>
</body>
</html>