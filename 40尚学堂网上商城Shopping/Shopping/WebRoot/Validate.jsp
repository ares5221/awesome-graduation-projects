<%
response.setContentType("text/xml");
response.setHeader("Cache-Control", "no-store"); //HTTP1.1
response.setHeader("Pragma", "no-cache"); //HTTP1.0
response.setDateHeader("Expires", 0); //prevents catching at proxy server
System.out.println(request.getParameter("id"));
//check the database
response.getWriter().write("<msg>valid</msg>");
%>
