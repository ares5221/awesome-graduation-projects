<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.category.*, java.util.*"%>

<%
List<Category> categories = CategoryService.getInstance().getTopCategories();
%>

<html>
<head>
<script language="javascript" src="script/TV20.js"></script>
<script language="javascript">
	var req;
	var gKey;
	function init() {
		if(window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	
	function myLabelDblClick(key, parentKey) {
		if(findNode(key).subitems.length > 0) return;
		init();
		gKey = key;
		var url = "GetCategoryChilds2.jsp?id=" + escape(key);
		req.open("GET", url, true);
		req.onreadystatechange = callback;
		req.send(null);
	}
	
	function callback() {
		if(4 == req.readyState) {
			if(200 == req.status) {
				eval(req.responseText);
				var node = findNode(gKey);
				if(node.subitems.length > 0) {
					node.refresh();
					node.open();
				}
			}
		}
		
	}
	
	
</script>
</head>

<body>
<script language="javascript">
<!--
	addListener("dblclick", "myLabelDblClick");
	addNode(-1,0,"Àà±ð","images/top.gif");
	<%
	for(int i=0; i<categories.size(); i++) {
		Category c = categories.get(i);
		%>
		addNode(<%=c.getPid()%>,<%=c.getId()%>,"<%=c.getName()%>","images/top.gif");
		<%
	}
	%>
	showTV();
	
-->
</script>
</body>
</html>