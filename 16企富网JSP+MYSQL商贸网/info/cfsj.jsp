<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="checksession.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../conn/time.jsp"%>
<%
String id = request.getParameter("id");
if(id==null){%><script language=JavaScript>{window.alert('请选择信息再操作!');window.location.href='glsj.jsp'}</script><%}else{%>
<%
stmt = con.createStatement() ;

String[] ids =  request.getParameterValues("id");
	String selectSql = "SELECT * from sjxx where id ";

	StringBuffer idstr=new StringBuffer();
    for(int i=0;i<ids.length;i++){
      if(i!=0) idstr.append(",");
      idstr.append(ids[i]);
    }
    if(ids.length==1){
      selectSql+="="+ids[0];
    }else{
      selectSql+=" in ("+idstr.toString()+")";
    }

stmt = con.createStatement() ;
rs=stmt.executeQuery( selectSql );
while(rs.next())
{
String fbtime=(String) session.getAttribute("time");
String content=rs.getString("content");
String dfl=rs.getString("dfl");
String sfl=rs.getString("sfl");
String lei=rs.getString("lei");
String fast=rs.getString("fast");
String topic=rs.getString("topic");
String myname=rs.getString("myname");
String username=rs.getString("username");
String tel=rs.getString("tel");
String fax=rs.getString("fax");
String email=rs.getString("email");
String company=rs.getString("company");
String post=rs.getString("post");
String web=rs.getString("web");
String address=rs.getString("address");
String memid=rs.getString("memid");
String fileName=rs.getString("fileName");
String main="0";
String sql="insert into sjxx(dfl,sfl,lei,topic,myname,username,tel,fax,email,address,content,fbtime,fast,company,post,web,memid,fileName,main) values('"+dfl+"','"+sfl+"','"+lei+"','"+topic+"','"+myname+"','"+username+"','"+tel+"','"+fax+"','"+email+"','"+address+"','"+content+"','"+fbtime+"','"+fast+"','"+company+"','"+post+"','"+web+"','"+memid+"','"+fileName+"','"+main+"')";
stmt.executeUpdate(sql);
}
response.sendRedirect("glsj.jsp");
}
%>