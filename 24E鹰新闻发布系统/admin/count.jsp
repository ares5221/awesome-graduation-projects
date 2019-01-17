<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="writeClassIndex" class="com.v246.WriteClassIndex" scope="page"/>
<html>
<body>
<%
	try
	{
	writeClassIndex.writeAll();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>

<b>OK</b>
</body>
</html>