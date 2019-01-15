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
    
    <title>学生登记信息查询</title>
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
			document.getElementById("oper").value = 0;
			document.getElementById("sname").value = "";
			document.getElementById("enterScore").value = "";
			document.getElementById("fom").submit();
		}
		
		function checkOper(){
			var enterScore = $("#enterScore").val().trim();
			var oper = $("#oper").val();
			if(isNaN(enterScore)||enterScore>100){
				alert("请输入合法的分数!");
			}
			if(enterScore != ""&&enterScore != null){
				if(oper == 0){
					alert("请选择运算符！");
				}
			}
		}
	</script>
  </head>
  
  <body> 
  	<form name="fom" id="fom" method="post" action="servlet/StudentServlet?method=showCheckedIn">
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
									   				<span class="newfont06">学生姓名 : </span>
										   				<input type="text" name="sname" id="sname" size="12" value="${sname }">
										   			<span class="newfont06">学生分数 : </span>
										   				<select name="oper" id="oper">
															<option value="0">--请选择运算符--</option>
																<c:if test="${oper==1 }">
																	<option value="1" selected="selected">&gt;</option>
																</c:if>
																<c:if test="${oper!=1 }">
																	<option value="1">&gt;</option>								
																</c:if>
																<c:if test="${oper==2 }">
																	<option value="2" selected="selected">&lt;</option>
																</c:if>
																<c:if test="${oper!=2 }">
																	<option value="2">&lt;</option>						
																</c:if>
																<c:if test="${oper==3 }">
																	<option value="3" selected="selected">=</option>
																</c:if>
																<c:if test="${oper!=3 }">
																	<option value="3">=</option>						
																</c:if>
																<c:if test="${oper==4 }">
																	<option value="4" selected="selected">&gt;=</option>
																</c:if>
																<c:if test="${oper!=4 }">
																	<option value="4">&gt;=</option>						
																</c:if>
																<c:if test="${oper==5 }">
																	<option value="5" selected="selected">&lt;=</option>
																</c:if>
																<c:if test="${oper!=5 }">
																	<option value="5">&lt;=</option>						
																</c:if>
														</select>
														
														<input type="text" name="enterScore" id="enterScore" size="12" value="${enterScore }" onblur="checkOper();">
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
														<td width="9%" align="center" bgcolor="#EEEEEE">班级</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">专业</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">入学时间</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">入学分数</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">入学经办人</td>
														<td width="9%" align="center" bgcolor="#EEEEEE">删除操作</td>
													
													<c:forEach items="${pageBean.list}" var="stu">
											    		<tr height="25" align="center" bgcolor="#EEEEEE" style="text-align: center;">
											    			<td>${stu.sid }</td>
											    			<td>${stu.sname }</td>
											    			<td>
											    				<c:forEach items="${claList }" var="clazz">
											    					<c:if test="${clazz.classId ==stu.classId}">
											    						${clazz.className }
											    					</c:if>
											    				</c:forEach>
											    			</td>
											    			<td>${stu.majorName }</td>
											    			<td>${stu.checkDate }</td>
											    			<td>${stu.enterScore }</td>
											    			<td>${user.userName }</td>
											    			<td><a href="servlet/StudentServlet?method=deleteCheckedIn&sid=${stu.sid }">删除</a></td>
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

