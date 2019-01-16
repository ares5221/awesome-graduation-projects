<%String regtime=(String) session.getAttribute("time");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/ubb.jsp"%>
<%checkData cData = new checkData("");%>
<%
String qyjj=request.getParameter("qyjj");
cData.setS(qyjj);
qyjj = cData.formatHtml(true);
String username=request.getParameter("user");
String pass=request.getParameter("pass");
String question=request.getParameter("question");
String answer=request.getParameter("answer");
String myname=request.getParameter("myname");
String ch=request.getParameter("ch");
String address=request.getParameter("address");
String zw=request.getParameter("zw");
String post=request.getParameter("post");
String tel=request.getParameter("tel");
String fax=request.getParameter("fax");
String email=request.getParameter("email");
String web=request.getParameter("web");
int comeon = Integer.parseInt((String)request.getParameter("comeon"));
String qymc=request.getParameter("qymc");
String dlid=request.getParameter("dlid");

stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from qyml where username='"+username+"'");
if(!rs.next()){

String sql="insert into qyml(username,pass,question,answer,myname,ch,email,web,address,zw,post,tel,fax,comeon,qymc,qyjj,regtime,dlid) values('"+username+"','"+pass+"','"+question+"','"+answer+"','"+myname+"','"+ch+"','"+email+"','"+web+"','"+address+"','"+zw+"','"+post+"','"+tel+"','"+fax+"','"+comeon+"','"+qymc+"','"+qyjj+"','"+regtime+"','"+dlid+"')";
stmt.executeUpdate(sql);

String sql2="insert into visiter (username) values('"+username+"')";
stmt.executeUpdate(sql2);


rs=stmt.executeQuery("SELECT * from qyml where username='"+username+"'");
rs.next();
String memid=(String)rs.getString("id");

String sql3="insert into grade (memid) values('"+memid+"')";
stmt.executeUpdate(sql3);

String sql4="insert into web (memid) values('"+memid+"')";
stmt.executeUpdate(sql4);


session.setAttribute("sound",null);
session.setAttribute("flash",null);
%>
<script language=JavaScript>{window.alert('注册成功!请马上登录!');window.location.href='../deng.jsp'}</script>


<%
stmt.close(); 
con.close();


}
else
{%>
<script language=JavaScript>{window.alert('对不起！请帐号已被注册!');window.open("../info/renzheng.jsp?id=<%=username%>");window.history.go(-1);}</script>
<%}
%>




