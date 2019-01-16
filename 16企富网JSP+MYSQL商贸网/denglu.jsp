<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%
stmt = con.createStatement() ;
String username=request.getParameter("user");
String pass=request.getParameter("pass");
rs=stmt.executeQuery("SELECT * from qyml where username='"+username+"'");
if(!rs.next())
{
session.setAttribute("flash","ok");
response.sendRedirect("deng.jsp?erry=Wrong ! Please try agian!");
}
else
{
	rs.first();
	String passDB = rs.getString("pass");//拿到数据库中的密码
	if(passDB.equals(pass)){//与用户填写的密码比较,


session.setAttribute("flash",null);
session.setAttribute("login","ok");
String loginname=rs.getString("username");
String userid=rs.getString("id");
String myname=rs.getString("myname");
String vip=rs.getString("vip");
session.setAttribute("loginname",loginname);
session.setAttribute("userid",userid);
session.setAttribute("myname",myname);
session.setAttribute("vip",vip);
String referer = request.getParameter("referer");
response.sendRedirect(referer);
	}else{
                session.setAttribute("flash","ok");
response.sendRedirect("deng.jsp?erry=Wrong ! Please try agian!");
	}












}
stmt.close(); 
con.close();
%>
