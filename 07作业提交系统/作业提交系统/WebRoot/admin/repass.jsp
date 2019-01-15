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
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title>修改密码</title>
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery-3.2.0.min.js"></script>
	<script src="js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-key"></span> 修改管理员密码</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="servlet/AdminServlet?method=rePasssword">
				<div class="form-group">
					<div class="label">
						<label for="sitename">管理员帐号：</label>
					</div>
					<div class="field" >
						<label style="line-height: 33px;"> ${user.aname } </label>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="sitename">原始密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" id="mpass" name="mpass"
							size="50" placeholder="请输入原始密码" 
							data-validate="required:请输入原始密码,length#>=5:原始密码不会小于5位" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="sitename">新密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" name="newpass" size="50"
							placeholder="请输入新密码"
							data-validate="required:请输入新密码,length#>=5:新密码不能小于5位" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="sitename">确认新密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" name="renewpass"
							size="50" placeholder="请再次输入新密码"
							data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
						&nbsp;&nbsp;&nbsp;<label>${error }</label>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>