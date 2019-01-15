<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加角色</title>
    
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
			window.location="servlet/UserServlet?method=showRole";
		}
	
</script>

  </head>
  
  <body>
    <form action="servlet/UserServlet?method=addRole" method="post"name="form2" onsubmit="return checkForm('form2');">
<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
<tr class=editHeaderTr>
<td class=editHeaderTd colSpan=7>  请输入新角色的详细信息
</td>
</tr>  
 
    <tr>
  
    <td width="19%" bgcolor="#FFFDF0"><div align="center">角色名称：</div></td>
    <td colspan="3" bgcolor="#FFFFFF"><input type="text"  maxlength="20"  check_str="角色名称" style="width: 138px" name="role_name" >${ error}
      &nbsp;</td>
    </tr>
  <tr>
   <td bgcolor="#FFFDF0">
						<div align="center">
							角色等级：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="role_power" style="width: 138px" >
							<option name="role_power" value="1">一星</option>
							<option name="role_power" value="2">二星</option>
							<option name="role_power" value="3">三星</option>
						</select>&nbsp;
					</td>
    				</tr>
					<tr>  
				  		<td bgcolor="#FFFDF0"><div align="center">IS_USED：我不知道啥意思</div></td>
				  		<td align="center" bgcolor="#FFFDF0">
					  	<input type="radio" class="text" name="is_used"  value="1"  />鬼知道是啥 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				  		<input type="radio" class="text" name="is_used"  value="2"  />神知道是啥
				  		<%-- <input type="radio" class="text" name="gender"  value="2" checked="checked"/>女--%>
				 		</td>	 
					</tr>
</table>
<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
  <tr bgcolor="#ECF3FD">
    <td width="10%">&nbsp;</td>
    <td width="12%"><input type="submit" name="Submit" value="提交"  ></td>
    <td width="65%"><input  type="button" value="查看已有角色"  onclick="showAll()"  ></td>
  </tr>
</table>

</form>


  </body>
</html>
