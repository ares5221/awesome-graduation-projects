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
    <title>客户关怀列表</title>
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
			window.location="view/customer/customer_care_add.jsp";
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
		//在此获取查询条件，
		//获取查询方式
		var queryType = $("#queryType").val();
		//获取查询内容
		var selectcondition = $("#selectcondition").val();
		
		window.location.href="servlet/CustomerCareServlet?method=find&index="+index+"&"+queryType+"="+selectcondition;
	}
	
	function godelete(careid){
		window.location.href="servlet/CustomerCareServlet?method=delete&careId="+careid;
	}
	

</script>
  </head>
  
  <body>
  
  
  <form  action="servlet/CustomerCareQueryServlet" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="resource/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="resource/images/tab_03.gif" width="12" height="30" /></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4" align="center">&nbsp;&nbsp;请输入查询内容：
            <input type="text" name="customerInput" id = "selectcondition" value="${selectcondition }" style="width: 290px"/></td>
            <td class="STYLE4">&nbsp;&nbsp;请选择查询方式：
            	<select name="queryType" id = "queryType" style="width: 100px">
            	
            		<c:if test="${queryType == 'customerName' }">
            			<option value="customerName" selected="selected" >关怀客户</option>
            			
            		</c:if>
            		
            		<c:if test="${queryType != 'customerName' }">
            			<option value="customerName"  >关怀客户</option>
            			
            		</c:if>
            		
            		<c:if test="${queryType == 'careTheme' }">
            			<option value="careTheme" selected="selected" >关怀主题</option>
            			
            		</c:if>
            		
            		<c:if test="${queryType != 'careTheme' }">
            			<option value="careTheme" >关怀主题</option>
            			
            		</c:if>
      					
     				 <c:if test="${queryType == 'careWay' }">
            			<option value="careWay" selected="selected">关怀方式</option>
            			
            		</c:if>
            		
            		<c:if test="${queryType != 'careWay' }">
            			<option value="careWay" >关怀方式</option>
            			
            		</c:if>
     				 
     				 
     				 
     				 	
   				 </select>            
   			</td>
            <td class="STYLE4">&nbsp;&nbsp;<input  type="button" value="查询" style="width:50px" onclick="show(1)"/></td>           
          <td class="STYLE4">&nbsp;&nbsp;<input  type="button"  onclick="add()" value="添加"  style="width:50px"/></td>           
          </tr>
        </table></td>
        <td width="16"><img src="resource/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  

    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="resource/images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="2%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">序号</span></div></td>
            <td width="3%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">客户</span></div></td>
            <td width="4%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">关怀主题</span></div></td>
            <td width="4%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">关怀方式</span></div></td>
				
	    <td width="5%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">关怀时间</span></div></td>
	    <td width="5%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">下次关怀时间</span></div></td>
	    
		<td width="8%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">备注</span></div></td>
 	<td width="3%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">关怀人</span></div></td>
           
	   		<td      width="4%" height="22" background="resource/images/bg2.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>

</tr>

 <c:forEach items="${pageBean.list }" var = "customerCare"  >
 
 		<tr>
            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <div align="center">${customerCare.careId }</div>
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${customerCare.customerName }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${customerCare.careTheme }</span></div></td>
   	    	<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${customerCare.careWay }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${customerCare.careTime }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${customerCare.careNexttime }</span></div></td>
			<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${customerCare.careRemark } </span></div></td>
			<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${customerCare.carePeople }</span></div></td>
           
             
             <td height="20" bgcolor="#FFFFFF">
             <div align="center"><span class="STYLE4">
             <img src="resource/images/edt.gif" width="16" height="16" />
             <a href="view/customer/customer_care_edit.jsp?care_id=${customerCare.careId }">编辑</a>&nbsp; &nbsp;<img src="resource/images/del.gif" width="16" height="16" />
             <a href="javascript:godelete(${customerCare.careId })">删除</a></span></div></td>
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
            <td class="STYLE4">&nbsp;&nbsp;共有${pageBean.totalCount }条记录，当前第 ${pageBean.index }/${pageBean.totalPageCount } 页</td>
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
                    <input name="textfield" type="text" id = "goindex" size="4" style="height:18px; width:20px; border:1px solid #999999;"  /> 
                    页 </span></div></td>
                  <td width="40">
                 	 <img src="resource/images/go.gif" width="37" height="15" onclick="go()" />
                  </td>
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
