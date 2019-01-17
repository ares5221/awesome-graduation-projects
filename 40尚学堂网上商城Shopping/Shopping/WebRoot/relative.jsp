<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.bjsxt.shopping.category.*"%>
<%!private List<Category> getTopCategories(List<Category> categories) {
		List<Category> topCategories = new ArrayList<Category>();
		for (int i = 0; i < categories.size(); i++) {
			Category c = categories.get(i);
			if (c.getGrade() == 1) {
				topCategories.add(c);
			}
		}
		return topCategories;
	}

	private List<Category> getChilds(Category parent, List<Category> categories) {
		List<Category> childs = new ArrayList<Category>();
		for (int i = 0; i < categories.size(); i++) {
			Category c = categories.get(i);
			if (c.getPid() == parent.getId()) {
				childs.add(c);
			}
		}
		return childs;
	}

	private String getChildsStr(List<Category> childs) {
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < childs.size(); i++) {
			Category c = childs.get(i);
			buf.append(
					"<a href='ShowProducts.jsp?categoryId=" + c.getId() + "'>")
					.append(c.getName()).append("</a>").append("-");
		}
		return buf.toString();
	}%>

<%
			List<Category> categories = CategoryService.getInstance()
			.getCategories();
	List<Category> topCategories = getTopCategories(categories);
%>

<html>
	<head>
		<title>businessSell</title>
	</head>

	<body onLoad="changeDrop2()">
		<script LANGUAGE="JavaScript">
function changeDrop2() {
	if (document.form.Drop1.selectedIndex == 0) {
		document.form.Drop2.length = 1;
		document.form.Drop1.selectedIndex = 0
		document.form.Drop2.selectedIndex = 0
		document.form.Drop2.options[0].text = "No Top Category Selected";
		document.form.Drop2.options[0].value = "No Top Category Selected";
	}

	<% for(Category top : topCategories) { %>
	
		if (document.form.Drop1.options[document.form.Drop1.selectedIndex].value == <%=top.getId()%>) {
			<%
			List<Category> childs = getChilds(top, categories);
			int i = 1;
			%>
			document.form.Drop2.length = <%=childs.size() + 1%>;
			document.form.Drop2.selectedIndex = 0
			document.form.Drop2.options[0].text = "Select Second Category";
			document.form.Drop2.options[0].value = "Select Second Category";
			
			<% for (Category child : childs) { %>
				document.form.Drop2.options[<%=i%>].text = "<%=child.getName()%>";
				document.form.Drop2.options[<%=i%>].value = "<%=child.getId()%>";
				
			<%
				i ++; 
			} 
			%>
			
			}
	<% } %>

}

function goThere() {
if (document.form.Drop1.selectedIndex == 0) {
	alert("Please Select a Product");
	} else {
	if (document.form.Drop2.selectedIndex == 0) {
		alert("Please Select a Model");
		} else {
		var list1 = document.form.Drop1;
		var list2 = document.form.Drop2;
		var theDIR = list1.options[list1.selectedIndex].value;
		var theProduct = document.form.Drop2.options[list2.selectedIndex].value;
		location.href = "http://www.YourLinkHere.com/" + theDIR + "/" + theProduct + ".htm";
		}
	}
}

</script>


		<form name="form">
			<p>
				<select name="Drop1" onChange="changeDrop2()" size="1">
					<option selected value="Select A Product">
						Select A Top Category
					</option>
					<%
					for (Category top : topCategories) {
					%>
					<option value="<%=top.getId()%>"><%=top.getName()%></option>
					<%
					}
					%>
				</select>
				<br>
				<select name="Drop2" size="1">

				</select>
				<br>
				<input type="button" onClick="goThere()" value="GOTO Product Page"
					name="B1">
			</p>
		</form>


	</body>
</html>

