<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="config.jsp"%>


<br>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>

<%int id = Integer.parseInt((String)session.getAttribute("Did"));
rs=stmt.executeQuery("SELECT * from dqzixun where dlid='"+id+"' and lei=2");%>


<div align=center>友情连接:&nbsp;<a href=<%=WebUrl%> target="_blank"><%=webname%></a>&nbsp;
<%while(rs.next()){%>
<a href=<%=rs.getString("url")%> target="_blank"><%=rs.getString("topic")%></a>&nbsp;
<%}%>
</div>


</TR></TBODY></TABLE>


<%
rs=stmt.executeQuery("SELECT * from dl where id="+id);
rs.next();%>


      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD align=middle width=180 height=85><a href=../www/law.jsp?id=<%=(String) session.getAttribute("Did")%> target="_blank"><IMG  
            src="../www/images/law.gif" border=0></a></TD>
          <TD rowSpan=2>&nbsp;<FONT 
            color=#ff3300>＋</FONT>&nbsp;联系电话： <%=rs.getString("tel")%><bR>&nbsp;<FONT 
            color=#ff3300>＋</FONT>&nbsp;客服ＱＱ：&nbsp;<%=rs.getString("qq")%><BR>&nbsp;<FONT 
            color=#ff3300>＋&nbsp;<FONT color=#000000>电子信箱：</FONT>
<a href=mailto:<%=rs.getString("email")%>><%=rs.getString("email")%></a>
</FONT>


<BR>&nbsp;<FONT color=#ff3300>＋</FONT>&nbsp;<FONT color=#000000>联系电址： <%=rs.getString("address")%> </FONT>
<BR>&nbsp;<FONT  color=#ff3300>＋</FONT>&nbsp;版权所有：&nbsp;&copy;&nbsp;2004-2005&nbsp;&nbsp;<A 
            href="<%=WebUrl%>" target="_parent"><%=webname%></A>&nbsp;&nbsp;<STRONG></STRONG><BR>

</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>