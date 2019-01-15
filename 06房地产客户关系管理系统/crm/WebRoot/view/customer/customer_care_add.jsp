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
    






	

		<title>客户关怀添加</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<LINK href="http://localhost:8080/crm/resource/css/admin.css" type=text/css
			rel=stylesheet>
		<style type="text/css">
.auto-style1 {
	margin-left: 0px;
}
</style>
		<script type="text/javascript"
			src="resource/js/CheckForm.js"></script>
		<script type="text/javascript"
			src="resource/js/My97DatePicker/WdatePicker.js"></script>

		<script language="javascript" type="text/javascript">
	function query()
	{	
		window.location = 'addcustomercare.html';  
	}
</script>
	</head>

	<body>
		<form action="servlet/CustomerServlet?method=addCare"
			method="post" name="form1" onsubmit="return checkForm('form1');">
			<table class=editTable cellSpacing=1 cellPadding=0 width="100%"
				align=center border=0>
				<tr class=editHeaderTr>
					<td class=editHeaderTd colSpan=7 style="height: 49px">
						请输入详细信息
					</td>
				</tr>
				<tr>
					<td width="21%" bgcolor="#FFFDF0" style="width: 9%">
						<div align="center">
							关怀主题：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<input type="text" style="width: 145px"  maxlength="20" name="care_theme" check_str="关怀主题" />
						&nbsp;
					</td>
					<td bgcolor="#FFFDF0" style="width: 13%">
						<div align="center">
							关怀对象：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="customer_Id" style="width: 145px">
						<c:forEach items="${careCustList }" var="careCustList">
							<option value="${careCustList.customer_ID }">${careCustList.customer_name }</option>
						</c:forEach>	
						</select>
						<input type="hidden" value="2017-06-15 10:53:49" name="careTime">
					</td>
				</tr>
				<tr>
					
					<td bgcolor="#FFFDF0" style="width: 13%">
						<div align="center">
							下次关怀时间：
						</div>
					</td>
					<td colspan="3"  bgcolor="#FFFFFF">
						<input type="text"  style="width: 145px" name="care_nexttime" check_str="下次关怀时间"
							readonly="readonly" id="careNexttime"
							onclick="WdatePicker({el:careNexttime,dateFmt:'yyyy-MM-dd HH:mm:ss '})">
						&nbsp;
					</td>
					
					<td bgcolor="#FFFDF0" style="width: 13%">
						<div align="center">
							关怀方式：
						</div>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="care_way" style="width: 145px">
							<option value="发短信">
								发短信
							</option>
							<option value="送礼品">
								送礼品
							</option>
							<option value="电话问候">
								电话问候
							</option>
							<option value="上门拜访">
								上门拜访
							</option>
							<option value="其他">
								其他
							</option>
						</select>
						&nbsp;
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFDF0" style="width: 13%">
						<div align="center">
							是谁关怀的：
						</div>
					</td>
					</td>
					<td colspan="3" bgcolor="#FFFFFF">
						<select name="care_people" style="width: 145px">
						<c:forEach items="${userList1 }" var="userList1">
							<option value="${userList1.user_name }">${userList1.user_name }</option>
						</c:forEach>	
						</select>
						<input type="hidden" value="2017-06-15 10:53:49" name="careTime">
					</td>
					
				</tr>

				<tr>
					<td bgcolor="#FFFDF0" style="width: 13%">
						<div align="center">
							关怀备注：
						</div>
					</td>
					<td colspan="5" bgcolor="#FFFFFF">
						<textarea name="care_remark" rows="10"
							style="width: 100%; resize: none;"></textarea>
					</td>
				</tr>
			</table>
			<table class=editTable cellSpacing=1 cellPadding=0 width="100%"
				align=center border=0>
				<tr bgcolor="#ECF3FD">
					<td width="40%"></td>
					<td width="10%"><input type="submit" name="submit"  value="添加"></td>
					<td width="5%"><input type="button" name="button"  onClick="history.back() "  value="返回"></td>
					<td width="40%"></td>
				</tr>
			</table>

		</form>
	</body>
</html>
