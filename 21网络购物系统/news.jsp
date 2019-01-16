<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*,java.util.*" %>
<%@ page autoFlush="true" errorPage="error.html"%>
<html>
<%@ include file="top.jsp"%>

<link href="css.css" rel="stylesheet" type="text/css">

        <div align="center">
          <center>
        <table width="760" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" >
          <%
	  String str=request.getParameter("news_id");
	  if(str==""){str="1";}
	  int news_id=Cint(str);
      sql="select * from news where news_id="+news_id;
      rs=mdb.executeQuery(sql);
      if (rs.next())
      {%>
          <tr> 
            <td  height="25" ><div align="center"><A href="allnews.asp">新闻中心</A>>><%=rs.getString("news_title")%></div></td>
          </tr>
          <tr> 
            <td height="200" valign="top"><div align="center">日期：<%=rs.getDate("news_date")%></div>
          <div align="center">
            <div align="left">
              <%=rs.getString("news_content")%>
            </div>
          </div></td>
                </tr>
              </table>
          </center>
</div>

          <%}
		  else{
		  out.print("此新闻不存在或已经被删除!");
		  }
%>
<%@ include file="copy.jsp"%>
</body>
</html>