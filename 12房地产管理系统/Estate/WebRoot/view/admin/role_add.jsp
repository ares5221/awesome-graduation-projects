<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加角色</title>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8" >  
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
	function query(){  
			window.location="servlet/AdminServlet?method=findAllRole";
		}
	
	function deleteconfirm(id){
		var flag = window.confirm("确定要删除此角色吗？");
		if(flag){
			window.location = "servlet/AdminServlet?method=deleteRole&id="+id;
		}
	}

    </script>

  </head>
  
  <body>
    <form action="servlet/AdminServlet?method=addRole" method="post"name="form2" onsubmit="return checkForm('form2');">
		<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
			<tr class=editHeaderTr>
				<td class=editHeaderTd colSpan=7>  请输入新角色的详细信息
				</td>
			</tr>  
		  <tr>
		    <td width="19%" bgcolor="#FFFDF0"><div align="center">角色名称：</div></td>
		    <td colspan="3" bgcolor="#FFFFFF"><input type="text"  maxlength="20"  check_str="角色名称" style="width: 138px" name="roleName" >
		      &nbsp;</td>
		    </tr>
		  <tr>
		    
		      
		      <td bgcolor="#FFFDF0">
								<div align="center">
									角色等级：
								</div>
							</td>
							<td colspan="3" bgcolor="#FFFFFF">
								<select name="rolePower" style="width: 138px">
									<option  value="1">
										一星
									</option>
									<option  value="2">
										二星
									</option>
									<option  value="3">
										三星
									</option>
								</select>
								&nbsp;
							</td>
		    </tr>
		 
		</table>
		<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
		  <tr bgcolor="#ECF3FD">
		    <td width="10%">&nbsp;</td>
		    <td width="12%"><input type="submit" name="Submit" value="提交" onclick="count()" ></td>
		    <td width="65%"><input type="button" value="查看已有角色"    onclick="query()" ></td>
		  </tr>
		</table>

	</form>
${success }
${failed }

<c:if test="${fn:length(roleList)>0 }">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()" onmouseout="changeback()">
			<tr>
				<td width="5%"
					background="resource/images/bg2.gif"
					bgcolor="#FFFFFF" style="width: 10%; height: 22px;">
					<div align="center">
						<span class="STYLE1">角色编号</span>
					</div>
				</td>
				
				<td width="5%"
					background="resource/images/bg2.gif"
					bgcolor="#FFFFFF" style="width: 10%; height: 22px;">
					<div align="center">
						<span class="STYLE1">角色名称</span>
					</div>
				</td>
				<td background="resource/images/bg2.gif"
					bgcolor="#FFFFFF" style="width: 10%; height: 22px;">
					<div align="center">
						<span class="STYLE1">角色等级</span>
					</div>
				</td>
				<td      width="10%"
					background="resource/images/bg2.gif"
					bgcolor="#FFFFFF" class="STYLE1"
					style="width: 10%; height: 22px;">
					<div align="center">
						基本操作
					</div>
				</td>
		</tr>

		<c:forEach items="${roleList }" var = "role">

			<tr>
				<td height="20" bgcolor="#FFFFFF" style="width: 10%">
					<div align="center" class="STYLE1">
						<div align="center">
							${role.role_id }
						</div>
					</div>
				</td>
				<td height="20" bgcolor="#FFFFFF" style="width: 10%">
					<div align="center">
						<span class="STYLE1">${role.role_name }</span>
					</div>
				</td>
				<td height="20" bgcolor="#FFFFFF" style="width: 10%">
					<div align="center">
						<c:if test="${role.role_power==1 }">
							<span class="STYLE1">一星</span>
						</c:if>
						
						<c:if test="${role.role_power==2 }">
							<span class="STYLE1">二星</span>
						</c:if>
						
						<c:if test="${role.role_power==3 }">
							<span class="STYLE1">三星</span>
						</c:if>
						
					</div>
				</td>
				<td height="20" bgcolor="#FFFFFF" style="width: 10%">
					<div align="center">
						<span class="STYLE4"><img src="resource/images/del.gif"
								width="16" height="16" /><a
							href="javascript:deleteconfirm(${role.role_id })">删除</a>
						</span>
					</div>
				</td>
		  </tr>
		
		
		</c:forEach>
		
		
		
									
</table>


</c:if>
${deletesuccess }
${deletefailed }

  </body>
</html>
