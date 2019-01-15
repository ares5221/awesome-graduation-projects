<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
	    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title></title>
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery-3.2.0.min.js"></script>
	<script src="js/pintuer.js"></script>
	<style type="text/css">
		.sele {
			height: 20px;
			size: 50px;
		}
	</style>
</head>
<body>
	<div class="panel admin-panel"> 
		<div class="panel-head">
			<strong><span class="icon-key"></span> 创建班级</strong>
		</div>
		<div class="body-content">
		
		<!-- 跳转到添加学生的 servlet，ClazzServlet-->
		
			<form method="post" class="form-x" action="servlet/ClazzServlet?method=add">
				<div class="form-group">
					<div class="label">
						<label for="sitename">班级名称：</label>
					</div>
					<div class="field">
						<input name="cname" type="text" class="input w50" 
							size="50" placeholder="请输入班级名称" />
					</div>
				</div>
				
				
				<div class="form-group">
					<div class="label">
						<label for="sitename">任课老师：</label>
					</div>
					<select name="tid1" >
						<option style="height: 30px; width: 60px; line-height: 30px;">--请选择任课老师--</option>
					<c:forEach items="${teacherList }" var="teacher">
						<option value="${teacher.tid }">${teacher.tname }</option>
					</c:forEach>
				</select>
				</div>
				
				
				<div class="form-group">
					<div class="label">
						<label for="sitename">班主任：</label>
					</div>
					<div class="field">
				<select name="tid2">
					<option style="height: 30px; width: 60px; line-height: 30px;">--请选择班主任--</option>
						<c:forEach items="${teacherList }" var="teacher">
					<option value="${teacher.tid }">${teacher.tname }</option>
						</c:forEach>
				</select>
					</div>
				</div>
				
				
				
				
				<div class="form-group">
					<div class="label">
						<label for="sitename">就业老师：</label>
					</div>
					<div class="field">
				<select name="tid3">
					<option style="height: 30px; width: 60px; line-height: 30px;">--请选择就业老师--</option>
					<c:forEach items="${teacherList }" var="teacher">
						<option value="${teacher.tid }">${teacher.tname }</option>
					</c:forEach>
				</select>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>${error }
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
