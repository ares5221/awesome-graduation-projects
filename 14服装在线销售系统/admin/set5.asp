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

<body><form action="set5-1.asp" method="post">
<table width="670" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#900000">
  <tr>
    <td width="60" height="30" align="center" valign="middle">序号</td>
    <td width="482" height="30" align="center" valign="middle">订单内容</td>
    <td width="120" height="30" align="center" valign="middle">发货设置</td>
  </tr><%
  dim pages,maxpages,counts,allcounts,i
  sql="select * from dingdan order by jointime desc"
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
    <td height="20" align="left" valign="middle"> <%
	Response.Write("订单号："&rs("dingdanid")&"　")
	if(rs("flags2")=1) then
		Response.Write("[已交货]")
	end if
	sql="select * from products where id="&rs("productid")
	rs2.open sql,conn,1,1
	if(not rs.eof) then
		Response.Write(rs2("title"))
	end if
	rs2.close
	Response.Write("数量："&rs("productnum"))
	%></td>
    <td height="20" align="center" valign="middle"><input name="id" type="checkbox" value="<%=rs("id")%>"  <%if(rs("flags2")=1) then Response.Write("checked='checked'")%> /></td>
  </tr><%
  rs.movenext
  else
  exit for
  end if
  next
  rs.close
  %>
  <tr>
    <td height="40" colspan="3" align="center" valign="middle">第<%=pages%>页／共<%=maxpages%>页　　<a href="set5.asp?pages=1">首页</a>　<a href="set5.asp?pages=<%=pages-1%>">上一页</a>　<a href="set5.asp?pages=<%=pages+1%>">下一页</a>　<a href="set5.asp?pages=<%=maxpages%>">尾页</a></td>
  </tr>
  <tr>
    <td height="40" colspan="3" align="center" valign="middle"><input type="submit" name="Submit" value="设置选中项为已发货" /><a href="set5-1.asp">
    </a></td>
  </tr></form><form action="set5-2.asp" method="post">
  <tr>
    <td height="40" colspan="3" align="center" valign="middle">起始时间
      <input name="start" type="text" id="start" value="2000-1-1" />　
      结束时间:
      <input name="end" type="text" id="end" value="<%=date()%>" />
      <input type="submit" name="Submit2" value="提交" /></td>
  </tr></form>
</table>

</body>
</html>
