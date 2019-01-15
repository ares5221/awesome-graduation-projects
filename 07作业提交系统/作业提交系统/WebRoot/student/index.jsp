<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>学生登录</title>
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery-3.2.0.min.js"></script>
	<script src="js/pintuer.js"></script>
	<script src="js/checkdata.js"></script>
</head>
<body>
	
	<div class="bg"></div>
	<div class="container">
		<div class="line bouncein">
			<div class="xs6 xm4 xs3-move xm4-move">
				<div style="height: 50px;"></div>
				<div class="media media-y margin-big-bottom"></div>
				<form id="loginform" name="loginform" action="servlet/StudentServlet?method=login" method="post">
					<!-- 登录动作目的地 -->
					<div class="panel loginbox">
						<div class="text-center margin-big padding-big-top">
							<h1>欢迎使用作业管理系统</h1>
						</div>
						<div class="panel-body"
							style="padding: 30px; padding-bottom: 10px; padding-top: 10px;">
							<div class="form-group">
								<div class="label">
									<label for="sitename">班级：</label>
									<select id="selClazz" name="selClazz">
										<c:forEach var="clazz" items="${lclazz }">
											<option value="${clazz.cid }" <c:if test="${user.clazz.cid==clazz.cid }">selected</c:if> >${clazz.cname }</option>
										</c:forEach>
									</select> 
								</div>
							</div>
							<div class="form-group">
								<div class="label">
									<label for="sitename">小组：</label>
									<select id="selGroup" name="selGroup" >
										<c:forEach var="group" items="${lgroup }">
											<option value="${group.gid }" <c:if test="${user.group.gid==group.gid }">selected</c:if> >${group.gname }</option>
										</c:forEach>
									</select> 
								</div>
							</div>
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="text" class="input input-big" name="userName" value="${user.sname }" onblur="return showHint(this.value)"
										placeholder="登录账号" data-validate="required:请填写账号" maxlength="16"/> 
										<span class="icon icon-user margin-small"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="password" class="input input-big" name="password" onblur="return checklogin()"
										placeholder="登录密码" data-validate="required:请填写密码" maxlength="16"/>
										<span class="icon icon-key margin-small"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="field field-icon-right">
									${error }
								</div>
							</div>
						</div>
						
						<div style="padding: 30px;">
							<input type="submit"
								class="button button-block bg-main text-big input-big"
								value="登录" >
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
