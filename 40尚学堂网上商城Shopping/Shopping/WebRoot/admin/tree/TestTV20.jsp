<%@page pageEncoding="GB18030"%>
<%@page import="com.bjsxt.shopping.category.*, java.util.*"%>

<%
List<Category> categories = CategoryService.getInstance().getCategories();
%>

<html>
<head>
<script language="javascript" src="script/TV20.js"></script>
</head>

<body>
<script language="javascript">
<!--
	addNode(-1,0,"所有类别","../images/top.gif");
	<%
	for(Category c : categories) {
		%>
		addNode(<%=c.getPid() %>,<%=c.getId()%>,"<%=c.getName() %>","../images/top.gif");
		
		<%
	}
	%>
  	
	
	
	showTV();
-->
</script>
</body>
</html>