<!--#include file="inc/conn.asp"-->
<!--#include file="inc/function.asp"-->
<%
Call QuanXian(Link_B)
if Request("action")="del" then
	sqlstr="delete * from friend_links where id="&Request("id")
	conn.execute(sqlstr)
	Tw("<script>alert('友情链接删除成功');window.location='frie_manages.asp';</script>")
	Response.End()
end if
%>
<%
set rs=Server.CreateObject("Adodb.Recordset")
sqlstr="select * from friend_links order by id desc"
rs.open sqlstr,conn,1,1

dim strFileName,MaxPerPage

strField=trim(request("Field"))

if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

ShowSmallClassType=ShowSmallClassType_Default
MaxPerPage=20
strFileName="frie_manages.asp?"
totalput=rs.Recordcount

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.b_t {padding-left:10px;padding-right:10px;}
.p {padding-left:10px;}
.style1 {color: #FF0000}
.style2 {color: #990000}
-->
</style>
</head>

<body>
<form name="form1" method="post" action="?no=eshop" >
  <table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
    <tr >
      <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
          <tr>
            <td align="center" class="table_bg_size">管理友情链接</td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="1">
        <tr class="table_bg_n">
          <td width="120" height="28" align="center">类型</td>
          <td width="240" align="center">名称</td>
          <td width="219" align="center">链接地址</td>
          <td width="80" align="center">操作</td>
        </tr>
        <%
		if currentPage<>1 then
			rs.move MaxPerPage*(currentPage-1)
		end if
		if not rs.eof then
		for i=1 to maxperpage%>
        <tr class="table_bg_n">
          <td height="40" align="center"><%IF rs("link_photo")=Empty Then
		  	Tw("文字链接")
		  else
		  %><img src='<%=rs("link_photo")%>' width="88" height="31">
		  <%End if%>
		  </td>
          <td align="center"><%=rs("link_name")%></td>
          <td align="center"><%=rs("link_addr")%></td>
          <td align="center"><a href="frie_manages.asp?action=del&id=<%=rs("id")%>">删除</a></td>
        </tr>
        <%
		rs.movenext
		if rs.eof then exit for
		next
		else
			Response.Write("<tr><td height='22' colspan=5 bgcolor='#EEEEEE' align='center'>暂时没有添加友情链接</td></tr>")
		end if
		%>
      </table></td>
    </tr>
  </table>
</form>
</body>
</html>
