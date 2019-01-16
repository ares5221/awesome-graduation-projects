<!--#include file="conn.asp"--><style type="text/css">
<!--
body {
	font-size:12px;
	background-color: #c7baa0;
	margin:0px;
}
.login{
	border: 0px solid #6386B5;
	text-align: center;
}
.login .title{
	font-size: 14px;
	line-height: 30px;
	color: #89613D;
	text-align: center;
	font-weight: bold;
	text-indent: 22px;
	border-bottom-width: 2px;
	border-bottom-style: solid;
	border-bottom-color: #BFA691;
}
.login a{
	color: #000000;
	text-decoration: none;
	text-align: center;
	display: block;
	line-height: 30px;
}
-->
</style><table width="200" border="0" cellspacing="0" cellpadding="0" class="login">
	<form action="product.asp" method="post" name="formsearch" target="_top" id="form1" style="display:inline">
  <tr>
    <td class="title">产品搜索</td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle"><input name="title" type="text" id="title" /></td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle"><select name="class1" id="class1">
<option value="" selected="selected">＝产品分类＝</option><%
sql="select * from leibie order by id asc"
rs.open sql,conn
while not rs.eof
response.write "<option value='"&rs("title")&"'>"&rs("title")&"</option>"
rs.movenext 
wend
rs.close 
%></select><input type="submit" name="Submit" value="提交" /></td>
  </tr>
  </form>
</table>
<div class="login"><div class="title">热门服装</div>
<center><%
dim i
sql="select * from products order by xssl desc"
rs.open sql,conn,1,1

for i=1 to 8 
	if(not rs.eof) then
		Response.Write("<a href='pinfo.asp?id="&rs("id")&"'>")
		Response.Write(rs("title"))
		Response.Write("</a>")
		rs.movenext
	else
		exit for
	end if
next
rs.close
%></center></div>