<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	// 隔行变色
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
       
       function deleteInf(iid){
			var flag = window.confirm("确认删除吗？");
			if(flag){
				location.href="servlet/InformServlet?method=delete&iid="+iid;
			}
		}
</script>
</head>
<body>
<form method="post" class="form-x" id="inform" action="servlet/InformServlet?method=findInform" onsubmit="return checkinform()">
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-key"></span>公告列表</strong>
		</div>
			<br />
			<table width="100%" border="0" cellpadding="10" cellspacing="1" bgcolor="#464646" class="newfont03">

				<tr>
					<td colspan="6" align="center" bgcolor="#EEEEEE" class="tablestyle_title" style="text-align: center;">详情如下 </td>
				</tr>
				
				<tr>
					<td width="9%" height="20" align="center" bgcolor="#EEEEEE">标题</td>
					
					<td width="8%" align="center" bgcolor="#EEEEEE">提交日期</td>
					<td width="8%" align="center" bgcolor="#EEEEEE">操作</td>
					
				</tr>
				<c:forEach items="${list }" var="inform">
				<tr>
					<td ><a href="servlet/InformServlet?method=findById&iid=${inform.iid}&title=${inform.title }" target="right">${inform.title }</a></td>
					<td >${inform.date }</td>
					<td><a href="javascript:deleteInf(${inform.iid })">删除</a></td>
				</tr>
				</c:forEach>
			</table>
	
	</div>
	</form>
</body>
</html>

				