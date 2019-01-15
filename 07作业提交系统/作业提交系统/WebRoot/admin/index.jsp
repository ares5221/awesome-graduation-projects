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
	<title>登录</title>
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery-3.2.0.min.js"></script>
	<script src="js/pintuer.js"></script>
	<script src="js/checkdata.js"></script>
	<script src="js/ajax.js"></script>
</head>
<body>
	<div class="bg"></div>
	<div class="container">
		<div class="line bouncein">
			<div class="xs6 xm4 xs3-move xm4-move">
				<div style="height: 150px;"></div>
				<div class="media media-y margin-big-bottom"></div>
				<form id="loginform" name="loginform" action="servlet/AdminServlet?method=login" method="post">
					<!-- 登录动作目的地 -->
					<div class="panel loginbox">
						<div class="text-center margin-big padding-big-top">
							<h1>后台管理中心</h1>
						</div>
						<div class="panel-body"
							style="padding: 30px; padding-bottom: 10px; padding-top: 10px;">
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="text" class="input input-big" name="user" 
										placeholder="登录账号" data-validate="required:请填写账号" maxlength="16"/> 
										<!-- <span id="test"></span> -->
										<span class="icon icon-user margin-small"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="password" class="input input-big" name="password" 
										placeholder="登录密码" data-validate="required:请填写密码" maxlength="16"/>
										<span class="icon icon-key margin-small"></span>
								</div>
							</div>
						</div>
						<span style="padding: 30px;">
							${error }
						</span>
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
