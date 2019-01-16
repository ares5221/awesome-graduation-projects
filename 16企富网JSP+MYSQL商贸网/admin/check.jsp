<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%
stmt = con.createStatement() ;
String finalername=request.getParameter("finalername");
String finalerpass=request.getParameter("finalerpass");
rs=stmt.executeQuery("SELECT * from finaler where finalername='"+finalername+"' ");
if(!rs.next())
{
response.sendRedirect("index.jsp");
}else
{

rs.first();
	String passDB = rs.getString("finalerpass");//拿到数据库中的密码
	if(passDB.equals(finalerpass)){//与用户填写的密码比较,
session.setAttribute("finaler","yes");
session.setAttribute("finalername",finalername);
response.sendRedirect("finaler.jsp");
	}else{
		response.sendRedirect("index.jsp");
	}
}
stmt.close(); 
con.close();
%>