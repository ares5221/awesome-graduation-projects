<%String fbtime=(String) session.getAttribute("time");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/ubb.jsp"%>
<%checkData cData = new checkData("");%>
<%@ page import="com.lynews.news.*"%>
<%
String content=request.getParameter("content");
cData.setS(content);
content = cData.formatHtml(true);

String dfl=request.getParameter("dfl");
String sfl=request.getParameter("sfl");
String lei=request.getParameter("lei");
String topic=request.getParameter("topic");
String myname=request.getParameter("myname");
String tel=request.getParameter("tel");
String fax=request.getParameter("fax");
String email=request.getParameter("email");
String address=request.getParameter("address");
String ok="0";
String reged="0";




// 生成.html
String templateContent="<link href=../../conn/laba.css rel=stylesheet type=text/css><TABLE cellSpacing=1 cellPadding=0 width=550 bgColor=#cccccc border=0 align=center><TBODY><TR bgColor=#ffffff><TD vAlign=center bgColor=#f1f1f1 colSpan=2 height=25><a href=../index.jsp>"+dfl+"<bR><bR>"+sfl+"<bR><bR>"+"<bR><bR>"+topic+"<bR><bR>"+content+"</a></td></tr></tbody></table>";
Calendar calendar = Calendar.getInstance();
String fileName = tel+ String.valueOf(calendar.getTimeInMillis()) +".html";
String pathName = application.getRealPath("../sj/html")+"/";
WriteHtml.save(templateContent,pathName,fileName);
//生成完成



String sql="insert into sjxx(dfl,sfl,lei,topic,myname,tel,fax,email,address,content,fbtime,ok,reged,fileName) values('"+dfl+"','"+sfl+"','"+lei+"','"+topic+"','"+myname+"','"+tel+"','"+fax+"','"+email+"','"+address+"','"+content+"','"+fbtime+"','"+ok+"','"+reged+"','"+fileName+"')";
stmt.executeUpdate(sql);
%>
<script language=JavaScript>{window.alert('提交成功!我们将在最短的时间内审核您的信息!谢谢!');window.location.href='../'}</script>
<%
stmt.close(); 
con.close();
%>



