<%@ page language="java" import="java.util.*, com.bjsxt.shopping.category.*" pageEncoding="GB18030"%>

<%!
private List<Category> getTopCategories(List<Category> categories) {
	List<Category> topCategories = new ArrayList<Category>();
	for(int i=0; i<categories.size(); i++) {
		Category c = categories.get(i);
		if(c.getGrade() == 1) {
			topCategories.add(c);
		}
	}
	return topCategories;
}

private List<Category> getChilds(Category parent, List<Category> categories) {
	List<Category> childs = new ArrayList<Category>();
	for(int i=0; i<categories.size(); i++) {
		Category c = categories.get(i);
		if(c.getPid() == parent.getId()) {
			childs.add(c);
		}
	}
	return childs;
}
 %>

<%
List<Category> categories = CategoryService.getInstance().getCategories();
List<Category> topCategories = getTopCategories(categories);
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
		function change() {
			if (document.frm1.parent.selectedIndex == 0) {
				document.frm1.child.length = 1;
				document.frm1.child.selectedIndex = 0
				document.frm1.child.options[0].text = "Select Child:";
				document.frm1.child.options[0].value = "-1";
			}
			
			<%
			for(int i=0; i<topCategories.size(); i++) {
				Category parent = topCategories.get(i);
				List<Category> childs = getChilds(parent, categories);
			%>
				if (document.frm1.parent.options[document.frm1.parent.selectedIndex].value == "<%=parent.getId()%>") {
					document.frm1.child.length = <%=childs.size() + 1%>;
					document.frm1.child.selectedIndex = 0
					document.frm1.child.options[0].text = "Select Child:";
					document.frm1.child.options[0].value = "-1";
					
					<%
					for(int j=0; j<childs.size(); j++) {
					%>
						document.frm1.child.options[<%=j+1%>].text = "<%=childs.get(j).getName()%>";
						document.frm1.child.options[<%=j+1%>].value = "<%=childs.get(j).getId()%>";
					<%
					}
					%>
					
				}
			<%
			}
			%>			
		}
	</script>
	
  </head>
  
  <body>
    联动菜单有好多种技术 <br>
    1:提前取出来所有的内容 <br>
    2:第一级菜单改变的时候, 提交到本身页面, 刷新页面<br>
    3:使用Frame<br>
    4:AJAX<br>
    
    <center>第一种</center>
    <form name="frm1">
    	TOP CATEGORY:
    	<select name="parent" onchange="change()">
    		<option value="-1">Please Select:</option>
    		<%
    		
    		for(int i=0; i<topCategories.size(); i++) {
    			Category parent = topCategories.get(i);
    		%>
    			<option value="<%=parent.getId()%>"><%=parent.getName()%></option> 	
    		<% 
    		}
    		%>
    	</select>
    	CHILD CATEGORY:
    	<select name="child">
    		<option value="-1">Select Child:</option>
    	</select>
    </form>
    
    <br>
    <br>
    <br>
    <br>
    <br>
    
    
  </body>
</html>
