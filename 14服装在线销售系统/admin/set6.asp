<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script language="JavaScript" type="text/javascript" src="auto.js"></script>
<style type="text/css">
<!--
body {
	font-size: 12px;
	color: #000000;
}
a{
	font-size: 12px;
	color: #000000;
	text-decoration: none;
}
a:hover{
	font-size: 12px;
	color: #900000;
	text-decoration: underline;
}
-->
</style>
</head>

<body><form action="set6-1.asp" method="post">
<table width="670" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#900000">
  <tr>
    <td width="160" height="30" align="center" valign="middle">用户名</td>
    <td width="241" height="30" align="center" valign="middle">真实姓名</td>
    <td width="120" align="center" valign="middle">性别</td>
    <td width="482" align="center" valign="middle">址址</td>
    <td width="241" align="center" valign="middle">电话</td>
    <td width="241" align="center" valign="middle">信箱</td>
    <td width="120" height="30" align="center" valign="middle">删除</td>
  </tr><%
  dim pages,maxpages,counts,allcounts,i
  sql="select * from userinfo order by id desc"
  rs.open sql,conn,1,1
  
  pages=Trim(Request.QueryString("pages"))
  counts=20
  allcounts=rs.recordcount
  
  if(allcounts\counts)<(allcounts/counts) then
  	maxpages=int(allcounts\counts)+1
  else
  	maxpages=int(allcounts\counts)
  end if
  
  if(isnumeric(pages)) then
  	pages=int(pages)
	if(pages<1) then
		pages=1
	else
		if(pages>maxpages) then
			pages=maxpages
		end if
	end if
  else
  	pages=1
  end if
  
  if(not rs.eof) then
  	rs.move (pages-1)*counts
  end if
  
  for i=1 to counts
  if(not rs.eof) then
  %>
  <tr>
    <td height="20" align="center" valign="middle"><%=rs("username")%></td>
    <td height="20" align="center" valign="middle"><%=rs("realname")%></td>
    <td height="20" align="center" valign="middle"><%=rs("sex")%></td>
    <td height="20" align="center" valign="middle"><%=rs("addr")%></td>
    <td height="20" align="center" valign="middle"><%=rs("tel")%></td>
    <td height="20" align="center" valign="middle"><%=rs("email")%></td>
    <td height="20" align="center" valign="middle"><input name="id" type="checkbox" id="id" value="<%=rs("id")%>" /></td>
  </tr><%
  rs.movenext
  else
  exit for
  end if
  next
  rs.close
  %>
  <tr>
    <td height="40" colspan="7" align="center" valign="middle">第<%=pages%>页／共<%=maxpages%>页　　<a href="set6.asp?pages=1">首页</a>　<a href="set6.asp?pages=<%=pages-1%>">上一页</a>　<a href="set6.asp?pages=<%=pages+1%>">下一页</a>　<a href="set6.asp?pages=<%=maxpages%>">尾页</a></td>
  </tr>
  <tr>
    <td height="40" colspan="7" align="center" valign="middle"><a href="set6-1.asp">
      <input type="submit" name="Submit" value="    删除所选用户    " />
    </a></td>
  </tr>
</table></form>
</body>
</html>
