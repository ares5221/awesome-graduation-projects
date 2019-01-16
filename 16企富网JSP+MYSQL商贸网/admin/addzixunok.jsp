<%@ include file="checkfinaler.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/ubb.jsp"%>
<%checkData cData = new checkData("");%>
<%@ page import="com.lynews.news.*"%>
<%String fbtime=(String) session.getAttribute("time");%>
<%
stmt = con.createStatement() ;
String lei=request.getParameter("lei");
String topic=request.getParameter("topic");
String fbmem=request.getParameter("fbmem");
String text=request.getParameter("text");
cData.setS(text);
text = cData.formatHtml(true);

// 生成.html
String templateContent="<link href=../../conn/laba.css rel=stylesheet type=text/css><TABLE cellSpacing=1 cellPadding=0 width=550 bgColor=#cccccc border=0 align=center><TBODY><TR bgColor=#ffffff><TD vAlign=center bgColor=#f1f1f1 colSpan=2 height=25><a href=../index.jsp>"+fbmem+topic+"<bR><bR>"+text+"</a></td></tr></tbody></table>";
Calendar calendar = Calendar.getInstance();
String fileName = String.valueOf(calendar.getTimeInMillis()) +".html";
String pathName = application.getRealPath("../zixun/html")+"/";
WriteHtml.save(templateContent,pathName,fileName);
//生成完成



String sql="insert into zixun(lei,topic,text,fbmem,fbtime,fileName) values('"+lei+"','"+topic+"','"+text+"','"+fbmem+"','"+fbtime+"','"+fileName+"')";
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.location.href='glzixun.jsp'}</script>
<%
stmt.close(); 
con.close();
%>