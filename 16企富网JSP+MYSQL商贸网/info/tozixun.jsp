<%@ include file="checkadmin.jsp"%>
<%@ include file="checksession.jsp"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ page import="com.lynews.news.*"%>
<%
stmt = con.createStatement() ;
int id = Integer.parseInt((String)request.getParameter("id"));
rs=stmt.executeQuery("SELECT * from book where id="+id);
rs.next();
String topic=rs.getString("topic");
String text=rs.getString("content");
String fbmem=rs.getString("fbmem");
String fbtime=rs.getString("fbtime");
String lei=rs.getString("lei");



// 生成.html
String templateContent="<link href=../../conn/laba.css rel=stylesheet type=text/css><TABLE cellSpacing=1 cellPadding=0 width=550 bgColor=#cccccc border=0 align=center><TBODY><TR bgColor=#ffffff><TD vAlign=center bgColor=#f1f1f1 colSpan=2 height=25><a href=../index.jsp>"+fbmem+topic+"<bR><bR>"+text+"</a></td></tr></tbody></table>";
Calendar calendar = Calendar.getInstance();
String fileName = fbmem+String.valueOf(calendar.getTimeInMillis()) +".html";
String pathName = application.getRealPath("../zixun/html")+"/";
WriteHtml.save(templateContent,pathName,fileName);
//生成完成



String sql="insert into zixun(lei,topic,text,fbmem,fbtime,fileName) values('"+lei+"','"+topic+"','"+text+"','"+fbmem+"','"+fbtime+"','"+fileName+"')";
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.location.href='../zixun'}</script>
<%
stmt.close(); 
con.close();
%>