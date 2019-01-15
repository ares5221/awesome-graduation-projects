<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加房屋类型</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<LINK href="resource/css/admin.css" type=text/css	rel=stylesheet>
 <script type="text/javascript"
			src="resource/js/CheckForm.js"></script>
		<script type="text/javascript"
			src="resource/js/My97DatePicker/WdatePicker.js"></script>
 <script type="text/javascript">
	function showAll(){  
			window.location="servlet/HouseServlet?method=findType";
		}
	
</script>

  </head>
  
  <body>
    <form action="servlet/HouseServlet?method=addType" method="post"name="form2" onsubmit="return checkForm('form2');">
<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
<tr class=editHeaderTr>
<td class=editHeaderTd colSpan=7>  请输入房屋类型的详细信息
</td>
</tr>  
 
    <tr>
  
    <td width="19%" bgcolor="#FFFDF0"><div align="center">类型名称：</div></td>
    <td colspan="8" bgcolor="#FFFFFF"><input type="text"  maxlength="20"   style="width: 600px" name="type_name" required="required">${ error}
      &nbsp;</td>
    </tr>
  
</table>
<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
  <tr bgcolor="#ECF3FD">
    <td width="10%">&nbsp;</td>
    <td width="12%"><input type="submit" name="Submit" value="提交"  ></td>
    <td width="65%"><input  type="button" value="查看已有类型"  onclick="showAll()"  ></td>
  </tr>
</table>

</form>


  </body>
</html>
