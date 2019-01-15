<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">


		<title>My JSP 'customerCondition_list.jsp' starting page</title>
		  <meta http-equiv="content-type" content="text/html; charset=UTF-8" >  
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

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
	a{
	text-decoration: none;
	color: #033d61;
	font-size: 12px;
}

A:hover {
	COLOR: #f60; TEXT-DECORATION: underline
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
			window.location="view/customer/customer_type_add.jsp";
		}

</script>
<script type="text/javascript" src="/Estate/js/jquery-1.8.2.js"></script>
<script type="text/javascript">

	function show(index){
		var typeName = $("#typeName").val();
		window.location.href = "servlet/CustomerTypeServlet?method=find&index="+index+"&typeName="+typeName;
	}
	
	function go(){
		var index = $("#goNum").val();
		if(isNaN(index)){
			alert("请输入数字");
			return ;
		}
		if(index<1||index>${pageBean.totalPageCount}){
			alert("请输入范围内数字");
			return;
		}
		
		show(index);
	}
	
	function deletect(typeId){
		window.location.href = "servlet/CustomerTypeServlet?method=delete&typeId="+typeId;
	}
	

</script>

</head>

	<body>
	
	
	<form action="servlet/CustomerTypeQueryServlet"  method="post">
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
											&nbsp;&nbsp;请输入客户类型：
											<input type="text" name="typeName" id = "typeName" value="${typeName }" style="width: 290px" />
										</td>
										<td class="STYLE4">
											&nbsp;&nbsp;
											<input type="button" value="查询" onclick="show(1)" style="width: 50px" />
										</td>
										<td class="STYLE4">
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
											bgcolor="#FFFFFF" style="width: 3%; height: 22px;">
											<div align="center">
												<span class="STYLE1">序号</span>
											</div>
										</td>
										<td background="resource/images/bg2.gif"
											bgcolor="#FFFFFF" style="width: 85%; height: 22px;">
											<div align="center">
												<span class="STYLE1">客户类型</span>
											</div>
										</td>
										<td     width="10%"
											background="resource/images/bg2.gif"
											bgcolor="#FFFFFF" class="STYLE1"
											style="width: 9%; height: 22px;">
											<div align="center">
												基本操作
											</div>
										</td>
									</tr>
									
									
									
								<c:forEach items="${pageBean.list }" var="customerType">
										
										<tr>
										<td height="20" bgcolor="#FFFFFF" style="width: 3%">
											<div align="center" class="STYLE1">
												<div align="center">
													${customerType.typeId }
												</div>
											</div>
										</td>
										<td height="20" bgcolor="#FFFFFF" style="width: 4%">
											<div align="center">
												<span class="STYLE1">${customerType.typeName }</span>
											</div>
										</td>
										<td      height="20" bgcolor="#FFFFFF" style="width: 9%">
											<div align="center">
												<span class="STYLE4"><img src="resource/images/del.gif"
														width="16" height="16" /><a
													href="javascript:deletect(${customerType.typeId })">删除</a>
												</span>
											</div>
										</td>
									</tr>
									
										
										
								</c:forEach>

								</table>
							</td>	
							<td width="8"
								background="resource/images/tab_15.gif">
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
											&nbsp;&nbsp;共有${pageBean.totalCount }条记录，当前第 ${pageBean.index }/${pageBean.totalPageCount } 页
										</td>
										<td>
											<table border="0" align="right" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="40">
													
														<img src="resource/images/first.gif" onclick="show(1)" width="37" height="15" />
													
														
													</td>
													<td width="45">
													<c:if test="${pageBean.index!=1 }">
														<img src="resource/images/back.gif" onclick="show(${pageBean.index-1})" width="43" height="15" />
													</c:if>
													<c:if test="${pageBean.index==1 }">
														<img src="resource/images/back.gif" width="43" height="15" />
													</c:if>
													
													</td>
													<td width="45">
														<c:if test="${pageBean.index!=pageBean.totalPageCount }">
															<img src="resource/images/next.gif" onclick="show(${pageBean.index+1})" width="43" height="15" />
														</c:if>
														
														<c:if test="${pageBean.index==pageBean.totalPageCount }">
															<img src="resource/images/next.gif"  width="43" height="15" />
														</c:if>
														
													</td>
													<td width="40">
													
													
														<img src="resource/images/last.gif" onclick="show(${pageBean.totalPageCount})" width="37" height="15" />
														
														
														
													</td>
													<td width="100">
														<div align="center">
															<span class="STYLE1">转到第 <input name="textfield" id = "goNum" type="text" size="4" style="height: 18px; width: 20px; border: 1px solid #999999;" />
																页 </span>
														</div>
													</td>
													<td width="40">
														<img src="resource/images/go.gif" width="37" onclick="go()"
															height="15" />
													</td>
												</tr>
											</table>
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
