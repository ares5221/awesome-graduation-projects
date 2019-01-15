<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询并显示所有学生信息</title>
    
	<style type="text/css">
			<!-- body {
				margin-left: 0px;
				margin-top: 0px;
				margin-right: 0px;
				margin-bottom: 0px;
			}
			.tabfont01 {
				font-family: "宋体";
				font-size: 9px;
				color: #555555;
				text-decoration: none;
				text-align: center;
			}
			.font051 {
				font-family: "宋体";
				font-size: 12px;
				color: #333333;
				text-decoration: none;
				line-height: 20px;
			}
			.font201 {
				font-family: "宋体";
				font-size: 12px;
				color: #FF0000;
				text-decoration: none;
			}
			.button {
				font-family: "宋体";
				font-size: 14px;
				height: 37px;
			}
			html {
				overflow-x: auto;
				overflow-y: auto;
				border: 0;
			}
			-->
		</style>

		<link href="css2/css.css" rel="stylesheet" type="text/css" />
		<script type="text/JavaScript" src="js/jquery-1.8.2.js"></script>
		<link href="css2/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	function changeIndex(size){
		var index = document.getElementById("sindex").value;
		change(index,size);
	}
	
	function change(index,size){
		document.forms[0].index.value=index;
		document.forms[0].size.value=size;
		document.forms[0].submit();
	}
	
	function clearFom(){
		document.getElementById("sid").value = "";
		document.getElementById("sname").value = "";
		document.getElementById("fom").submit();
	}
	</script>
  </head>
  
  	<body>
		<form name="fom" id="fom" method="post" action="servlet/StudentServlet?method=show">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td height="30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="62" background="images/nav04.gif">

									<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td width="24"><img src="images/ico07.gif" width="20" height="18" /></td>
									   			<td>
													<span class="newfont06">学号 : </span>
													<input name="sid" id="sid" type="text" size="12" value="${sid }" />
													<span class="newfont06">姓名 : </span>
													<input name="sname" id="sname" type="text" size="12" value="${sname }" />
													<input name="Submit" type="submit" class="right-button02" value="查 询" />
													<input name="Submit" type="button" class="right-button02" value="清 空" onclick="clearFom()" />
													<input type="hidden" name="index" id="index">
								   					<input type="hidden" name="size" id="size">
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td height="40" class="font42">
												<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

													<tr>
														<td height="20" colspan="15" align="center" bgcolor="#EEEEEE" class="tablestyle_title" style="text-align: center;"> 学生列表 </td>
													</tr>
													<tr>
														<td width="6%" align="center" bgcolor="#EEEEEE">学生编号</td>
														<td width="9%" height="20" align="center" bgcolor="#EEEEEE">姓名</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">身份证</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">出生日期</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">家庭地址</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">更新操作</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">删除操作</td>
													</tr>
													
													<c:forEach items="${pageBean.list}" var="stu">
											    		<tr height="25" align="center" bgcolor="#EEEEEE" style="text-align: center;">
											    			<td>${stu.sid }</td>
											    			<td>${stu.sname }</td>
											    			<td>${stu.idCard }</td>
											    			<td>${stu.birth }</td>
											    			<td>${stu.address }</td>
											    			<td><a href="servlet/StudentServlet?method=toUpdate&sid=${stu.sid }">更新</a></td>
											    			<td><a href="servlet/StudentServlet?method=delete&sid=${stu.sid }">删除</a></td>
											    		</tr>
											    	</c:forEach>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							
						</table>
						
						<TR>
    		<td colspan="11" align="center">
    					<a href="javascript:change(1,${pageBean.size })">首页</a>
    				<c:if test="${pageBean.index ==1 }">
    						上一页
    				</c:if>
    				<c:if test="${pageBean.index!=1 }">    						
    						<a href="javascript:change(${pageBean.index-1 },${pageBean.size })">上一页</a>
    				</c:if>
    				<c:forEach items="${pageBean.numbers }" var="i">
    						<c:if test="${pageBean.index != i }">
    							<a href="javascript:change(${i },${pageBean.size })">${i }</a>
    						</c:if>
    						<c:if test="${pageBean.index ==i }">    						
    							<a href="javascript:change(${i },${pageBean.size })">[${i }]</a>
    						</c:if>
    				</c:forEach>
    				
    					<c:if test="${pageBean.index ==pageBean.totalPageCount }">
    						下一页
    				</c:if>
    				<c:if test="${pageBean.index!=pageBean.totalPageCount}">    					
    							<a href="javascript:change(${pageBean.index+1 },${pageBean.size })">下一页</a>
    				</c:if>
    				
    				<a href="javascript:change(${pageBean.totalPageCount },${pageBean.size })">末页</a>
    				 每页
    				 <select onchange="change(1,this.value)">
    				 		<c:forEach begin="5" end="25" step="5" var="i">
    				 			<c:if test="${i != pageBean.size }">
    				 					<option value="${i }">${i }</option>
    				 			</c:if>
    				 			<c:if test="${i==pageBean.size }">
    				 					<option value="${i }" selected="selected">${i }</option>
    				 			</c:if>	
    				 		</c:forEach>
    				 </select>
    				 条记录
    				 
    				直接跳到第<input type="text" name="sindex" id="sindex" size="5px">页
	    				<input type="button" value="go" onclick="changeIndex(${pageBean.size})" >	
    				共${pageBean.totalCount }条记录
    		</td>
   
			</table>
		</form>
  
  </body>
</html>

