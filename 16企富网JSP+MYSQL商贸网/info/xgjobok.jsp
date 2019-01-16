<%@ include file="checksession.jsp"%>
<%String fbtime=(String) session.getAttribute("time");%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/ubb.jsp"%>
<%@ page import="com.lynews.news.*"%>

<%
int id = Integer.parseInt((String)request.getParameter("id"));
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from job where id="+id);
rs.next();
int  userid=Integer.parseInt((String) session.getAttribute("userid"));
if (userid==Integer.parseInt((String) rs.getString("fbmemid"))){%>

<%checkData cData = new checkData("");%>
<%
String content=request.getParameter("content");
cData.setS(content);
content = cData.formatHtml(true);
String lei=request.getParameter("lei");
String topic=request.getParameter("topic");
String myname=request.getParameter("myname");
String tel=request.getParameter("tel");
String fax=request.getParameter("fax");
String email=request.getParameter("email");
String fbmemcompany=request.getParameter("fbmemcompany");
String jobaddress=request.getParameter("jobaddress");
String fbmemid=request.getParameter("fbmemid");
String jobnum=request.getParameter("jobnum");
String fbmem=request.getParameter("fbmem");
String address=request.getParameter("address");


String sql="update job set fbtime='"+fbtime+"',content='"+content+"',lei='"+lei+"',topic='"+topic+"',myname='"+myname+"',tel='"+tel+"',fax='"+fax+"',email='"+email+"',fbmemcompany='"+fbmemcompany+"',jobaddress='"+jobaddress+"',fbmemid='"+fbmemid+"',jobnum='"+jobnum+"',fbmem='"+fbmem+"',address='"+address+"' where id="+id;
stmt.executeUpdate(sql);

%>
<script language=JavaScript>{window.alert('修改成功!');window.location.href='gljob.jsp'}</script>
<%
stmt.close(); 
con.close();
%>


<%}else{%>
<script language=JavaScript>{window.alert('无权操作!');window.location.href='glsj.jsp'}</script>
<%
}
%>
