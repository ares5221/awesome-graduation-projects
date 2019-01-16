<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")==null){
	;}else{
%>
<%
int news_id=Integer.parseInt(request.getParameter("news_id"));
sql="select * from news where news_id="+news_id+"";
rs=mdb.executeQuery(sql);
rs.next();
%><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href=../css.css rel=STYLESHEET type=text/css>
</head>



<table width="500" border="0" cellspacing="0" cellpadding="0" align="center" height="100">
  <tr> 
    <td height="175"> 
      <form name="form1" method="post" action="editnewsok.jsp?news_id=<%=news_id%>">
        <table border="1" width="100%" cellspacing="0" bordercolor="#C0C0C0" style="border-collapse: collapse" cellpadding="0">
          <tr bgcolor="#FFFFFF"> 
            <td colspan="2"> 标题
<input type="text" name="news_title" size="60" class=input value="<%=rs.getString("news_title")%>">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="2"> <font color="#FF0000">新闻内容</font></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td valign="top" colspan="2"> 
              <textarea rows="15" name="news_content" cols="70" class=input><%=rs.getString("news_content")%></textarea>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="2">&nbsp; </td>
          </tr>
          <tr bgcolor="#FFFFFF" align="center"> 
            <td colspan="2"> 
              <input type="submit" name="Submit" value="修改">
            </td>
          </tr>
        </table>
      </form>
    </td>
  </tr>
</table>
<%
			mdb.Close();}%>