<%@ include file="../conn/time.jsp"%>
<%String regtime=(String) session.getAttribute("time");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>

<%
String qq=request.getParameter("qq");
String sf=request.getParameter("sf");
String dldq=request.getParameter("dldq");
String dlname=request.getParameter("dlname");
String password=request.getParameter("password");
String letname=request.getParameter("letname");
String address=request.getParameter("address");
String post=request.getParameter("post");
String tel=request.getParameter("tel");
String email=request.getParameter("email");
String bz=request.getParameter("bz");


String sql="insert into dl(sf,dldq,dlname,password,letname,address,post,tel,email,bz,regtime,qq) values('"+sf+"','"+dldq+"','"+dlname+"','"+password+"','"+letname+"','"+address+"','"+post+"','"+tel+"','"+email+"','"+bz+"','"+regtime+"','"+qq+"')";
stmt.executeUpdate(sql);


rs=stmt.executeQuery("SELECT * from dl where dlname='"+dlname+"'");
rs.next();
String dlid=(String)rs.getString("id");


String sql3="insert into dqjie (dlid) values('"+dlid+"')";
stmt.executeUpdate(sql3);


%>
<script language=JavaScript>{window.alert('申请成功!我们会马上与您联系继续相关事宜!谢谢!');window.location.href='../index.jsp'}</script>



