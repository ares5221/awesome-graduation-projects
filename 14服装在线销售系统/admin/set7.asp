<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script language="JavaScript" type="text/javascript" src="auto.js"></script>
<style type="text/css">
body{
	font-size: 12px;
	color: #000000;
}
</style>
</head>

<body>
<table width="670" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#900000">
  <tr>
    <td width="60" height="30" align="center" valign="middle">序号</td>
    <td height="30" align="center" valign="middle">标题</td>
    <td width="120" height="30" align="center" valign="middle">日期</td>
    <td width="120" align="center" valign="middle">&nbsp;</td>
  </tr><%
  dim pages,maxpages,counts,allcounts,i
  sql="select * from guest order by adddate desc"
  rs.open sql,conn,1,1
  
  pages=Trim(Request.QueryString("pages"))
  counts=25
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
    <td height="20" align="center" valign="middle"><%=i%></td>
    <td height="20" align="left" valign="middle"><%
	if(rs("reply")<>"") then
		Response.Write("[已回复]")
	end if
	%><a href="set7-1.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
    <td height="20" align="center" valign="middle"><%=rs("adddate")%></td>
    <td align="center" valign="middle"><a href="set7-2.asp?id=<%=rs("id")%>">删除</a></td>
  </tr><%
  rs.movenext
  else
  exit for
  end if
  next
  rs.close
  %>
  <tr>
    <td height="40" colspan="4" align="center" valign="middle">第<%=pages%>页／共<%=maxpages%>页　　<a href="set7.asp?pages=1">首页</a>　<a href="set7.asp?pages=<%=pages-1%>">上一页</a>　<a href="set7.asp?pages=<%=pages+1%>">下一页</a>　<a href="set7.asp?pages=<%=maxpages%>">尾页</a></td>
  </tr>
</table>
</body>
</html>
