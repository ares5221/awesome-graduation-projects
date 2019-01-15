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
    
    
    <title>center</title>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8" >  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <LINK href="resource/css/admin.css" type=text/css rel=stylesheet>
	<style type="text/css">
	/* #div1{
	
		width:50%;
		height:80%;
	
	}
	#div2{
	
		width:50%;
		height:80%;
	
	}
	#div3{
	
		width:50%;
		height:80%;
	
	}
	#div4{
	
		width:50%;
		height:80%;
	
	} */

</style>
<script type="text/javascript" src="/Estate/js/jquery-1.8.2.js"></script>
<script type="text/javascript">
	
	function gonotice(){
		
		var noticevalue = $("#notice").val();
		var carevalue=$("#care").val();
		var linkvalue=$("#link").val();
		var customervalue=$("#customer").val();
		window.location.href="servlet/EmployeeServlet?method=loadPage2&NoticeDate="+noticevalue;
	}
	
	function gocare(){
		var noticevalue = $("#notice").val();
		var carevalue=$("#care").val();
		var linkvalue=$("#link").val();
		var customervalue=$("#customer").val();
		window.location.href="servlet/EmployeeServlet?method=loadPage2&CareDate="+carevalue;
	}
	
	function golink(){
		var noticevalue = $("#notice").val();
		var carevalue=$("#care").val();
		var linkvalue=$("#link").val();
		var customervalue=$("#customer").val();
		window.location.href="servlet/EmployeeServlet?method=loadPage2&LinkDate="+linkvalue;
	}
	function gocustomer(){
		var noticevalue = $("#notice").val();
		var carevalue=$("#care").val();
		var linkvalue=$("#link").val();
		var customervalue=$("#customer").val();
		window.location.href="servlet/EmployeeServlet?method=loadPage2&CustomerDate="+customervalue;
	}
	
</script>

  </head>
  
  <body>
    <form action="<%=basePath%>servlet/WorkQueryServlet" method="post"  >
	<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
		<tr class=editHeaderTr>
		<td class=editHeaderTd >  关怀提醒
		<td class=editHeaderTd >  联系提醒
  <tr>
    <td width="50%" bgcolor="#FFFDF0">
		<div align="center" id="div1">
		<table  class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
			<tr>
					<td bgcolor="#FFFDF0"  colspan="2"><div align="center">查询方式：
						<select name="care" id="care" style=" width: 145px">
							<option  value="0">当天</option>
							<option  value="7">一周内</option>
							<option  value="15">半月内</option>
							<option  value="30">一月内</option>
						</select>				
					</div></td>
					<td colspan="2" bgcolor="#FFFFFF"><div align="center"><input style=" width: 45px" type="button" onclick="gocare()"   value="查询"></div></td>
    			</tr>
    			 <tr>
	 				 <td bgcolor="#FFFDF0"><div align="center">关怀主题</div></td>
		 			 <td bgcolor="#FFFDF0"><div align="center">关怀时间</div></td>
		 			  <td bgcolor="#FFFDF0"><div align="center">关怀对象</div></td>
   			 	</tr>
	
    			<c:forEach items="${careList }" var="care">
    				<tr>
						<td colspan="1" bgcolor="#FFFFFF"><div align="center">${care.careTheme }</div></td>
						<td colspan="1" bgcolor="#FFFFFF"><div align="center">${care.careTime }</div></td>
						<td colspan="1" bgcolor="#FFFFFF"><div align="center">${care.customerName }</div></td>
					</tr>
    			</c:forEach>
						
          			
   		 </table>
		</div>
	</td>
    <td bgcolor="#FFFDF0">
		<div align="center" id="div2">
			<table  class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
			<tr>
					<td bgcolor="#FFFDF0"  colspan="3"><div align="center">查询方式：
						<select name="link" id="link" style=" width: 145px">
							<option  value="0">当天</option>
							<option  value="7">一周内</option>
							<option  value="15">半月内</option>
							<option  value="30">一月内</option>
						</select>				
					</div></td>
					<td colspan="3" bgcolor="#FFFFFF">
					<div align="center"><input style=" width: 45px" type="button" onclick="golink()"   value="查询"></div></td>
    			</tr>
    			 <tr>
	 				 <td bgcolor="#FFFDF0"><div align="center">联系主题</div></td>
		 			 <td bgcolor="#FFFDF0"><div align="center">联系方式</div></td>
		 			  <td bgcolor="#FFFDF0"><div align="center">应联系时间</div></td>
		 	   		<td bgcolor="#FFFDF0"><div align="center">联系对象</div></td>
   			 </tr>
	
		<c:forEach items="${linkList }" var="link">
			<tr>
					<td colspan="1" bgcolor="#FFFFFF"><div align="center">${link.link_theme }</div></td>
					<td colspan="1" bgcolor="#FFFFFF"><div align="center">${link.link_type }</div></td>
					<td colspan="1" bgcolor="#FFFFFF"><div align="center">${link.link_time }</div></td>
					<td colspan="1" bgcolor="#FFFFFF"><div align="center">${link.customer_name }</div></td>
   	 		</tr>
		
		</c:forEach>
    		
   	 		
          						
   		 </table>
		</div></td>
    </tr>
    <tr class=editHeaderTr>
		<td class=editHeaderTd >  有效公告
		<td class=editHeaderTd >  生日提醒
  <tr>
    <td width="50%" bgcolor="#FFFDF0">
		<div align="center" id="div3">
		<table  class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
					
				<tr>
					<td bgcolor="#FFFDF0"  colspan="3">
						<div align="center">查询方式：
							<select name="addTime3" id = "notice" style=" width: 145px">
								<option  value="0">当天</option>
								<option  value="7">一周内</option>
								<option  value="15">半月内</option>
								<option  value="30">一月内</option>
							</select>				
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<div align="center"><a target="_top"><input style=" width: 45px" type="button" onclick="gonotice()"   value="查询"></a></div>
					</td>
    			</tr>
					
					
					
    			 <tr>
	 				 <td bgcolor="#FFFDF0"><div align="center">公告主题</div></td>
		 			 <td bgcolor="#FFFDF0"><div align="center">公告内容</div></td>
		 			 <td bgcolor="#FFFDF0"><div align="center">截止时间</div></td>
		 			  <td bgcolor="#FFFDF0"><div align="center">公告人</div></td>
   			 	</tr>
					
					<c:forEach items="${noticeList }" var="notice">
						<tr>
							<td colspan="1" bgcolor="#FFFFFF"><div align="center">${notice.notice_item }</div></td>
							<td colspan="1" bgcolor="#FFFFFF"><div align="center">${notice.notice_content }</div></td>
							<td colspan="1" bgcolor="#FFFFFF"><div align="center">${notice.notice_endtime }</div></td>
							<td colspan="1" bgcolor="#FFFFFF"><div align="center">${notice.user_name }</div></td>
						</tr>
					
					</c:forEach>
				
				
          			
   		 </table>
		</div>
	</td>
    <td bgcolor="#FFFDF0">
		<div align="center" id="div4">
			<table  class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
			<tr>
					<td bgcolor="#FFFDF0"  colspan="3"><div align="center">查询方式：
						<select name="customer" id="customer" style=" width: 145px">
							<option  value="0">当天</option>
							<option  value="7">一周内</option>
							<option  value="15">半月内</option>
							<option  value="30">一月内</option>
						</select>				
					</div></td>
					<td colspan="3" bgcolor="#FFFFFF"><div align="center"><input style=" width: 45px" type="button" onclick="gocustomer()"  value="查询"></div></td>
    			</tr>
    			 <tr>
	 				 <td bgcolor="#FFFDF0"><div align="center">过生的人</div></td>
		 			 <td bgcolor="#FFFDF0"><div align="center">生日时间</div></td>
		 			  <td bgcolor="#FFFDF0"><div align="center">手机号码</div></td>
		 	   		<td bgcolor="#FFFDF0"><div align="center">客户状态</div></td>
   			 </tr>
			
    			<c:forEach items="${scAll }" var="customer">
    				<tr>
    					<td colspan="1" bgcolor="#FFFFFF"><div align="center">${customer.customer_name }</div></td>
						<td colspan="1" bgcolor="#FFFFFF"><div align="center">${customer.birth_day }</div></td>
						<td colspan="1" bgcolor="#FFFFFF"><div align="center">${customer.customer_mobile }</div></td>
						<td colspan="1" bgcolor="#FFFFFF"><div align="center">${customer.condition_name}</div></td>
   	 				</tr>
    			</c:forEach>
    		
				
          						
   		 </table>
		</div></td>
    </tr>
</table>
</form>
  </body>
</html>
