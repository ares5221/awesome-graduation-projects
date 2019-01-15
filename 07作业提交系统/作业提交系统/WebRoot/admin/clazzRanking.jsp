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
<title>班级排名</title>
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
    	   location.href="servlet/RankingServlet?method=clazzRanking&hid="+value;
       }

		function changeIndex(size){
			var index = document.getElementById("indexn").value;
			//location.href="/stumanager0/servlet/ShowAllServlet?index="+index+"&size="+size;
			change(index,size);
		}
		
		/* function changeSize(size){
			location.href="/stumanager0/servlet/ShowAllServlet?index=1&size="+size;
		} */
		
		function change1(index,size){
			//location.href="/stumanager0/servlet/ShowAllServlet?index="+index+"&size="+size;
			document.forms[0].action="servlet/ShowAllServlet?index="+index+"&size="+size;
			//提交表单
			document.forms[0].submit();
		}
		
		function change(index,size){
			location.href="/work/servlet/RankingServlet?method=clazzRanking&index="+index+"&size="+size;
			
		}
       
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-key"></span>班级排名</strong>
		</div>
		<div class="body-content">
			<label for="sitename">&nbsp;&nbsp;请选择要查看排名的作业:</label>
			<span></span>
			<select name="selwork" onchange="changeType(this.value)">
			<%-- <option value="${work.hid }" <c:if test="${shid == work.hid }">selected="selected"</c:if>>${work.hname }</option> --%>
			<option value="0">请选择</option>
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
					<td colspan="6" align="center" bgcolor="#EEEEEE" class="tablestyle_title" style="text-align: center;">详情如下 </td>
				</tr>
				
				<tr>
					<td width="9%" height="20" align="center" bgcolor="#EEEEEE">排名</td>
					<td width="9%" height="20" align="center" bgcolor="#EEEEEE">姓名</td>
					<td width="8%" align="center" bgcolor="#EEEEEE">作业编号</td>
					<td width="8%" align="center" bgcolor="#EEEEEE">提交日期</td>
					<td width="20%" height="20" align="center" bgcolor="#EEEEEE">文件名</td>
					<td width="9%" align="center" bgcolor="#EEEEEE">所属小组</td>
				</tr>
				<c:forEach items="${pageBean.list}" var="stu" varStatus="vs">
					<tr>
						<td >${(pageBean.index-1)*pageBean.size+vs.count}</td>
						<td >${stu.sname }</td>
						<td >${stu.work.hid }</td>
						<td >${stu.record.submitTime }</td>
						<td >${stu.record.fileName }</td>
						<td height="20" >${stu.group.gname}</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="11">
						<a href="javascript:change(1,${pageBean.size })">首页&nbsp;</a>
	    		<c:if test="${pageBean.index!=1}">
	    			<a href="javascript:change(${pageBean.index-1 },${pageBean.size })">上一页&nbsp;</a>
	    		</c:if>
	    		<c:if test="${pageBean.index==1 }">
	    			上一页&nbsp;
	    		</c:if>
	    		
    			<c:forEach items="${pageBean.numbers }" var="num">
    				<c:if test="${num==pageBean.index }">
    					<a href="javascript:change(${num },${pageBean.size })">[${num }]&nbsp;</a>
    				</c:if>
    				<c:if test="${num!=pageBean.index }">
    					<a href="javascript:change(${num },${pageBean.size })">${num }&nbsp;</a>
    				</c:if>
    			</c:forEach>
    			<a href="javascript:change(${pageBean.totalPageCount },${pageBean.size })">末页&nbsp;</a>
    			<c:if test="${pageBean.index!=pageBean.totalPageCount}">
	    			<a href="javascript:change(${pageBean.index+1 },${pageBean.size })">下一页&nbsp;</a>
	    		</c:if>
	    		<c:if test="${pageBean.index==pageBean.totalPageCount }">
	    			下一页&nbsp;
	    		</c:if>
    			  每页  
    			 <select onchange="change(1,this.value)">
    			 	<c:forEach begin="5" end="25" step="5" var="i">
	    			 	<c:if test="${pageBean.size==i }">
	    			 		<option value="${i }" selected="selected">${i }</option>
	    			 	</c:if>
	    			 	<c:if test="${pageBean.size!=i }">
	    			 		<option value="${i }" >${i }</option>
	    			 	</c:if>
	    			 </c:forEach>
    			 </select> 
    			   条记录 直接跳到第  
    			  <input type="text" id="indexn" size="1" />页
    			  <input type="button" value="go" onclick="changeIndex(${pageBean.size });"/>
 共${pageBean.totalCount }条记录
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>

				
