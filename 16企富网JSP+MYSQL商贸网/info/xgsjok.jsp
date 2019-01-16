<%@ include file="checksession.jsp"%>
<%String fbtime=(String) session.getAttribute("time");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/ubb.jsp"%>
<%@ page import="com.lynews.news.*"%>

<%
int id = Integer.parseInt((String)request.getParameter("id"));
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from sjxx where id="+id);
rs.next();
int  userid=Integer.parseInt((String) session.getAttribute("userid"));
if (userid==Integer.parseInt((String) rs.getString("memid"))){%>

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

// 删除旧文档
String fileNameold = "../sj/html/"+rs.getString("fileName");
String pathNameold = application.getRealPath(fileNameold) ;
boolean del = DelHtml.del(pathNameold);
//删除完成

// 生成.html
String templateContent="<link href=../../conn/laba.css rel=stylesheet type=text/css><TABLE cellSpacing=1 cellPadding=0 width=550 bgColor=#cccccc border=0 align=center><TBODY><TR bgColor=#ffffff><TD vAlign=center bgColor=#f1f1f1 colSpan=2 height=25><a href=../index.jsp>"+dfl+"<bR><bR>"+sfl+"<bR><bR>"+company+"<bR><bR>"+topic+"<bR><bR>"+content+"</a></td></tr></tbody></table>";
Calendar calendar = Calendar.getInstance();
String fileName = memid + String.valueOf(calendar.getTimeInMillis()) +".html";
String pathName = application.getRealPath("../sj/html")+"/";
WriteHtml.save(templateContent,pathName,fileName);
//生成完成


String sql="update sjxx set dfl='"+dfl+"',sfl='"+sfl+"',lei='"+lei+"',topic='"+topic+"' ,myname='"+myname+"' ,tel='"+tel+"' ,fax='"+fax+"' ,email='"+email+"' ,address='"+address+"' ,content='"+content+"' ,fbtime='"+fbtime+"' ,fast='"+fast+"' ,company='"+company+"' ,post='"+post+"',username='"+username+"' ,web='"+web+"' ,memid='"+memid+"' ,fileName='"+fileName+"' where id="+id;
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.alert('修改成功!');window.location.href='glsj.jsp'}</script>
<%
stmt.close(); 
con.close();
%>


<%}else{%>
<script language=JavaScript>{window.alert('无权操作!');window.location.href='glsj.jsp'}</script>
<%
}
%>
