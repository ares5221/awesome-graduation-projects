<%@ page language="java" import="java.util.*, com.bjsxt.shopping.category.*" pageEncoding="GB18030"%>

<%
List<Category> categories = CategoryService.getInstance().getTopCategories();
%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ProductSearch.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
		var req;
		
		function init() {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		
		function changeDrop2() {
			init();
			var url = "GetCategoryChilds.jsp?id=" + escape(document.frm.parent.options[document.frm.parent.selectedIndex].value);
			req.open("GET", url, true);
			req.onreadystatechange = callback;
			req.send(null);
		}
		
		function callback() {
			if(4 == req.readyState) {
		
				if(200 == req.status) {
					//alert(req.responseText);
					eval(req.responseText);
				}
			}
			
		}
	</script>
	
  </head>
  
  <body>
    联动菜单有好多种技术 <br>
    1:提前取出来所有的内容 <br>
    2:第一级菜单改变的时候, 提交到本身页面, 刷新页面<br>
    3:使用Frame<br>
    4:AJAX<br>
    
    <center>第四种</center>
    <center>
	<form name="frm" method="get">
		<select name="parent" onchange="changeDrop2()">
			<option value="-1">请选择</option>
			<%
			for(int i=0; i<categories.size(); i++) {
				Category c = categories.get(i);
				
				%>
				<option value="<%=c.getId() %>"><%=c.getName() %></option>
				<%
	
			}
			%>
		</select>
		<select name="child">
			<option value="-1">Child Not Selected!</option>
		</select>
	</form>
	</center>

   
  </body>
</html>
