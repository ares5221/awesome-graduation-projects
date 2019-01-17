<%
String admin = (String)session.getAttribute("admin");
if(admin == null || !admin.trim().equals("admin")) {
	response.sendRedirect("Login.jsp");
	return;
}
%>