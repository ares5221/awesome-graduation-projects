<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			height: 20px ;
			padding-top: 5px;
			padding-right: 20px;
			width: auto;
		}
		
	</style>
	
	<script type="text/javascript">
		// 隔行变色
		$(function (){
	           var aTr = document.getElementsByTagName('tr');

	           for(var i=0; i<aTr.length; i++) {
	               if(i % 2 == 0) {
	                   aTr[i].style.background = '#DBDBDB';
	               } else {
	                   aTr[i].style.background = '#F0F0EE';
	               }
	           }
	           
	           /* $.ajax({
		   			url: "servlet/StudentServlet?method=findAllClazz",
		   			type: "post",
		   			dataType: "text",
		   			success: function(data) {
		   				alert(data);
		   				eval("var arr = " + data);
		   			}
	     		}); */
		  });
	     
	     // 下载作业
	     function download(rid, hid) {
	    	 location.href = "servlet/StudentServlet?method=download&rid="+ rid +"&hid=" + hid;
	     }
	</script>
</head>
<body>
<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 提交作业</strong>
		</div>
		<div class="body-content">
			<form action="servlet/StudentServlet?method=uploadFile" method="post" class="form-x" id="inform" enctype="multipart/form-data">
				<div class="form-group" >
					<div class="label">
						<label for="sitename">作业标题：</label>
					</div>
					
				<input type="file" name="work" value="选择文件" />
					<select name="hid" id="hid">
						<c:forEach var="work" items="${lwork }">
							<option value="${work.hid }" style="height: 30px; width: 60px; line-height: 30px;">${work.hname }</option>
						</c:forEach>
					</select>
						<button class="button bg-main icon-check-square-o" type="submit" >
							上传</button>
							<!-- 上传标志信息  成功、错误信息-->
						<span>${flag }</span>
				</div>
			</form>
			
			<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

				<tr>
					<td colspan="10" align="center" bgcolor="#EEEEEE" class="tablestyle_title" style="text-align: center;">您已提交的作业有 </td>
				</tr>
				
				<tr style="backgroud-color: #EEEEEE">
					<td width="9%" align="center" bgcolor="#EEEEEE">账号</td>
					<td width="9%" height="20" align="center" bgcolor="#EEEEEE">姓名</td>
					<td width="9%" align="center" bgcolor="#EEEEEE">班级编号</td>
					<td width="9%" align="center" bgcolor="#EEEEEE">班级名称</td>
					<td width="8%" align="center" bgcolor="#EEEEEE">提交时间</td>
					<td width="7%" align="center" bgcolor="#EEEEEE">文件名</td>
					<td width="7%" align="center" bgcolor="#EEEEEE">下载</td>
					<!-- <td>账号</td>
					<td>姓名</td>
					<td>编号</td>
					<td>排名</td>
					<td>提交时间</td>
					<td>文件名</td>
					<td>下载</td> -->
				</tr>
				<c:forEach var="record" items="${lrecord }">
					<tr>
						<td>${record.sid }</td>
						<td>${user.sname }</td>
						<td>${user.clazz.cid }</td>
						<td>
							<c:forEach var="c" items="${lclazz }">
								<c:if test="${user.clazz.cid == c.cid }">
									${c.cname }
								</c:if>
							</c:forEach>
						</td>
						<td>${record.submitTime }</td>
						<td>${record.fileName }</td>
						<td><a href="javascript:download(${record.rid },${record.hid });">下载</a></td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
	</div>
</body>
</html>
