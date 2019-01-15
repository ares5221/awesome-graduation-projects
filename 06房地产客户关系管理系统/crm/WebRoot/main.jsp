<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>房地产客户信息管理中心</title>
<link rel="shortcut icon bookmark" href="images/22.jpg" type="image/x-icon" />
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery-3.2.0.min.js"></script>
</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main" style="background-color:#36648B;">
		<div class="logo margin-big-left fadein-top" >
			<h1>
				<img src="images/22.jpg" class="radius-circle rotate-hover"
					height="50" alt="logo" />房地产客户关系管理系统
			</h1>
		</div>
		<div class="head-l">
			<a class="button button-little bg-green" href="main.jsp"
				target="_top"><span class="icon-home"></span> 前台首页</a>
			&nbsp;&nbsp; 
			<a class="button button-little bg-red" href="servlet/LoginServlet?method=logout"><span
				class="icon-power-off"></span> 退出登录</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<c:if test="${user.role_ID==1 }">
				<!--<h2>
				<span class="icon-user"></span>管理员功能
			</h2>-->
			<h2><span class="icon-pencil-square-o"></span>管理员功能</h2>
			<ul style="display: block">
				<li><a href="servlet/UserServlet?method=toAdd" target="right"><span
						class="icon-caret-right"></span>添加员工</a></li>
				<li><a href="servlet/UserServlet?method=showUser" target="right"><span
				class="icon-caret-right"></span>员工列表</a></li>
		
			<li><a href="servlet/UserServlet?method=toAdd&i=2" target="right"><span
						class="icon-caret-right"></span>添加管理员</a></li>
			
				<li><a href="servlet/UserServlet?method=showUser&queryType=urole" target="right"><span
						class="icon-caret-right"></span>管理员列表</a></li>
			
				
						
				<li><a href="view/admin/dept_add.jsp" target="right"><span
						class="icon-caret-right"></span>添加部门</a></li>
				<li><a href="servlet/DepartmentServlet?method=showDept" target="right"><span
						class="icon-caret-right"></span>部门列表</a></li>
				<li><a href="view/admin/role_add.jsp" target="right"><span
						class="icon-caret-right"></span>添加角色</a></li>
				<li><a href="servlet/UserServlet?method=showRole" target="right"><span
						class="icon-caret-right"></span>角色列表</a></li>
				
			</ul>
			
			<h2><span class="icon-pencil-square-o"></span>员工相关</h2>
			<ul>
				<li><a href="view/employee/emp_detail.jsp" target="right"><span class="icon-caret-right"></span>员工信息</a></li>
				<li><a href="servlet/DepartmentServlet?method=showDept&sdepartment_ID=${user.department_ID}&j=3" target="right"><span class="icon-caret-right"></span>员工部门信息</a></li>
			
			</ul>
		</c:if>
		<c:if test="${user.role_ID==3 }">
		<h2><span class="icon-pencil-square-o"></span>员工相关</h2>
			<ul>
				<li><a href="view/employee/emp_detail.jsp" target="right"><span class="icon-caret-right"></span>员工信息</a></li>
				<li><a href="servlet/DepartmentServlet?method=showDept&sdepartment_ID=${user.department_ID}&j=3" target="right"><span class="icon-caret-right"></span>员工部门信息</a></li>
			
			</ul>
			<h2><span class="icon-pencil-square-o"></span>客户相关</h2>
			<ul>
				<li><a href="servlet/CustomerServlet?method=show" target="right"><span class="icon-caret-right"></span>客户信息</a></li>
				<li><a href="servlet/CustomerServlet?method=showDistribute" target="right"><span class="icon-caret-right"></span>客户分配</a></li>
				<li><a href="servlet/CustomerServlet?method=care" target="right"><span class="icon-caret-right"></span>客户关怀</a></li>
				<li><a href="servlet/CustomerServlet?method=customerType" target="right"><span class="icon-caret-right"></span>客户类型</a></li>
				<li><a href="servlet/CustomerServlet?method=condition" target="right"><span class="icon-caret-right"></span>客户状态</a></li>
				<li><a href="servlet/CustomerServlet?method=source" target="right"><span class="icon-caret-right"></span>客户来源</a></li>
			</ul>
		<!-- 
		<h2><span class="icon-pencil-square-o"></span>业主相关</h2>
			<ul>
				<li><a href="clazz.html" target="right"><span class="icon-caret-right"></span>业主信息</a></li>
				<li><a href="group.html" target="right"><span class="icon-caret-right"></span>业主分配</a></li>
				<li><a href="group.html" target="right"><span class="icon-caret-right"></span>业主关怀</a></li>
				<li><a href="group.html" target="right"><span class="icon-caret-right"></span>业主类型</a></li>
				<li><a href="group.html" target="right"><span class="icon-caret-right"></span>业主状态</a></li>
				<li><a href="group.html" target="right"><span class="icon-caret-right"></span>业主来源</a></li>
			</ul>
		 -->
			
			
			<h2><span class="icon-pencil-square-o"></span>房屋相关</h2>
			<ul>
				<li><a href="servlet/HouseServlet?method=find" target="right"><span class="icon-caret-right"></span>房屋信息</a></li>
				
				<li><a href="servlet/HouseServlet?method=findType" target="right"><span class="icon-caret-right"></span>房屋类型</a></li>
			</ul>
		
			<h2><span class="icon-pencil-square-o"></span>公告</h2>
			<ul>
				<!--<li><a href="clazz.html" target="right"><span class="icon-caret-right"></span>班级排名</a></li>
				<li><a href="group.html" target="right"><span class="icon-caret-right"></span>小组排名</a></li>-->
				<li><a href="servlet/DepartmentServlet?method=findNotice" target="right"><span class="icon-caret-right"></span>公告信息</a></li>
			</ul>
		</c:if>
			
		<c:if test="${user.role_ID==2 }">
					<!--<h2>
				<span class="icon-user"></span>管理员功能
			</h2>-->
			<h2><span class="icon-pencil-square-o"></span>管理员功能</h2>
			<ul style="display: block">
				<li><a href="servlet/UserServlet?method=toAdd" target="right"><span
						class="icon-caret-right"></span>添加员工</a></li>
				<li><a href="servlet/UserServlet?method=showUser" target="right"><span
				class="icon-caret-right"></span>员工列表</a></li>
		
			<li><a href="servlet/UserServlet?method=toAdd&i=2" target="right"><span
						class="icon-caret-right"></span>添加管理员</a></li>
			
				<li><a href="servlet/UserServlet?method=showUser&queryType=urole" target="right"><span
						class="icon-caret-right"></span>管理员列表</a></li>
			
				
						
				<li><a href="view/admin/dept_add.jsp" target="right"><span
						class="icon-caret-right"></span>添加部门</a></li>
				<li><a href="servlet/DepartmentServlet?method=showDept" target="right"><span
						class="icon-caret-right"></span>部门列表</a></li>
				<li><a href="view/admin/role_add.jsp" target="right"><span
						class="icon-caret-right"></span>添加角色</a></li>
				<li><a href="servlet/UserServlet?method=showRole" target="right"><span
						class="icon-caret-right"></span>角色列表</a></li>
				
			</ul>
			
			<h2><span class="icon-pencil-square-o"></span>员工相关</h2>
			<ul>
				<li><a href="view/employee/emp_detail.jsp" target="right"><span class="icon-caret-right"></span>员工信息</a></li>
				<li><a href="servlet/DepartmentServlet?method=showDept&sdepartment_ID=${user.department_ID}&j=3" target="right"><span class="icon-caret-right"></span>员工部门信息</a></li>
			
			</ul>
		
			<h2><span class="icon-pencil-square-o"></span>客户相关</h2>
			<ul>
				<li><a href="servlet/CustomerServlet?method=show" target="right"><span class="icon-caret-right"></span>客户信息</a></li>
				<li><a href="servlet/CustomerServlet?method=showDistribute" target="right"><span class="icon-caret-right"></span>客户分配</a></li>
				<li><a href="servlet/CustomerServlet?method=care" target="right"><span class="icon-caret-right"></span>客户关怀</a></li>
				<li><a href="servlet/CustomerServlet?method=customerType" target="right"><span class="icon-caret-right"></span>客户类型</a></li>
				<li><a href="servlet/CustomerServlet?method=condition" target="right"><span class="icon-caret-right"></span>客户状态</a></li>
				<li><a href="servlet/CustomerServlet?method=source" target="right"><span class="icon-caret-right"></span>客户来源</a></li>
			</ul>
			<!-- 
			<h2><span class="icon-pencil-square-o"></span>业主相关</h2>
			<ul>
				<li><a href="clazz.html" target="right"><span class="icon-caret-right"></span>业主信息</a></li>
				<li><a href="group.html" target="right"><span class="icon-caret-right"></span>业主分配</a></li>
				<li><a href="group.html" target="right"><span class="icon-caret-right"></span>业主关怀</a></li>
				<li><a href="group.html" target="right"><span class="icon-caret-right"></span>业主类型</a></li>
				<li><a href="group.html" target="right"><span class="icon-caret-right"></span>业主状态</a></li>
				<li><a href="group.html" target="right"><span class="icon-caret-right"></span>业主来源</a></li>
			</ul>
			 -->
			
			
			<h2><span class="icon-pencil-square-o"></span>房屋相关</h2>
			<ul>
				<li><a href="servlet/HouseServlet?method=find" target="right"><span class="icon-caret-right"></span>房屋信息</a></li>
				
				<li><a href="servlet/HouseServlet?method=findType" target="right"><span class="icon-caret-right"></span>房屋类型</a></li>
			</ul>
		
			<h2><span class="icon-pencil-square-o"></span>公告</h2>
			<ul>
				<!--<li><a href="clazz.html" target="right"><span class="icon-caret-right"></span>班级排名</a></li>
				<li><a href="group.html" target="right"><span class="icon-caret-right"></span>小组排名</a></li>-->
				<li><a href="servlet/DepartmentServlet?method=findNotice" target="right"><span class="icon-caret-right"></span>公告信息</a></li>
			</ul>
		
		</c:if>
		
				
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
		<li><a href="main.jsp" class="icon-home" target="_top"> 首页</a></li>
	</ul>
	<div class="admin">
	 		<iframe src="ca.html" name="right" width="100%" height="100%" style="background-color: white"></iframe>	
	</div>
</body>
</html>
