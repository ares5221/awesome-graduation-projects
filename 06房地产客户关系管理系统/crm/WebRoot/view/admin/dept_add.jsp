<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    





    
    <title>添加部门信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="resource/js/CheckForm.js"></script>
	
<LINK href="resource/css/admin.css" type=text/css
			rel=stylesheet>
	

<script type="text/javascript"
			src="resource/js/CheckForm.js"></script>
		<script type="text/javascript"
			src="resource/js/My97DatePicker/WdatePicker.js"></script>		
	 </head>
  
  <body>


<form action="servlet/DepartmentServlet?method=addDepartment" method="post" name="form2" >
<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
<tr class=editHeaderTr>
<td class=editHeaderTd colSpan=7>  请输入新部门的详细信息
</td>
</tr>  
  <tr>
    <td width="19%" bgcolor="#FFFDF0"><div align="center">部门名称：</div></td>
    <td colspan="3" bgcolor="#FFFFFF"><input type="text"  style=" width: 100%"  maxlength="20"  name="department_name" check_str="部门名称">
      </td>
    </tr>
  <tr>
    <td bgcolor="#FFFDF0"><div align="center">部门描述：</div></td>
    <td colspan="5" bgcolor="#FFFFFF"><textarea  rows="10" name="department_desc"   style="width:100%; resize:none; "s></textarea>
      &nbsp;</td>
    </tr>
  <tr>  
  		<td bgcolor="#FFFDF0"><div align="center">IS_USED：</div></td>
  		<td align="center" bgcolor="#FFFDF0">
	  	<input type="radio" class="text" name="is_used"  value="1"  />1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  		<input type="radio" class="text" name="is_used"  value="2"  />2
  		<%-- <input type="radio" class="text" name="gender"  value="2" checked="checked"/>女--%>
 		</td>	 
  </tr>
</table>
<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
  <tr bgcolor="#ECF3FD">
    		<td width="25%"></td>
    			${mess }
					<td width="17%"><input type="submit" name="Submit"  value="添加" class="button"></td>
					<td width="17%"><input type="reset" name="reset"  value="重置"></td>
					<td width="4%"><input type="button" name="button"  onClick="history.back() "  value="返回"></td>
					<td width="43%"></td>
  </tr>
</table>

</form>
</body>
</html>


