<%@ include file="checksession.jsp"%>
<%String fbtime=(String) session.getAttribute("time");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>

<%
String lei=request.getParameter("lei");
String showname=request.getParameter("showname");
String showxing=request.getParameter("showxing");
String showaddress=request.getParameter("showaddress");
String showphoto=request.getParameter("showphoto");
String company=request.getParameter("company");
String username=request.getParameter("username");
String myname=request.getParameter("myname");
String tel=request.getParameter("tel");
String address=request.getParameter("address");
String email=request.getParameter("email");
String memid=request.getParameter("memid");





String sql9="update grade set fen=(fen+5) where memid='"+memid+"'";
stmt.executeUpdate(sql9);






String sql="insert into showbar (lei,showname,showxing,showaddress,showphoto,myname,address,tel,email,memid,fbtime,company,username) values('"+lei+"','"+showname+"','"+showxing+"','"+showaddress+"','"+showphoto+"','"+myname+"','"+address+"','"+tel+"','"+email+"','"+memid+"','"+fbtime+"','"+company+"','"+username+"')";
stmt.executeUpdate(sql);
%>
<script language=JavaScript>{window.alert('成功发布!此次操作为您带来5点积分!');window.location.href='glshow.jsp'}</script>
<%
stmt.close(); 
con.close();
%>