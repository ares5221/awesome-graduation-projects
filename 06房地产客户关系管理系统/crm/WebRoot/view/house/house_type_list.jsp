<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">


		<title>My JSP 'customerCondition_list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px
}

	a{
	text-decoration: none;
	color: #033d61;
	font-size: 12px;
}

A:hover {
	COLOR: #f60; TEXT-DECORATION: underline
}


.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>

		<script>
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

</script>

<script type="text/javascript">
	function add(){  
			window.location="view/house/house_type_add.jsp";
		}

</script>
</head>

	<body>
	
	
	<form action="servlet/HouseServlet?method=findType"  method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" background="resource/images/tab_05.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30">
								<img src="resource/images/tab_03.gif" width="12"
									height="30" />
							</td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="STYLE4" align="center">
											&nbsp;&nbsp;请输入房屋类型名称：
											<input type="text" name="houseInput" style="width: 290px" value="${houseInput }" id="houseInput"/>
										</td>
										<td class="STYLE4">
											&nbsp;&nbsp;
											<input type="submit" value="查询" style="width: 50px" />
										</td>
										<td  class="STYLE4">
											&nbsp;&nbsp;
											<input type="button" value="添加" onclick="add()" style="width: 50px" />
										</td>
									</tr>
								</table>
							</td>
							<td width="16">
								<img src="resource/images/tab_07.gif" width="16"
									height="30" />
							</td>
						</tr>
					</table>
				</td>
			</tr>


			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="8"
								background="resource/images/tab_12.gif">
								&nbsp;
							</td>
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="1"
									bgcolor="b5d6e6" onmouseover="changeto()"
									onmouseout="changeback()">
									<tr>
										<td width="5%"
											background="resource/images/bg2.gif"
											bgcolor="#FFFFFF" style="width: 5%; height: 22px;">
											<div align="center">
												<span class="STYLE1">序号</span>
											</div>
										</td>
										<td background="resource/images/bg2.gif"
											bgcolor="#FFFFFF" style="width: 85%; height: 22px;">
											<div align="center">
												<span class="STYLE1">房屋类型名称</span>
											</div>
										</td>
										<td      width="10%"
											background="resource/images/bg2.gif"
											bgcolor="#FFFFFF" class="STYLE1"
											style="width: 10%; height: 22px;">
											<div align="center">
												基本操作
											</div>
										</td>
									</tr>
				
									<c:forEach items="${pageBean.list}" var="type">
													<tr>
														<td height="20" bgcolor="#FFFFFF" style="width: 5%">
															<div align="center" class="STYLE1">
																<div align="center">
																	${type.type_ID }
																</div>
															</div>
														</td>
														<td height="20" bgcolor="#FFFFFF" style="width: 85%">
															<div align="center">
																<span class="STYLE1">${type.type_name }</span>
															</div>
														</td>
														<td      height="20" bgcolor="#FFFFFF" style="width: 10%">
															<div align="center">
																<span class="STYLE4"><img src="resource/images/del.gif"
																		width="16" height="16" /><a
																	href="javascript:deleteType(${type.type_ID })">删除</a>
																</span>
															</div>
														</td>
													</tr>
									</c:forEach>
									
									
								</table>
								<script type="text/javascript">
								
										function deleteType(type_ID){
												var flag=window.confirm("确认要删除此条记录吗");
												if(flag){
														
														location.href="servlet/HouseServlet?method=deleteType&type_ID="+type_ID;
												
												}
										
										
										}
								
								
								
								
								</script>
							</td>	
							<td width="8"
								background="http://localhost:8080/crm/resource/images/tab_15.gif">
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td height="35" background="resource/images/tab_19.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35">
								<img src="resource/images/tab_18.gif" width="12"
									height="35" />
							</td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="STYLE4">
											&nbsp;&nbsp;共有 
											
											
											  ${pageBean.totalCount }
											
											
											 条记录，当前第
											 
											 
											  ${pageBean.index}
											  
											  
											  /
											  
											  
											 <font id="totalPageCount1">${pageBean.totalPageCount }</font>	
											  
											  
											   页
										</td>
										<td>
											
												 
												 <font size="1px">每页</font>
											    		 <select id="size" onchange="changeIndex1(this.value)" >
											    		 
													    		 <c:forEach begin="2" end="10" step="2" var="i">
													    		 	<c:if test="${i==pageBean.size }">
													    		 		<option value="${i }" selected="selected">${i }</option>
													    		 	</c:if>
													    		 	<c:if test="${i!=pageBean.size }">
													    		 		<option value="${i }" >${i }</option>
													    		 	</c:if>
													    		 </c:forEach>
											    		 
											    		 </select>
										</td>
										
										<td>
											<table border="0" align="right" cellpadding="0"
												cellspacing="0">
												<tr>
													<td>
																<a href="servlet/HouseServlet?method=findType&index=1&size=${pageBean.size}&houseInput=${houseInput}">首页</a>
																
									    							<c:if test="${pageBean.index!=1 }">
										    							<a href="servlet/HouseServlet?method=findType&index=${pageBean.index-1 }&size=${pageBean.size}&houseInput=${houseInput}">上一页</a>
									    							</c:if>
									    							
									    							<c:if test="${pageBean.index==1 }">
										    							<font size="1px">上一页</font>
									    							</c:if>
									    							
											    					<c:forEach items="${pageBean.numbers }" var="num">
									    									<c:if test="${num==pageBean.index}">
											    			
											    							[<a href="servlet/HouseServlet?method=findType&index=${num }&size=${pageBean.size}&houseInput=${houseInput}">${num }</a>]
									    									</c:if>
									    									<c:if test="${num!=pageBean.index}">
											    			
											    							<a href="servlet/HouseServlet?method=findType&index=${num }&size=${pageBean.size}&houseInput=${houseInput}">${num }</a>
									    									</c:if>
											    					</c:forEach>
											    					
											    					<c:if test="${pageBean.index!=pageBean.totalPageCount }">
										    							<a href="servlet/HouseServlet?method=findType&index=${pageBean.index+1 }&size=${pageBean.size}&houseInput=${houseInput}">下一页</a>
									    							</c:if>
									    							
									    							<c:if test="${pageBean.index==pageBean.totalPageCount }">
										    							
										    							<font size="1px">下一页</font>
									    							</c:if>
									    							
									    							<a href="servlet/HouseServlet?method=findType&index=${pageBean.totalPageCount}&size=${pageBean.size}&houseInput=${houseInput}">末页</a>
										


													</td>
													<td width="100">
														<div align="center">
															<span class="STYLE1">转到第 
															<input name="textfield" type="text" size="4"style="height: 12px; width: 20px; border: 1px solid #999999;" id="indexn" />
																页 </span>
														</div>
													</td>
													<td width="40">
														<input type="button" onclick="changeIndex(${pageBean.size})" value="go">
													</td>
												</tr>
											</table>
											<script type="text/javascript">
														function changeIndex(size){
																	
																			var index=document.getElementById("indexn").value;
																			var c=document.getElementById("totalPageCount1").innerHTML;
																			var houseInput=document.getElementById("houseInput").value;
																			
																		
																			if(index<(c+1)){
																				
																					location.href="servlet/HouseServlet?method=findType&index="+index+"&size="+size+"&houseInput="+encodeURI(encodeURI(houseInput));
																			}
																	
																		
					
																}
																
																function changeIndex1(size){
	
																				var index=document.getElementById("indexn").value;
																				var houseInput=document.getElementById("houseInput").value;
																				
																				location.href="servlet/HouseServlet?method=findType&index="+index+"&size="+size+"&houseInput="+encodeURI(encodeURI(houseInput));
																	
																	}
																
											
											
											
											</script>
										</td>
									</tr>
								</table>
							</td>
							<td width="16">
								<img src="resource/images/tab_20.gif" width="16"
									height="35" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>

