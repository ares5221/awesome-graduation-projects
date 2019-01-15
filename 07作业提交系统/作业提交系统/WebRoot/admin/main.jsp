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
	<title>后台管理中心</title>
	<link rel="shortcut icon bookmark" href="images/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery-3.2.0.min.js"></script>
	<script src="js/calendar.js"></script>
</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				<img src="images/sxt.jpg" class="radius-circle rotate-hover"
					height="50" alt="logo" />后台管理中心
			</h1>
		</div>
		<div class="head-l">
			<a class="button button-little bg-green" href="index.jsp"
				target="_blank"><span class="icon-home"></span> 前台首页</a>
			&nbsp;&nbsp; 
			<a class="button button-little bg-red" href="servlet/AdminServlet?method=logout"><span
				class="icon-power-off"></span> 退出登录</a>
			
		</div>
		<!-- 显示当前登录的用户名 -->
		<div class="head-l">
			<a class="button button-little bg-blue">
				<span class="icon-user"><b>&nbsp;:&nbsp;&nbsp;${user.aname }</b></span> 
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
			<li><a href="servlet/AdminServlet?method=toRepasswordPage" target="right"><span
					class="icon-caret-right"></span>修改密码</a></li>
		</ul>
		
		<h2><span class="icon-pencil-square-o"></span>发布管理</h2>
		<ul>
			<li><a href="admin/inform.jsp" target="right"><span class="icon-caret-right"></span>发布公告</a></li>
			<li><a href="servlet/InformServlet?method=findInform" target="right"><span class="icon-caret-right"></span>公告列表</a></li>
			<li><a href="admin/work.jsp" target="right"><span class="icon-caret-right"></span>发布作业</a></li>
			<li><a href="admin/workList.jsp" target="right"><span class="icon-caret-right"></span>作业列表</a></li>
		</ul>
		
		<h2><span class="icon-pencil-square-o"></span>班级和小组</h2>
		<ul>
			<li><a href="servlet/ClazzServlet?method=toAddPage" target="right"><span class="icon-caret-right"></span>创建班级</a></li>
			<li><a href="servlet/ClazzServlet?method=showClazz" target="right"><span class="icon-caret-right"></span>班级列表</a></li>
			<li><a href="servlet/GroupServlet?method=toAddPage" target="right"><span class="icon-caret-right"></span>创建小组</a></li>
			<li><a href="servlet/GroupServlet?method=showAllGroup" target="right"><span class="icon-caret-right"></span>小组列表</a></li>
		</ul>
		
		<h2><span class="icon-pencil-square-o"></span>学生管理</h2>
		<ul>
			<li><a href="servlet/AdminServlet?method=toCommitedWorkPage" target="right"><span class="icon-caret-right"></span>收作业</a></li>
		</ul>
		
		<h2><span class="icon-pencil-square-o"></span>查看排名</h2>
		<ul>
			<li><a href="servlet/RankingServlet?method=toClazzRanking" target="right"><span class="icon-caret-right"></span>班级排名</a></li>
			<li><a href="servlet/RankingServlet?method=toGroupRanking" target="right"><span class="icon-caret-right"></span>小组排名</a></li>
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
		<!-- <li><a href="admin/main.jsp" class="icon-home"> 首页</a></li> -->
	</ul>
	<div class="admin">
	 	<iframe src="admin/info.html" name="right" width="100%" height="100%"></iframe>	
	</div>
</body>
</html>
