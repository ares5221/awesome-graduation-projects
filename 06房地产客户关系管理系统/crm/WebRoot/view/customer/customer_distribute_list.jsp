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
    

    
    
    <title>客户分配列表</title>
    
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

<script type="text/javascript">
window.onload=function()
{
	var obtn=document.getElementById('check');
	var oinput=document.getElementsByTagName('input');
	var i=0;
	var countclick=0;
	obtn.onclick=function()
	{   
	   
	   countclick=countclick+1;
	   
	   if((countclick % 2)==1)
	   {
			for(i=0;i<oinput.length;i++)
			{
				oinput[i].checked=true;
			}
		}
		else
		{
			for(i=0;i<oinput.length;i++)
			{
				oinput[i].checked=false;
			}

		}
	}

}

</script>
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

  </head>
  
  <body>
  <form action="http://localhost:8080/crm/servlet/CustomerUpdateAllNoAdmeasureServlet" method="post">
  
  
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="http://localhost:8080/crm/resource/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="http://localhost:8080/crm/resource/images/tab_03.gif" width="12" height="30" /></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          		<td  width="90%"></td>
           		 <td class="STYLE4">&nbsp;&nbsp;<input  type="submit"      value="分配所选客户"  /></td>            
          </tr>
        </table></td>
        <td width="16"><img src="http://localhost:8080/crm/resource/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>


    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="http://localhost:8080/crm/resource/images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
          	<td width="2%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><input type="checkbox" id="check" name="checkbox1" value="checkbox1" /></div></td>
            <td width="8%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">姓名</span></div></td>
            <td width="8%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">状态</span></div></td>
            <td width="8%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">来源</span></div></td>
          	<td width="8%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">类型</span></div></td>
			<td width="20%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">创建时间</span></div></td>
			<td width="15%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">公司</span></div></td>
			<td width="16%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">备注</span></div></td>
			<td width="15%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
		</tr>
		<c:if test="${empty cusList}">
			<tr>
				<td colspan="13">
				一个客户也没有
				</td>
			</tr>
        </c:if>
		<c:if test="${not  empty cusList}">
        <c:forEach items="${ cusList}"  var="cus" varStatus="vs">
         <tr>
 			<td width="2%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><input type="checkbox" name="checkbox" value="7" /></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 8%"><div align="center"><span class="STYLE1">${cus.customer_name }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 8%"><div align="center"><span class="STYLE1">${cus.customer_state2 }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 8%"><div align="center"><span class="STYLE1">${cus.source_name }</span></div></td>
			<td height="20" bgcolor="#FFFFFF"style="width: 8%"><div align="center"><span class="STYLE1">${cus.type_name }</span></div></td>
			<td height="20" bgcolor="#FFFFFF"style="width: 20%"><div align="center"><span class="STYLE1">2013-05-25 16:20:38.0</span></div></td>
			<td height="20" bgcolor="#FFFFFF"style="width: 15%"><div align="center"><span class="STYLE1">${cus.customer_company }</span></div></td>
			<td height="20" bgcolor="#FFFFFF"style="width: 16%"><div align="center"><span class="STYLE1">${cus.customer_remark }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"style="width: 15%"><div align="center"><span class="STYLE4"><img src="http://localhost:8080/crm/resource/images/edt.gif" width="16" height="16" />
            <a href="view/customer/customer_distribute.jsp">分配</a>
          </tr>
          </c:forEach>
          </c:if>
          
          
         </table></td>
        <td width="8" background="http://localhost:8080/crm/resource/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="http://localhost:8080/crm/resource/images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="http://localhost:8080/crm/resource/images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;共有 2条记录，当前第 1/1 页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40"><img src="http://localhost:8080/crm/resource/images/first.gif" width="37" height="15" /></td>
                  <td width="45"><img src="http://localhost:8080/crm/resource/images/back.gif" width="43" height="15" /></td>
                  <td width="45"><img src="http://localhost:8080/crm/resource/images/next.gif" width="43" height="15" /></td>
                  <td width="40"><img src="http://localhost:8080/crm/resource/images/last.gif" width="37" height="15" /></td>
                  <td width="100"><div align="center"><span class="STYLE1">转到第
                    <input name="textfield" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" /> 
                    页 </span></div></td>
                  <td width="40"><img src="http://localhost:8080/crm/resource/images/go.gif" width="37" height="15" /></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="http://localhost:8080/crm/resource/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>

