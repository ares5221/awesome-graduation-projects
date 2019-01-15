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
       
    // 下载作业
     function download(rid, hid) {
    	 location.href = "servlet/StudentServlet?method=download&rid="+ rid +"&hid=" + hid;
     }
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-key"></span> 收取作业</strong>
		</div>
		<div class="body-content">
			<%-- <span>请选择要收取的作业:</span>
			<select name="selwork">
				<option>--请选择--</option>
				<c:forEach var="work" items="${lwork }">
					<option value="${work.hid }">${work.hname }</option>
				</c:forEach>
			</select>
			&nbsp;&nbsp;<span><a href="javascript:">查询</a></span> --%>
			<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

				<tr>
					<td colspan="10" align="center" bgcolor="#EEEEEE" class="tablestyle_title" style="text-align: center;">作业已上传的有以下同学 </td>
				</tr>
				
				<tr>
					<td width="10%" align="center" bgcolor="#EEEEEE">选择</td>
					<td width="10%" height="20" align="center" bgcolor="#EEEEEE">作业名称</td>
					<td width="10%" align="center" bgcolor="#EEEEEE">所有者</td>
					<td width="20%" align="center" bgcolor="#EEEEEE">上传日期</td>
					<td width="10%" align="center" bgcolor="#EEEEEE">作业编号</td>
					<td width="30%" align="center" bgcolor="#EEEEEE">文件名</td>
					<td width="10%" align="center" bgcolor="#EEEEEE">下载</td>
				</tr>
				<c:forEach var="record" items="${lrecord }" varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>
							<c:forEach var="work" items="${lwork }">
								<c:if test="${record.hid==work.hid }">
									${work.hname }
								</c:if>
							</c:forEach>
						</td>
						<td>
							<c:forEach var="stu" items="${lstu }">
								<c:if test="${record.sid==stu.sid }">
									${stu.sname }
								</c:if>
							</c:forEach>
						</td>
						<td>${record.submitTime }</td>
						<td>${record.rid }</td>
						<td>${record.fileName }</td> 
						<td><a href="javascript:download(${record.rid },${record.hid });">下载</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>