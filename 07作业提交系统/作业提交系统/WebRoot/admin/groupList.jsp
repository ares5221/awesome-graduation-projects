<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<title>查看已经添加的小组</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-3.2.0.min.js"></script>
<script src="js/pintuer.js"></script>
<style type="text/css">
	
	td {
		font-family: "微软雅黑";
		font-size: 14px;
		color: #555555;
		text-decoration: none;
		text-align: center;
		line-height: 20px;
		padding-top: 5px;
	}
	
</style>

<script type="text/javascript">
	//隔行变色
	window.onload = function (){
       var aTr = document.getElementsByTagName('tr');

       for(var i=0; i<aTr.length; i++) {
           if(i % 2 == 0) {
               aTr[i].style.background = '#DBDBDB';
           } else {
               aTr[i].style.background = '#F0F0EE';
           }
       }

   };
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-key"></span> 小组列表</strong>
		</div>
		<div class="body-content">
			<span></span>
			<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

				<tr>
					<td colspan="6" align="center" bgcolor="#007fff" class="tablestyle_title" style="text-align: center;">小组详情如下 </td>
				</tr>
				
				<tr>
					<td width="9%" height="20" align="center" bgcolor="#ffffff">小组标号</td>
					<td width="9%" height="20" align="center" bgcolor="#ffffff">小组名称</td>
					<td width="9%" height="20" align="center" bgcolor="#ffffff">组长</td>
					<td width="9%" height="20" align="center" bgcolor="#ffffff">技术组长</td>
					<td width="9%" height="20" align="center" bgcolor="#ffffff">操作</td>
				</tr>
				<c:forEach items="${groupList }" var="g">
				
					<tr>
						<td >${g.gid }</td>
						<td >${g.gname }</td>
					<c:forEach items="${stuList }" var="s">
						 <c:if test="${g.slist.get(0).sid== s.sid}">
						     <td >${s.sname }</td>
						 </c:if>
						 <c:if test="${g.slist.get(1).sid== s.sid}">
						     <td >${s.sname }</td>
						 </c:if>
					</c:forEach>
					  <td>
					 <a href="servlet/GroupServlet?method=deleteGroup&gid=${g.gid }">删除</a>&nbsp;
				     <a href="servlet/GroupServlet?method=showById&gid=${g.gid }">修改</a>&nbsp;
					 </td>
					</tr>
				</c:forEach>
				${error }
			</table>
		</div>
	</div>
</body>
</html>
