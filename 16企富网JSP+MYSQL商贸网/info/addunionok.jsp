<%String fbtime=(String) session.getAttribute("time");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/ubb.jsp"%>

<%@ page import="com.lynews.news.*"%>

<%checkData cData = new checkData("");%>
<%
String webtext=request.getParameter("webtext");
cData.setS(webtext);
webtext = cData.formatHtml(true);
String webname=request.getParameter("webname");
String weburl=request.getParameter("weburl");
String biglei=request.getParameter("biglei");
String smalllei=request.getParameter("smalllei");






// 生成.html
String templateContent="<link href=../../conn/laba.css rel=stylesheet type=text/css><TABLE cellSpacing=1 cellPadding=0 width=550 bgColor=#cccccc border=0 align=center><TBODY><TR bgColor=#ffffff><TD vAlign=center bgColor=#f1f1f1 colSpan=2 height=25><a href=http://"+weburl+">"+webname+"<bR><bR>"+weburl+"<bR><bR>"+biglei+"<bR><bR>"+smalllei+"<bR><bR>"+webtext+"</a></td></tr></tbody></table>";
Calendar calendar = Calendar.getInstance();
String fileName = String.valueOf(calendar.getTimeInMillis()) +".html";
String pathName = application.getRealPath("../union/html")+"/";
WriteHtml.save(templateContent,pathName,fileName);
//生成完成



String sql="insert into unionbar (webname,webtext,fbtime,weburl,biglei,smalllei,fileName) values('"+webname+"','"+webtext+"','"+fbtime+"','"+weburl+"','"+biglei+"','"+smalllei+"','"+fileName+"')";
stmt.executeUpdate(sql);
%>
<script language=JavaScript>{window.location.href='../union/add4.jsp'}</script>
<%
stmt.close(); 
con.close();
%>