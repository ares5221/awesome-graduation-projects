<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    <base href="<%=basePath%>">
    











		<title>修改客户信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<LINK href="http://localhost:9090/crm/resource/css/admin.css" type=text/css
			rel=stylesheet>
		<script type="text/javascript"
			src="http://localhost:9090/crm/resource/js/CheckForm.js"></script>
		<script type="text/javascript"
			src="http://localhost:9090/crm/resource/js/My97DatePicker/WdatePicker.js"></script>
	
	</head>

	<body>
		<form action="servlet/CustomerServlet?method=showById1&customer_ID=${cus.customer_ID}"
			method="post" name="form2">
			

			<table class=editTable cellSpacing=1 cellPadding=0 width="100%"
				align=center border=0>
				<tr class=editHeaderTr>
					<td class=editHeaderTd colSpan=7>客户详细信息<input type="hidden" name="customerId"value="3" /></td>
				</tr>
				<tr>
					<td width="12%" bgcolor="#FFFDF0"><div align="center">负责员工：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"  align="center">${cus.customer_emp }</td>
				  <td width="14%" bgcolor="#FFFDF0"  ><div align="center">客户来源：</div></td>
					<td width="41%" colspan="3"   align="center" bgcolor="#FFFFFF">${cus.source_name }</td>
				</tr>
				<tr>
					<td bgcolor="#FFFDF0"><div align="center">客户姓名：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"  align="center">${cus.customer_name }</td>
					<td bgcolor="#FFFDF0"><div align="center">客户状态：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"  align="center">${cus.customer_state2 }</td>
				</tr>
				<tr>
					<td bgcolor="#FFFDF0"><div align="center">客户性别：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"  align="center">${cus.customer_gender }</td>
					<td bgcolor="#FFFDF0"><div align="center">客户类型：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"  align="center">${cus.type_name }</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0"><div align="center">出生日期：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"   align="center">${cus.customer_date }</td>
					<td bgcolor="#FFFDF0"><div align="center">客户手机：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"  align="center">${cus.customer_tel }</td>
				</tr>
				
				<tr>
					<td bgcolor="#FFFDF0"><div align="center">客户QQ：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"  align="center">${cus.customer_qq }</td>
					<td bgcolor="#FFFDF0"><div align="center">客户地址：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"  align="center">${cus.customer_address }</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0"><div align="center">客户邮箱：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"   align="center">${cus.customer_mail }</td>
					<td bgcolor="#FFFDF0"><div align="center">客户职位：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"  align="center">${cus.customer_position }</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0"><div align="center">客户微博：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"   align="center">${cus.customer_blog }</td>
					<td bgcolor="#FFFDF0"><div align="center">客户座机：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"  align="center">${cus.customer_mtel }</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0"><div align="center">客户MSN：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"   align="center">${cus.customer_msn }</td>
					<td bgcolor="#FFFDF0"><div align="center">客户公司：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"  align="center">${cus.customer_company }</td>
				</tr>
				<tr>
					<td bgcolor="#FFFDF0"><div align="center">创建人：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"   align="center">${cus.customer_createPeople }</td>
					<td bgcolor="#FFFDF0"><div align="center">修改人：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"   align="center">${cus.customer_revisePeople }</td>
				</tr>
				<%-- <tr>
					<td bgcolor="#FFFDF0"><div align="center">创建时间：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"   align="center">2013-05-23 23:08:52.0</td>
					<td bgcolor="#FFFDF0"><div align="center">修改时间：</div></td>
					<td colspan="3" bgcolor="#FFFFFF"   align="center">2013-05-25 09:32:48.0</td>
				</tr>--%>
				<tr>
					<td bgcolor="#FFFDF0"><div align="center">备注：</div></td>
					<td colspan="6" bgcolor="#FFFFFF"   align="center">${cus.customer_remark }
		</td>
				</tr>
			</table>
			<table class=editTable cellSpacing=1 cellPadding=0 width="100%"
				align=center border=0>
				<tr bgcolor="#ECF3FD">
					<td width="36%"></td>
					<td width="17%"><input type="submit" name="submit"  value="编辑"></td>
					<td width="4%"><input type="button" name="button"  onClick="history.back() "  value="返回"></td>
					<td width="43%"></td>
				</tr>
			</table>
		</form>
	</body>
</html>
