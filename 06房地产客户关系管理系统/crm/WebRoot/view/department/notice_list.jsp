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
	 	window.location="servlet/DepartmentServlet?method=toAddNotice";
		
	}

</script>
</head>

	<body>
	
	<form action="servlet/DepartmentServlet?method=findNotice"  method="post">
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
										<td class="STYLE4">&nbsp;&nbsp;请选择查询方式：
										<c:if test=""></c:if>
											<select name="a" style="width: 100px">
      											<option value="1" >公告编号</option>
      											<option value="2">公告主题</option>
     				 							<option value="3">公告内容</option>
   				 							</select>            
   										</td>
										<td class="STYLE4" align="center">
											&nbsp;&nbsp;请输入查询内容：
											
											<input type="text" name="b" style="width: 290px" />
											
											
										</td>
										<td class="STYLE4">
											&nbsp;&nbsp;
											<input type="submit" value="查询" style="width: 50px" />
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
											bgcolor="#FFFFFF" style="width: 5%; height: 22px;">
											<div align="center">
												<span class="STYLE1">公告编号</span>
											</div>
										</td>
										<td background="resource/images/bg2.gif"
											bgcolor="#FFFFFF" style="width: 5%; height: 22px;">
											<div align="center">
												<span class="STYLE1">公告人</span>
											</div>
										</td>
										<td background="resource/images/bg2.gif"
											bgcolor="#FFFFFF" style="width: 10%; height: 22px;">
											<div align="center">
												<span class="STYLE1">公告主题</span>
											</div>
										</td>
										<td background="resource/images/bg2.gif"
											bgcolor="#FFFFFF" style="width:45%; height: 22px;">
											<div align="center">
												<span class="STYLE1">公告内容</span>
											</div>
										</td>
										<td background="resource/images/bg2.gif"
											bgcolor="#FFFFFF" style="width: 10%; height: 22px;">
											<div align="center">
												<span class="STYLE1">公告时间</span>
											</div>
										</td>
										<td background="resource/images/bg2.gif"
											bgcolor="#FFFFFF" style="width: 10%; height: 22px;">
											<div align="center">
												<span class="STYLE1">公告截止时间</span>
											</div>
										</td>
										<td background="resource/images/bg2.gif"
											bgcolor="#FFFFFF" style="width: 5%; height: 22px;">
											<div align="center">
												<span class="STYLE1">公告部门</span>
											</div>
										</td>
										<td   width="10%"
											background="resource/images/bg2.gif"
											bgcolor="#FFFFFF" class="STYLE1"
											style="width: 10%; height: 22px;">
											<div align="center">
												基本操作
											</div>
										</td>
									</tr>
				
								
								
								
								
								<c:forEach items="${pageBean.list }" var="no">
									<tr>
										<td height="20" bgcolor="#FFFFFF" style="width: 5%">
											<div align="center" class="STYLE1">
												<div align="center" >
													${no.notice_ID }
												</div>
											</div>
										</td>
										<td height="20" bgcolor="#FFFFFF" style="width: 5%">
											<div align="center">
												<span class="STYLE1">${no.user_ID }</span>
											</div>
										</td>
										<td height="20" bgcolor="#FFFFFF" style="width: 10%">
											<div align="center">
												<span class="STYLE1">${no.notice_item }</span>
											</div>
										</td>
										<td height="80" bgcolor="#FFFFFF" style="width: 45% ">
											<div align="center">
												<span class="STYLE1">${no.notice_content }</span>
											</div>
										</td>
										<td height="20" bgcolor="#FFFFFF" style="width: 10%">
											<div align="center">
												<span class="STYLE1">${no.notice_time }</span>
											</div>
										</td>
										<td height="20" bgcolor="#FFFFFF" style="width: 10%">
											<div align="center">
												<span class="STYLE1">${no.notice_endtime }</span>
											</div>
										</td>
										<td height="20" bgcolor="#FFFFFF" style="width: 5%">
											<div align="center">
												<span class="STYLE1">${no.is_used }</span>
											</div>
										</td>
										<td     height="20" bgcolor="#FFFFFF" style="width: 10%">
											<div align="center">
												<span class="STYLE4"><img src="resource/images/del.gif"
														width="16" height="16" /><a
													href="servlet/DepartmentServlet?method=deleteNotice&notice_ID=${no.notice_ID }">删除</a>
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
    <td height="35" background="resource/images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="resource/images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;共有${ pageBean.totalCount}条记录，当前第 ${ pageBean.index}/${ pageBean.totalPageCount}页</td>
        		
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40" class="STYLE4">
                  	<a href="servlet/DepartmentServlet?method=findNotice&index=1&size=${pageBean.size }">
                 		 首页</a>
                 </td>
                  <td width="45" class="STYLE4">
             	<c:if test="${pageBean.index ==1 }">
    				上一页 
    			</c:if>
    			<c:if test="${pageBean.index !=1 }">
    				<a href="servlet/DepartmentServlet?method=findNotice&index=${pageBean.index-1 }&size=${pageBean.size }">上一页 </a> 
    			</c:if>
                  </td>
                   <td width="95" class="STYLE4"  >
                  <c:if test="${pageBean.totalCount==0}">
                  </c:if>
                  <c:if test="${pageBean.totalCount>0}">
                  <c:forEach items="${pageBean.numbers}" var="number">
    				<c:if test="${number == pageBean.index }">
    					<a href="servlet/DepartmentServlet?method=findNotice&index=${number }">[${number }]</a> 
    				</c:if>
    				<c:if test="${number != pageBean.index }">
    					<a href="servlet/DepartmentServlet?method=findNotice&index=${number }">${number }</a> 
    				</c:if>	
    			</c:forEach> 
                  </c:if>
                  </td>
                   <td width="45" class="STYLE4">
                 <c:if test="${pageBean.index == pageBean.totalPageCount }">
    				下一页
    			</c:if>   			
    			<c:if test="${pageBean.index != pageBean.totalPageCount }">
    				<a href="servlet/DepartmentServlet?method=findNotice&index=${pageBean.index+1}&size=${pageBean.size }">下一页</a> 
    			</c:if>  
    			</td>  
                  <td width="40">
                  <a href="servlet/DepartmentServlet?method=findNotice&index=${pageBean.totalPageCount }&size=${pageBean.size }">
             		    末页
                  </a></td><td class="STYLE4">
        			每页
    			<select  onchange="changeSize(this.value)"  >
    				<c:forEach begin="2" end="10" step="2" var="i">
    					<c:if test="${i==pageBean.size }">
    						<option  value="${i }" selected="selected">${i }</option>
    					</c:if>
    					<c:if test="${i!=pageBean.size }">
    						<option value="${i }">${i }</option>
    					</c:if>
    				</c:forEach>
    			</select>
    			
    			条记录
    			<script type="text/javascript">
   	function changeSize(size){
   		//alert(size);
   		location.href="servlet/DepartmentServlet?method=findNotice&size="+size;
   	}
   </script>
    			</td>
                  <td width="100"><div align="center"><span class="STYLE1">跳转到第
                    <input  type="text" id="index" size="5" style="height:12px; width:20px; border:1px solid #999999;" /> 
                    页 </span></div></td>
                  <td width="40"><a href="servlet/DepartmentServlet?method=findNotice&index=${pageBean.totalPageCount }&size=${pageBean.size }">
             		    go
                  </a></td>
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
