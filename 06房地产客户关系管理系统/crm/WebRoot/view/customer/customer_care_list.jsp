<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    








    
    <title>客户关怀列表</title>
    
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
			window.location="servlet/CustomerServlet?method=toAddCare";
		}
	function changeIndex1(size){
		var index=document.getElementById("indexn").value;
		var customerInput=document.getElementById("customerInput").value;
		var careQuery_Type=document.getElementById("careQuery_Type").value;
		location.href="http://localhost:8080/crm/servlet/CustomerServlet?method=care&index="+index+"&size="+size+"&customerInput="+customerInput+"&careQuery_Type="+careQuery_Type;

}
</script>

  </head>
  
  <body>
  
  
  <form  action="" method="post" name="form1">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="http://localhost:8080/crm/resource/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="http://localhost:8080/crm/resource/images/tab_03.gif" width="12" height="30" /></td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4" align="center">&nbsp;&nbsp;请输入查询内容：<input type="text" name="customerInput" style="width: 290px"/></td>
            <td class="STYLE4">&nbsp;&nbsp;请选择查询方式：<select name="careQuery_Type" style="width: 100px">
      					<option value="1" >关怀客户</option>
     				 	<option value="2" >关怀主题</option>
     				 	<option value="3" >关怀方式</option>
   				 </select>            
   				</td>
            <td class="STYLE4">&nbsp;&nbsp;<input  type="submit" value="查询" style="width:50px"/></td>           
          <td class="STYLE4">&nbsp;&nbsp;<input  type="button"  onclick="add()" value="添加"  style="width:50px"/></td>           
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
            <td width="2%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">序号</span></div></td>
            <td width="3%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">客户</span></div></td>
            <td width="4%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">关怀主题</span></div></td>
            <td width="4%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">关怀方式</span></div></td>
				
	    <td width="5%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">关怀时间</span></div></td>
	    <td width="5%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">下次关怀时间</span></div></td>
	    
		<td width="10%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">备注</span></div></td>
 	<td width="3%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">关怀人</span></div></td>
           
	   		<td      width="4%" height="22" background="http://localhost:8080/crm/resource/images/bg2.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>

</tr>
 <c:forEach items="${pageBean.list}" var="careList">   
 <tr>
            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <div align="center">${careList.care_id }</div>
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${careList.customer_name }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${careList.care_theme }</span></div></td>
   	    <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${careList.care_way }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${careList.care_time }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${careList.care_nexttime }</span></div></td>
		<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${careList.care_remark }</span></div></td>
		 <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${careList.care_people }</span></div></td>
           
             
             <td       height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4"><img src="http://localhost:8080/crm/resource/images/edt.gif" width="16" height="16" /><a href="view/customer/customer_care_edit.jsp">编辑</a>&nbsp; &nbsp;<img src="http://localhost:8080/crm/resource/images/del.gif" width="16" height="16" /><a href="servlet/CustomerServlet?method=updateCare&care_id=${careList.care_id }">删除</a></span></div></td>
          </tr>
 </c:forEach>
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
            <td class="STYLE4">&nbsp;&nbsp;共有${pageBean.totalCount }条记录，当前第${pageBean.index}
										  /  <font id="totalPageCount1">${pageBean.totalPageCount }</font>页</td>
            <td>
												 <font size="1px">每页</font>
											    		 <select id="size" onchange="changeIndex1(this.value)" name="size">
											    		 
													    		 <c:forEach begin="5" end="25" step="5" var="i">
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
																<a href="servlet/CustomerServlet?method=care&index=1&size=${pageBean.size}&customerInput=${customerInput}&careQuery_Type=${careQuery_Type}">首页</a>
																
									    							<c:if test="${pageBean.index!=1 }">
										    							<a href="servlet/CustomerServlet?method=care&index=${pageBean.index-1 }&size=${pageBean.size}&customerInput=${customerInput}&careQuery_Type=${careQuery_Type}">上一页</a>
									    							</c:if>
									    							<c:if test="${pageBean.index==1 }">
										    							<font size="1px">上一页</font>
									    							</c:if>
											    					<c:forEach items="${pageBean.numbers }" var="num">
									    									<c:if test="${num==pageBean.index}">
											    							[<a href="servlet/CustomerServlet?method=care&index=${num }&size=${pageBean.size}&customerInput=${customerInput}&careQuery_Type=${careQuery_Type}">${num }</a>]
									    									</c:if>
									    									<c:if test="${num!=pageBean.index}">
											    							<a href="servlet/CustomerServlet?method=care&index=${num }&size=${pageBean.size}&customerInput=${customerInput}&careQuery_Type=${careQuery_Type}">${num }</a>
									    									</c:if>
											    					</c:forEach>
											    					<c:if test="${pageBean.index!=pageBean.totalPageCount }">
										    							<a href="servlet/CustomerServlet?method=care&index=${pageBean.index+1 }&size=${pageBean.size}&customerInput=${customerInput}&careQuery_Type=${careQuery_Type}">下一页</a>
									    							</c:if>
									    							
									    							<c:if test="${pageBean.index==pageBean.totalPageCount }">
										    							
										    							<font size="1px">下一页</font>
									    							</c:if>
									    							<a href="servlet/CustomerServlet?method=care&index=${pageBean.totalPageCount}&size=${pageBean.size}&customerInput=${customerInput}&careQuery_Type=${careQuery_Type}">末页</a>
													</td>

													<td width="100">
														<div align="center">
															<span class="STYLE1">转到第 
															
															<input name="textfield" type="text" size="4"style="height: 12px; width: 20px; border: 1px solid #999999;" id="indexn" />
															<input type="hidden" name="index" value="${pageBean.index }">
																页
															</span>
														</div>
													</td>
													<td>
														<input type="button" onclick="changeIndex(${pageBean.size})" value="go">
													</td>
												</tr>
											</table>
											<script type="text/javascript">
											
																function changeIndex(size){
																	
																			var index=document.getElementById("indexn").value;
																			var c=document.getElementById("totalPageCount1").innerHTML;
																			var customerInput=document.getElementById("customerInput").value;
																			var careQuery_Type=document.getElementById("careQuery_Type").value;
																			//alert(totalPageCount);
																			if(index<(c+1)){
																				
																					location.href="servlet/CustomerServlet?method=care&index="+index+"&size="+size+"&customerInput="+customerInput+"&careQuery_Type="+careQuery_Type;
																			}
																	
																		
					
																}
											
											
											
											
											</script>
											<script type="text/javascript">
																function  submitx() {
																	document.forms["form1"].action="servlet/CustomerServlet?method=care";
																	document.forms["form1"].submit();
																	
																}
								
										</script>
										</td>
									</tr>
								</table>
							</td>
							<td width="16"><img
								src="http://localhost:8080/crm/resource/images/tab_20.gif"
								width="16" height="35" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
</form>
  </body>
 
</html>
