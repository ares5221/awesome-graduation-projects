<%@ page language="java" import="com.bjsxt.shopping.category.*, java.util.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));

List<Category> childs = CategoryService.getInstance().getChilds(id) ;
System.out.println(childs.size());
StringBuffer buf = new StringBuffer();
buf.append("document.frm.child.length = " + (childs.size()+1) + ";\n");
buf.append("document.frm.child.options[0].value = '-1';\n");
buf.append("document.frm.child.options[0].text = 'Pls Select!';\n");
buf.append("document.frm.child.selectedIndex = 0;\n");

for(int i=0; i<childs.size(); i++) {
	Category c = childs.get(i);
	buf.append("document.frm.child.options[" + (i+1) + "].value = '" + c.getId() + "';\n");
	buf.append("document.frm.child.options[" + (i+1) + "].text = '" + c.getName() + "';\n");
}

response.setContentType("text/html;charset=gbk");
response.setHeader("Cache-Control", "no-store"); //HTTP1.1
response.setHeader("Pragma", "no-cache"); //HTTP1.0
response.setDateHeader("Expires", 0); //prevents catching at proxy server

response.getWriter().write(buf.toString());
%>
