<!--#include file="inc/conn.asp"-->
<%
Call QuanXian(Netant_admin_B)
ID=Request("ID")
title=Request("title")
IF Request("action")="Modify1" and ID<>Empty and title<>Empty Then
	conn.execute("update Content set title='"&title&"' where ID="&ID&" ")
	Response.Write("<script>alert('修改成功');window.location='netant_admin_content.asp'</script>")
	Response.end
End IF
IF Request("action")="ADD" and title<>Empty Then
	conn.execute("insert into Content(title)values('"&title&"')")
	Response.Write("<script>alert('添加成功');window.location='netant_admin_content.asp'</script>")
	Response.End
End IF
IF Request("action")="del" and ID<>Empty Then
	conn.execute("delete from Content where ID="&ID&"")
	Response.Write("<script>alert('删除成功');window.location='netant_admin_content.asp'</script>")
	Response.End
End IF
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="style_admin.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script>
function delcontent()
{
	if(!confirm("确定前台没有使用后在删除！确定删除按确定!"))
	{
	return false;
	}
}

</script>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="26" background="images/admin_bg_1.gif"><table width="250" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="50%" align="center" class="table_bg_size"><a href="netant_admin.asp" style="color:#FFFFFF;">1、后台设置</a></td>
        <td width="50%" align="center" class="table_bg_size"><a href="netant_admin_content.asp" style="color:#FFFFFF;">2、页面栏目设置</a></td>
      </tr>
    </table></td>
  </tr>
</table>
<br>
<br>
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="table_border">
  <tr>
    <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
        <tr>
          <td align="center" class="table_bg_size">栏目设置</td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
        <tr align="center" class="table_bg_n">
          <td width="10%" height="22"><B>排序</B></td>
          <td width="47%"><B>类别名称</B></td>
          <td width="8%"><B>操作二</B></td>
          <td width="8%"><B>操作三</B></td>
        </tr>
		<%		
		Set rsB=Server.CreateObject("adodb.recordset")
		StrSql="select * from Content Order by ID Asc"
		rsB.open StrSql,conn,1,3
		if Not rsB.eof then
		Do while Not rsB.Eof 
		Q=Q+1
		%>
        <tr class="table_bg_n">
          <td height="22" align="center" style="color:#990000;"><%Response.Write(Q)%></td>
          <td class="padding-left-10"><img src="images/tree_folder4.gif" width="15" height="15">
          <%Tw(rsB("title"))%></td>
          <td align="center"><a href="?action=Modify&ID=<%=rsB("ID")%>" onClick="return Modifytcontent()">编辑</A></td>
          <td align="center"><a href="?ID=<%=rsB("ID")%>&action=del" onClick="return delcontent()">删除</A></td>
        </tr>
        <%
		rsB.MoveNext
		Loop
		End IF
		%>
		<%
		IF Request("action")=Empty Then
		%>
		<tr class="table_bg_n">
          <td height="22" colspan="4" align="center" class="table_bg_n" style="color:#990000;">
		  <form name="form2" method="post" action="?" style="margin:0px;">
            添加栏目：
            <input name="title" type="text" id="title">
			<input name="action" type="hidden" value="ADD">
            &nbsp;
            <input type="submit" name="Submit2" value="添加栏目">
          </form></td>
        </tr>
		<%
		Else
		IF Request("ID")<>Empty Then
			set rsm=conn.execute("select title,ID from Content where ID="&Request("ID")&"")
			IF not rsm.eof then
				titlename=rsm("title")
			End IF
			rsm.close
		End IF
		%>
		<tr class="table_bg_n">
          <td height="22" colspan="4" align="center" class="table_bg_n" style="color:#990000;">
		  <form name="form2" method="post" action="?" style="margin:0px;">
            修改栏目：
                <input name="title" type="text" id="title" value="<%=titlename%>">
				<input name="action" type="hidden" value="Modify1">
				<input name="ID" type="hidden" value="<%=Request("id")%>">
      &nbsp;
      <input type="submit" name="Submit22" value="修改栏目">
          </form></td>
        </tr>
		<%
		End IF
		%>
      </table></td>
  </tr>
</table>
</body>
</html>
