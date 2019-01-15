<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery-3.2.0.min.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-key"></span>修改小组信息</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="servlet/GroupServlet?method=updateGroup">
				<div class="form-group">
					<div class="label">
						<label for="sitename">小组编号：</label>
					</div>
					
					<div class="field" >
				      
						<input type="text" class="input w50" name="gid" 
					readonly="readonly"  size="50" value="${groupList[0].gid }" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="sitename">组名：</label>
					</div>
					
					<div class="field" >
						<input type="text" class="input w50" name="gname" 
							size="50" value="${groupList[0].gname }" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="sitename">组长：</label>
					</div>
					<select name="sid1" >
					<option>--请选择组长--</option>
					<c:forEach items="${stuList }" var="stuList">
					<option value="${stuList.sid }">${stuList.sname }</option>
						</c:forEach>
				    </select>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="sitename">技术组长：</label>
					</div>
					<select name="sid2" >
					<option  >--请选择技术组长--</option>
						<c:forEach items="${stuList }" var="stuList">
					<option value="${stuList.sid }">${stuList.sname }</option>
						</c:forEach>
				</select>
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