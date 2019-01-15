<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
<script src="js/checkdata.js"></script>
<script src="editor/kindeditor.js"></script>
<script>
	KE.show({id: 'content'});	
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 发布作业</strong>
		</div>
		<div class="body-content">
			<form action="servlet/AdminServlet?method=publishWork" method="post" class="form-x" id="inform" >
				<div class="form-group">
					<div class="label">
						<label for="sitename">作业标题：</label>
					</div>
					<div class="field">
						<input name="hname" type="text" class="input w50" 
							size="50" placeholder="请输入标题" 
							data-validate="required:请输入标题" />
					</div>
				</div>
				<br>
				<div class="form-group">
					<div class="label">
						<label>详细内容：</label>
					</div>
					<div class="field">
						<textarea name="cont" id="content"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>