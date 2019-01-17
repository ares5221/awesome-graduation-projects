<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.*"%>
<%
	String sContent = new String(request.getParameter("content1").getBytes("iso8859_1"));
	/*System.out.println();
	System.out.println();
	System.out.println();
	System.out.println();
	System.out.println();
	System.out.print("取得的html标记："+"\n"+sContent+"\n"+"主要问题可能出现在upload.jsp里的第202行的setHtml()");
	*/
        out.println("编辑的内容如下：<br><br>"+sContent);
        out.println(
        "<br><br><p><input type=button value=' 退回 ' onclick='history.back()'></p>");
%>
