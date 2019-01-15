<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	 <script type="text/javascript" src="resource/js/CheckForm.js"></script>
	<script type="text/javascript" src="resource/js/My97DatePicker/WdatePicker.js"></script>
	<script language="JavaScript" type="text/javascript" src="resource/js/FormValid.js"></script>
	 
	 </head>
  
  <body>


<form action="servlet/DepartmentServlet?method=addNotice" method="post" name="form2" >
<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
<tr class=editHeaderTr>
<td class=editHeaderTd colSpan=7>  请填写要发布的新公告内容
</td>
</tr>
	<tr>
    <td width="20%" bgcolor="#FFFDF0"><div align="center">公告人编号：</div></td>
    <td colspan="3" bgcolor="#FFFFFF"><input name="suser_ID" type="text" value="${user.user_ID }" readonly="readonly" style=" width: 100%"  maxlength="20"   >
      </td>
    </tr>  
    <tr>
    <td width="20%" bgcolor="#FFFDF0"><div align="center">公告人：</div></td>
    <td colspan="3" bgcolor="#FFFFFF"><input name="user_name" type="text" value="${user.user_name }" readonly="readonly" style=" width: 100%"  maxlength="20"   >
      </td>
    </tr>
  <tr>
    <td width="20%" bgcolor="#FFFDF0"><div align="center">公告主题：</div></td>
    <td colspan="3" bgcolor="#FFFFFF"><input name="notice_item" type="text"  style=" width: 100%"  maxlength="20"   check_str="部门名称">
      </td>
    </tr>
  <tr>
    <td width="20%" bgcolor="#FFFDF0"><div align="center">公告内容：</div></td>
    <td colspan="5" bgcolor="#FFFFFF"><textarea name="notice_content" rows="10"   style="width:100%; resize:none; "s></textarea>
      &nbsp;</td>
    </tr>
    <tr>
    <td width="20%" bgcolor="#FFFDF0"><div align="center">公告日期：</div></td>
    <td colspan="3" bgcolor="#FFFFFF">
 	<input  name="notice_time"  type="text" style=" width: 30%"    valid="required"  errmsg="公告日期不能为空" readonly="readonly" id="notice_time"  onclick="WdatePicker({el:notice_time,dateFmt:'yyyy-MM-dd'})"/>		
     
      </td>
     </tr>
    <tr>
    <td width="20%" bgcolor="#FFFDF0"><div align="center">公告截止日期：</div></td>
    <td colspan="3" bgcolor="#FFFFFF">
      	<input  name="notice_endtime"  type="text" style=" width: 30%"    valid="required"  errmsg="公告截止日期不能为空!" readonly="readonly" id="notice_endtime"  onclick="WdatePicker({el:notice_endtime,dateFmt:'yyyy-MM-dd'})"/>		
     
      </td>
    </tr>
  <tr>  
  		<td width="20%" bgcolor="#FFFDF0"><div align="center">公告部门</div></td>
  		<td align="center" bgcolor="#FFFDF0">
  		<c:forEach items="${deptList }" var="dept">
	  	<input type="radio" class="text" name="is_used"  value="${dept.department_name}"/>${dept.department_name}&nbsp;
  		</c:forEach>
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


