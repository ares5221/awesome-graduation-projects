<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
       
       function changeType(value){
    	   location.href="servlet/RankingServlet?method=groupRanking&hid="+value;
       }

		
       
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-key"></span>小组排名</strong>
		</div>
		<div class="body-content">
			<span>请选择要查看排名的作业:</span>
			<select name="selwork" onchange="changeType(this.value)">
			<option value="1">请选择</option>
			<c:forEach items="${workList }" var="work">
				<c:if test="${selectedid == work.hid}">
					<option value="${work.hid }" selected="selected" >${work.hname }</option>
				</c:if>
				<c:if test="${selectedid != work.hid}">
					<option value="${work.hid }"  >${work.hname }</option>
				</c:if>
			</c:forEach>
			</select>
			<br /><br />
			<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

				<tr>
					<td colspan="7" align="center" bgcolor="#EEEEEE" class="tablestyle_title" style="text-align: center;">详情如下 </td>
				</tr>
				
				<tr>
					<td width="9%" height="20" align="center" bgcolor="#EEEEEE">排名</td>
					<td width="8%" align="center" bgcolor="#EEEEEE">作业编号</td>
					<td width="9%" align="center" bgcolor="#EEEEEE">小组名</td>
					<td width="9%" align="center" bgcolor="#EEEEEE">组长</td>
					<td width="9%" align="center" bgcolor="#EEEEEE">技术组长</td>
					<td width="8%" align="center" bgcolor="#EEEEEE">提交日期</td>
					
					
				</tr>
				<c:forEach items="${stuList }" var="list" varStatus="vs">
					<tr>
						<td >${vs.count }</td>
						<td >${list.work.hid }</td>
						<td >${list.group.gname }</td>
						<td ><c:forEach items="${groupList }" var="groupList"><c:if test="${groupList.gid==list.group.gid }">${groupList.name1 }</c:if></c:forEach>  </td>
						<td ><c:forEach items="${groupList }" var="groupList"><c:if test="${groupList.gid==list.group.gid }">${groupList.name2 }</c:if></c:forEach>  </td>
						<td >${list.record.submitTime }</td>
						
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>

				