<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.bjsxt.shopping.order.*, java.util.*" %>


<%
int id = Integer.parseInt(request.getParameter("id"));
SalesOrder so = OrderMgr.getInstance().loadById(id);

String action = request.getParameter("action");
if(action != null && action.equals("modify") ) {
	int status = Integer.parseInt(request.getParameter("status"));
	so.setStatus(status);
	so.updateStatus(); 
}
%>



<center>
	下单人：<%=so.getUser().getUsername() %>
	<form name="form" action="OrderModify.jsp" method="post">
		<input type="hidden" name="action" value="modify">
		<input type="hidden" name="id" value="<%=id %>">
		<select name="status">
			<option value="0">未处理</option>
			<option value="1" >已处理</option>
			<option value="2">废单</option>
		</select>
		<br>
		<input type="submit" value="提交">
	</form>
</center>


<script type="text/javascript">
	//alert(document.forms("form").status.options.length);
	for(i=0; i<document.forms("form").status.options.length; i++) {

		if(document.forms("form").status.options[i].value == <%=so.getStatus()%>) {
			document.forms("form").status.selectedIndex = i;
		}
		
	}
</script>