<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>显示客户信息</title>
    
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
<script type="text/javascript">
	function add(){  
		window.location="servlet/CustomerServlet?method=toAddCus";
	}

</script>
</script>
<script type="text/javascript">
	function query(){  
		window.location="servlet/CustomerServlet?method=show";
	}

</script>
  </head>
  
  <body>
  <form action="servlet/CustomerServlet?method=show" method="post">
  
  
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="resource/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="resource/images/tab_03.gif" width="12" height="30" /></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4" align="center">&nbsp;&nbsp;请输入查询内容：<input type="text" name="customerInput" style="width: 290px" value="${customerInput }"/></td>
            <td class="STYLE4">&nbsp;&nbsp;请选择查询方式：<select name="queryType" style="width: 100px">
            			<option value="0">--查询方式--</option>
            			<c:if test="${queryType != 1 }">
							<option value="1">客户姓名</option>
						</c:if>
						<c:if test="${queryType == 1 }">
							<option value="1" selected="selected">客户姓名</option>
						</c:if>
						<c:if test="${queryType != 2 }">
							<option value="2">客户状态</option>
						</c:if>
						<c:if test="${queryType == 2 }">
							<option value="2" selected="selected">客户状态</option>
						</c:if>
						<c:if test="${queryType != 3 }">
							<option value="3">客户来源</option>
						</c:if>
						<c:if test="${queryType == 3 }">
							<option value="3" selected="selected">客户来源</option>
						</c:if>
						<c:if test="${queryType != 4 }">
							<option value="4">客户类型</option>
						</c:if>
						<c:if test="${queryType==4 }">
							<option value="4" selected="selected">客户类型</option>
						</c:if>
						<c:if test="${queryType != 5 }">
							<option value="5">所属员工</option>
						</c:if>
						<c:if test="${queryType == 5 }">
							<option value="5" selected="selected">所属员工</option>
						</c:if>
						<c:if test="${queryType != 6 }">
							<option value="6">客户公司</option>
						</c:if>
						<c:if test="${queryType == 6 }">
							<option value="6" selected="selected">客户公司</option>
						</c:if>
						
            			<%-- 
    					<option value="1">客户姓名</option>
     				 	<option value="2">客户状态</option>
     				 	<option value="3">客户来源</option>
     				 	<option value="4">客户类型</option>
     				 	<option value="5">所属员工</option>
     				 	<option value="6">客户公司</option>
     				 	--%>
    
   				 </select>            
   				</td>
            <td class="STYLE4">&nbsp;&nbsp;<input  name="Submit" type="submit" value="查询" style="width:50px"/></td>
            <td class="STYLE4">&nbsp;&nbsp;<input  type="button" value="添加"  onclick="add()"  style="width:50px"/></td>            
          </tr>
        </table></td>
        <td width="16"><img src="resource/images/tab_07.gif" width="16" height="30" />
        	 <input   type="hidden"   name="userId"   value=""  />
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
			<td width="16%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">公司</span></div></td>
			<td width="10%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">备注</span></div></td>
			<td width="15%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
</tr>
<c:if test="${ empty cusList}">
		<tr>
		<td colspan="13">
		一个客户也没有
		</td>
		</tr>
</c:if>
		<c:if test="${not  empty cusList}">
        <c:forEach items="${ cusList }"  var="cus" varStatus="vs">
        <tr>
            <td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${cus.customer_name }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${cus.customer_state2 }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${cus.source_name }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 6%"><div align="center"><span class="STYLE1">${cus.customer_emp }</span></div></td>
			<td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${cus.type_name }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${cus.customer_gender }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 5%"><div align="center"><span class="STYLE1"><a href="servlet/FetionSendServlet1?id=">${cus.customer_tel }</a></span></div></td>
			<td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${cus.customer_qq }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 5%"><div align="center"><span class="STYLE1">${cus.customer_mail }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${cus.customer_position }</span></div></td>
			<td height="20" bgcolor="#FFFFFF"style="width: 3%"><div align="center"><span class="STYLE1">${cus.customer_company }</span></div></td>
			<td height="20" bgcolor="#FFFFFF"style="width: 8%"><div align="center"><span class="STYLE1">${cus.customer_remark }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 15%"><div align="center"><span class="STYLE4"><img src="resource/images/edt.gif" width="16" height="16" />
            <a href="servlet/CustomerServlet?method=showById1&customer_ID=${cus.customer_ID}">编辑</a>&nbsp; <img src="resource/images/edt.gif" width="16" height="16" />
            <a href="servlet/CustomerServlet?method=showById2&customer_ID=${cus.customer_ID}">详情</a>&nbsp; <img src="resource/images/del.gif" width="16" height="16" />
            <a href="servlet/CustomerServlet?method=delCus&customer_ID=${cus.customer_ID}">删除</a></span></div></td>
          </tr>
          </c:forEach>
          </c:if>
		 
			
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
            <td class="STYLE4">&nbsp;&nbsp;共有条记录，当前第 1/1页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40"><img src="resource/images/first.gif" width="37" height="15" /></td>
                  <td width="45"><img src="resource/images/back.gif" width="43" height="15" /></td>
                  <td width="45"><img src="resource/images/next.gif" width="43" height="15" /></td>
                  <td width="40"><img src="resource/images/last.gif" width="37" height="15" /></td>
                  <td width="100"><div align="center"><span class="STYLE1">转到第
                    <input name="textfield" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" /> 
                    页 </span></div></td>
                  <td width="40"><img src="resource/images/go.gif" width="37" height="15" /></td>
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

