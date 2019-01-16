<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="time.jsp"%>
<%
stmt = con.createStatement() ;
int id = Integer.parseInt((String)request.getParameter("id"));
rs=stmt.executeQuery("SELECT * from book where id="+id);
rs.next();
String sql2="update book set readnum=(readnum+1) where id="+id;
stmt.executeUpdate(sql2);%>

<TABLE cellSpacing=0 cellPadding=0 width="750" align=center border=0>
<TBODY>
<TR>
<TD><A onfocus=this.blur() href="../let" target=_blank>
<IMG src="../images/banner2.gif" width=750 border=0></A></TD></TR>
</TBODY></TABLE>


<TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
<TBODY>
<TR>
<TD style="PADDING-LEFT: 20px" bgColor=#ff8000 colSpan=2 height=28>
<IMG height=8 src="../images/ico_oval.gif" width=5 align=absMiddle>&nbsp;<a href=index.jsp class=nav><b>返回首页</b></a></FONT></TD></TR>
<TR>
<TD bgColor=#b25900 colSpan=2 height=2></TD>
</TR>
</TBODY>
</TABLE>


<TABLE cellPadding=0 cellSpacing=0 align=center width=750>
<tr>
<td align=left valign=middle width="7%" height=25  class="norightbuttonborder">
<a href="addbook.jsp"><img src="images/postnew.gif" border="0" alt="发表一个新话题"></a>
</td>
<td width=50% class="norightbuttonborder">&nbsp;</td>
<th width=5% align=right class="norightbuttonborder">
<a href="javascript:window.print()"><img src="images/printpage.gif" border=0></a>&nbsp;
</th>
</tr>
</table>










<table cellspacing="0" cellpadding="0" border="0" width="750" align="center">
<tr><td  class="buttoncolor">
<table border="0" cellspacing="1" cellpadding="2" width="100%">
<tr><td width="21%"><font color=ffffff>作者:<%=rs.getString("fbmem")%></font></td>
<td><table cellspacing="0" cellpadding="0" border="0" width="100%" class="smalltxt" style="table-layout: fixed; word-wrap: break-word" >
<tr style="color: #A8C1D9"><td class="bold"><font color=ffffff>标题: <%=rs.getString("topic")%></font></td>
</tr></table></td>
</tr>
<tr bgcolor="ffffff">
<td valign="top" width="21%"><bR>
企业:<%=rs.getString("fbmemcompany")%><bR><bR>
<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../info/memgrade.jsp?memid=<%=rs.getString("fbmemid")%> topmargin=0 width=65 height=15></iframe><br><br>
<a href=../web/index.jsp?id=<%=rs.getString("fbmemid")%> target="_blank">浏览他的网站</a>
<bR><bR>
<a href="../info/addfriend.jsp?friendid=<%=rs.getString("fbmemid")%>&friendname=<%=rs.getString("fbmem")%>&friendcompany=<%=rs.getString("fbmemcompany")%>" target="_blank"><img src="../images/addfriend.gif" border="0" alt="加为商友"></a>
</td>
<td width="79%" height="100%">
<table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed; word-wrap: break-word">
<tr><td valign="top"><span class="bold"><span class="smalltxt">
&nbsp;
&nbsp;<%=rs.getString("content")%>
</td></tr></table>
</td></tr>
<tr bgcolor="ffffff"><td valign="middle" class="smalltxt">&nbsp;
2004-11-17 13:42</td><td valign="middle">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr class="smalltxt"><td align="center">
<%if ((String) session.getAttribute("login")==null){}else{
if(((String)session.getAttribute("loginname")).compareTo(banzu)==0){%>
<a href=../info/bookstatus.jsp?id=<%=rs.getString("id")%>&status=0><img src=images/folderstate2.gif border=0></a>
<a href=../info/bookstatus.jsp?id=<%=rs.getString("id")%>&status=1><img src=images/folderstate1.gif border=0></a>
<a href=../info/bookstatus.jsp?id=<%=rs.getString("id")%>&status=2><img src=images/folderstate3.gif border=0></a>
<a href=../info/delbook.jsp?id=<%=rs.getString("id")%>><img src=images/del.gif border=0></a>
<a href=../info/lock.jsp?id=<%=rs.getString("id")%>&lockop=1><img src=images/lock.gif border=0></a>
<a href=../info/lock.jsp?id=<%=rs.getString("id")%>&lockop=0><img src=images/openlock.gif border=0></a>
<a href=../info/tozixun.jsp?id=<%=rs.getString("id")%>><img src=images/to.gif border=0></a>
<%}
}%>
</td><td align="right">
&nbsp;<a href="../info/sendmsg.jsp?recemem=<%=rs.getString("fbmemid")%>&memname=<%=rs.getString("fbmem")%>" target="_blank"><img src="../images/sendmsg.gif" border="0" alt="发送留言"></a>
</td></tr></table>
</td></tr>
</table></td></tr></table>




<%String topicidp=rs.getString("id");%>
<%String lockop=rs.getString("lockop");%>





<TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
<TBODY>
<TR>
<TD style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 0px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid" vAlign=top align=middle bgColor=#fffff7>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center  border=0>
<TBODY>
<TR><TD background=../images/1x3.gif height=1></TD></TR></TBODY>
</TABLE>
</TD></TR></TBODY></TABLE>


<%
rs=stmt.executeQuery("SELECT * from book where topicid='"+rs.getString("id")+"'");
int i=2;
while(rs.next())
{
%>




<table cellspacing="0" cellpadding="0" border="0" width="750" align="center">
<tr>  <TD bgcolor=ff9933>
<table border="0" cellspacing="1" cellpadding="2" width="100%">
<tr><td width="21%">回复人:<%=rs.getString("fbmem")%></td>
<td><table cellspacing="0" cellpadding="0" border="0" width="100%" class="smalltxt" style="table-layout: fixed; word-wrap: break-word" >
<tr><td >标题: <%=rs.getString("topic")%></td>
</tr></table></td>
</tr>
<tr bgcolor="ffffff">
<td valign="top" width="21%"><bR><bR>
企业:<%=rs.getString("fbmemcompany")%><bR><bR>
<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../info/memgrade.jsp?memid=<%=rs.getString("fbmemid")%> topmargin=0 width=65 height=15></iframe><br><br>
<a href=../web/index.jsp?id=<%=rs.getString("fbmemid")%> target="_blank">浏览他的网站</a><bR><bR>
<a href="../info/addfriend.jsp?friendid=<%=rs.getString("fbmemid")%>&friendname=<%=rs.getString("fbmem")%>&friendcompany=<%=rs.getString("fbmemcompany")%>"><img src="../images/addfriend.gif" border="0" alt="加为商友"></a>
</td>
<td width="79%" height="100%">
<table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed; word-wrap: break-word">
<tr><td valign="top">
&nbsp;
&nbsp;<%=rs.getString("content")%>
</td></tr></table>
</td></tr>
<tr bgcolor="ffffff"><td valign="middle" class="smalltxt">&nbsp;
2004-11-17 13:42</td><td valign="middle">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr class="smalltxt"><td align="right">
<%if ((String) session.getAttribute("login")==null){}else{
if(((String)session.getAttribute("loginname")).compareTo(banzu)==0){%>
<a href=../info/delbook2.jsp?id=<%=rs.getString("id")%>><img src=images/del.gif border=0></a>
<%}
}%>
</td><td align="right">第<%=i%>楼 &nbsp;
</td></tr></table>
</td></tr>
</table></td></tr></table>



<%i++;
}%>



<table ><tr><td height=5></td></tr></table>






<%if (lockop.compareTo("1")==0){%><center><img src=images/locker.gif> <font color=red>此主题已被锁定不能回复</font></center><%}else{%>


<form  action="../info/replybookok.jsp" method="post" name="Form1"  >
<input name="memid" type="hidden" class="zl" id="memid" size="81" value="<%=(String) session.getAttribute("userid")%>">
<input name="topicid" type="hidden" class="zl" id="topicid" size="81" value="<%=topicidp%>">




<table cellspacing="0" cellpadding="0" border="0" width="750" align="center">
<tr>  <TD bgcolor=cccccc>
<table border="0" cellspacing="1" cellpadding="2" width="100%">
<tr><td width="21%">快速回复</td>
<td><table cellspacing="0" cellpadding="0" border="0" width="100%" class="smalltxt" style="table-layout: fixed; word-wrap: break-word" >
<tr><td >
标题:<input name="topic" type="text" class="zl" id="topic" size="88" 
<%if ((String) session.getAttribute("login")==null){%>readonly=ture<%}%>>

</td>
</tr></table></td>
</tr>
<tr bgcolor="ffffff">
<td valign="top" width="21%">

<%if ((String) session.getAttribute("login")==null){%>你是游客未登录!<br><br>请<a href=../deng.jsp><font color=red>登录</font></a>后再回复!<br><br><%}else{%><bR><bR>
回复人:<%=(String) session.getAttribute("loginname")%><bR>
<bR><bR>
<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../info/memgrade.jsp?memid=<%=(String) session.getAttribute("userid")%> topmargin=0 width=65 height=15></iframe><%}%>

</td>
<td width="79%" height="100%">
<table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed; word-wrap: break-word">
<tr><td valign="top"><textarea class=f11 rows="8" name="content" cols="81"  
<%if ((String) session.getAttribute("login")==null){%>readonly=ture<%}%>></textarea>

<div align=center><input type="button" value="  回复  " onclick="check()" 
<%if ((String) session.getAttribute("login")==null){%> disabled<%}%>></div>

</td></tr></table>
</td></tr>
</table>
</td></tr>
</table></td></tr></table>

<%}%>



<script LANGUAGE="JavaScript">
function check()
{     
 if (document.Form1.topic.value == "")        
  {        
    alert("请输入标题！");        
    document.Form1.topic.focus();        
    return (false);        
  }        
 if (document.Form1.content.value == "")        
  {        
    alert("请输入内容！");        
    document.Form1.content.focus();        
    return (false);        
  }        
           
  
    document.Form1.submit()
}
</script>






<table ><tr><td height=5></td></tr></table>
<%@ include file="../end.jsp"%>