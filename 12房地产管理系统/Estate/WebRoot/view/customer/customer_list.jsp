<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>显示客户信息</title>
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
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
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
<script type="text/javascript" src="/Estate/js/jquery-1.8.2.js"></script>
<script type="text/javascript">
	function add(){  
		// window.location="view/customer/customer_add.jsp";
		window.location="servlet/CustomerServlet?method=toAdd";
		
	}
	
	function go(){
		var index = $("#goindex").val();
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
	function show(index){
	 	var customerInput = $("#customerInput").val();
		var queryType = $("#queryType").val();
		window.location.href="servlet/CustomerServlet?method=show&index="+index+"&customerInput="+customerInput+"&queryType="+queryType;
		
	}
	function confirmDelete(customer_id){
		if(window.confirm("您确认要删除该客户吗?")){
			location.href="servlet/CustomerServlet?method=delete&customer_id="+customer_id;
		}
	}
	

</script>
  </head>
  
  <body>
  <form action="servlet/CustomerServlet?method=show" name="fom" id="fom" method="post">
  
  
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="resource/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="resource/images/tab_03.gif" width="12" height="30" /></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4" align="center">&nbsp;&nbsp;请输入查询内容：<input type="text" name="customerInput" id = "customerInput" value="${customerInput }" style="width: 290px"/></td>
            <td class="STYLE4">&nbsp;&nbsp;请选择查询方式：<select name="queryType" id="queryType" style="width: 100px">
      					
      					<c:if test="${queryType eq 'customer_name'}">
      						<option value="customer_name" selected="selected">客户姓名</option>
      					</c:if>
      					
      					<c:if test="${queryType ne 'customer_name' }">
      						<option value="customer_name" >客户姓名</option>
      					</c:if>
      					
      					<c:if test="${queryType eq 'condition_name' }">
      						<option value="condition_name" selected="selected">客户状态</option>
      					</c:if>
      					
      					<c:if test="${queryType ne 'condition_name' }">
      						<option value="condition_name" >客户状态</option>
      					</c:if>
     				 	
     				 	<c:if test="${queryType eq 'source_name' }">
      						<option value="source_name" selected="selected">客户来源</option>
      					</c:if>
      					
      					<c:if test="${queryType ne 'source_name' }">
      						<option value="source_name">客户来源</option>
      					</c:if>
     				 	
     				 	<c:if test="${queryType eq 'type_name' }">
      						<option value="type_name" selected="selected">客户类型</option>
      					</c:if>
      					
      					<c:if test="${queryType ne 'type_name' }">
      						<option value="type_name">客户类型</option>
      					</c:if>
     				 	
     				 	<c:if test="${queryType eq 'user_name' }">
      						<option value="user_name" selected="selected">所属员工</option>
      					</c:if>
      					
      					<c:if test="${queryType ne 'user_name' }">
      						<option value="user_name">所属员工</option>
      					</c:if>
     				 	
     				 	<c:if test="${queryType eq 'customer_company' }">
      						<option value="customer_company" selected="selected">客户公司</option>
      					</c:if>
      					
      					<c:if test="${queryType ne 'customer_company' }">
      						<option value="customer_company">客户公司</option>
      					</c:if>
     				 	
   				 </select>            
   				</td>
            <td class="STYLE4">&nbsp;&nbsp;<input  type="button" value="查询" style="width:50px" onclick="show(1)"/></td>
            <td class="STYLE4">&nbsp;&nbsp;<input  type="button" value="添加"  onclick="add()"  style="width:50px"/></td>            
          </tr>
        </table></td>
        <td width="16"><img src="resource/images/tab_07.gif" width="16" height="30" />
        	 <input type="hidden" name="userId" value="1"  />
        </td>
      </tr>
    </table></td>
  </tr>


    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="resource/images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="5%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">姓名</span></div></td>
            <td width="7%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">状态</span></div></td>
            <td width="7%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">来源</span></div></td>
            <td width="7%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">所属员工</span></div></td>		
			<td width="7%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">类型</span></div></td>
			<td width="4%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">性别</span></div></td>
			<td width="5%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">手机</span></div></td>	
			<td width="5%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">QQ</span></div></td>	
			<td width="6%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">邮箱</span></div></td>
			<td width="6%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">职位</span></div></td>
			<td width="13%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">公司</span></div></td>
			<td width="10%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">备注</span></div></td>
			<td width="18%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
</tr>
	<c:forEach items="${pageBean.list }" var="customer" varStatus="vs">
		<tr>
            <td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${customer.customer_name }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${customer.customerCondition.condition_name}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${customer.customerSource.source_name }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 6%"><div align="center"><span class="STYLE1">${customer.userInfo.user_name}</span></div></td>
			<td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${customer.customerType.typeName }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${customer.customer_sex }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 5%"><div align="center"><span class="STYLE1">${customer.customer_mobile }</a></span></div></td>
			<td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${customer.customer_qq }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 5%"><div align="center"><span class="STYLE1">${customer.customer_email }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${customer.customer_job }</span></div></td>
			<td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${customer.customer_company }</span></div></td>
			<td height="20" bgcolor="#FFFFFF"style="width: 8%"><div align="center"><span class="STYLE1">${customer.customer_remark }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 15%"><div align="center"><span class="STYLE4"><img src="resource/images/edt.gif" width="16" height="16" />
            <a href="servlet/CustomerServlet?method=showEditInfo&customer_id=${customer.customer_id}&isEdit=1">编辑</a>&nbsp; <img src="resource/images/edt.gif" width="16" height="16" />
            <a href="servlet/CustomerServlet?method=showDetails&customer_id=${customer.customer_id}">详情</a>&nbsp; <img src="resource/images/del.gif" width="16" height="16" />
            <a href="javascript:confirmDelete(${customer.customer_id })">删除</a></span></div></td>
          </tr>
       </c:forEach>	   
		 
			
         </table></td>
        <td width="8" background="resource/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
   <tr>
    <td height="35" background="resource/images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="resource/images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;共有${pageBean.totalCount}条记录，当前第 ${pageBean.index}/${pageBean.totalPageCount}页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                 <td width="40">
                  	<img src="resource/images/first.gif" width="37" height="15" onclick="show(1)"/></td>
                  <td width="45">
                  
                  <c:if test="${pageBean.index==1 }">
                  	<img src="resource/images/back.gif" width="43" height="15" /></td>
                  </c:if>
                  
                  <c:if test="${pageBean.index!=1 }">
                  			<img src="resource/images/back.gif" width="43" height="15" onclick="show(${pageBean.index-1})" /></td>
                  </c:if> 
                 
                  <td width="45">
                  
                  	<c:if test="${pageBean.index==pageBean.totalPageCount }">
                  		<img src="resource/images/next.gif" width="43" height="15" /></td>
                  	
                  	</c:if>
                  	
                  	<c:if test="${pageBean.index!=pageBean.totalPageCount }">
                  		<img src="resource/images/next.gif" width="43" height="15" onclick="show(${pageBean.index+1})" /></td>
                  	
                  	</c:if>
                  	
                 	 
                  <td width="40">
                 	 <img src="resource/images/last.gif" width="37" height="15" onclick="show(${pageBean.totalPageCount})" /></td>
                  <td width="100"><div align="center"><span class="STYLE1">转到第
                    <input name="textfield" id = "goindex" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" /> 
                    页 </span></div></td>
                  <td width="40"><img src="resource/images/go.gif" onclick="go()" width="37" height="15" /></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="resource/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
    