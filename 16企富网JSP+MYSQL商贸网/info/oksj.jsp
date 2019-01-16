<%@ include file="checksession.jsp"%>
<%String fbtime=(String) session.getAttribute("time");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/ubb.jsp"%>

<%@ page import="com.lynews.news.*"%>

<%checkData cData = new checkData("");%>
<%
String content=request.getParameter("content");
cData.setS(content);
content = cData.formatHtml(true);
String dfl=request.getParameter("dfl");
String sfl=request.getParameter("sfl");
String lei=request.getParameter("lei");
String fast=request.getParameter("fast");
String topic=request.getParameter("topic");
String myname=request.getParameter("myname");
String username=request.getParameter("username");
String tel=request.getParameter("tel");
String fax=request.getParameter("fax");
String email=request.getParameter("email");
String company=request.getParameter("company");
String post=request.getParameter("post");
String web=request.getParameter("web");
String address=request.getParameter("address");
String memid=request.getParameter("memid");


// 生成.html
String templateContent="<link href=../../conn/laba.css rel=stylesheet type=text/css><TABLE cellSpacing=1 cellPadding=0 width=550 bgColor=#cccccc border=0 align=center><TBODY><TR bgColor=#ffffff><TD vAlign=center bgColor=#f1f1f1 colSpan=2 height=25><a href=../index.jsp>"+dfl+"<bR><bR>"+sfl+"<bR><bR>"+company+"<bR><bR>"+topic+"<bR><bR>"+content+"</a></td></tr></tbody></table>";
Calendar calendar = Calendar.getInstance();
String fileName = memid + String.valueOf(calendar.getTimeInMillis()) +".html";
String pathName = application.getRealPath("../sj/html")+"/";
WriteHtml.save(templateContent,pathName,fileName);
//生成完成




String sql9="update grade set fen=(fen+3) where memid='"+memid+"'";
stmt.executeUpdate(sql9);





String sql="insert into sjxx(dfl,sfl,lei,topic,myname,tel,fax,email,address,content,fbtime,fast,company,post,web,memid,fileName,username) values('"+dfl+"','"+sfl+"','"+lei+"','"+topic+"','"+myname+"','"+tel+"','"+fax+"','"+email+"','"+address+"','"+content+"','"+fbtime+"','"+fast+"','"+company+"','"+post+"','"+web+"','"+memid+"','"+fileName+"','"+username+"')";
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.alert('成功发布!此次操作为您带来3点积分!');window.location.href='glsj.jsp'}</script>
<%
stmt.close(); 
con.close();
%>
