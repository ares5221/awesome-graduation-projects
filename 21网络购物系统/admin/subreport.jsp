<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*,java.util.Date" errorPage="" %>
<%@ include file="conn.jsp"%>
<html>
<head>
<link href=../css.css rel=STYLESHEET type=text/css>
</head>
<%
if(session.getAttribute("admin_name")!=null){
//--------------------------------------logged------------------------------------------------------------------
%>
<table border="0" width="100%" cellspacing="1">
  <tr>
    <td width="100%">
      <table border="0" width="100%" cellspacing="1">
        <tr bgcolor="6894d8"> 
          <td width="100%" colspan="4" bgcolor="#808080" align="center">
          <font color="#FFFFFF">投诉订单查询</font></td>
        </tr>
        <%
		sql="select * from ts";
        rs=mdb.executeQuery(sql);
        
        if(!rs.next())
		{
		%>
        <tr>
          <td width="100%" bgcolor="#FFFFFF" colspan="4">
            <p align="center">暂没有投诉订单</td>
        </tr>
        <%
		}else
		{
        %>
        <tr>
          <td width="25%" bgcolor="#FFFFFF">订单号</td>
          <td width="25%" bgcolor="#FFFFFF">订购人</td>
          <td width="25%" bgcolor="#FFFFFF">投诉时间</td>
          <td width="25%" bgcolor="#FFFFFF">查看详细信息</td>
        </tr>
		<%
		   rs.previous();
		   String sub_number;
		   while(rs.next())
		   {
		    sub_number=rs.getString("sub_number");
		%>
        <tr>
          <td width="25%" bgcolor="#FFFFFF"><%=sub_number%></td>
          <td width="25%" bgcolor="#FFFFFF"><%=rs.getString("user_name")%></td>
          <td width="25%" bgcolor="#FFFFFF"><%=rs.getDate("ts_date")%></td>
          <td width="25%" bgcolor="#FFFFFF"><a href="report.jsp?sub_number=<%=sub_number%>">详细信息</a></td>
        </tr>
		<%
           }
        }
       rs.close();
	   %>
      </table>
    </td>
  </tr>
</table>
<%
}
else{
%>
 <tr>
          <td width="100%" bgcolor="#FFFFFF" colspan="4">
            <p align="center">你没有登陆!</td>
        </tr>
<%
}
mdb.Close();
%>
</html>