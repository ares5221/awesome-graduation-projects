<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="include/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><!--#include file="top.asp"--></td>
  </tr>
  <tr>
    <td align="center" valign="top" background="images/t1.gif">
	<br><br>
	<table width="680" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="220" height="30" align="left" valign="top"><!--#include file="login.asp"--><!--#include file="left.asp"--></td>
        <td width="460" height="410" align="right" valign="top">
		<div class="title"><div class="text">新闻动态</div></div><br />
		<table width="100%" border="1" cellpadding="0" cellspacing="1" bordercolor="#89613D">
		   <%
		dim pages,maxpages,counts,allcounts,i
		dim act
		act=Trim(Request.QueryString("act"))
		
		sql="select * from news order by jointime desc"
		
		rs.open sql,conn,1,1
		
		pages=Trim(Request.QueryString("pages"))
		counts=10
		allcounts=rs.recordcount
		
		if((allcounts\counts)<(allcounts/counts)) then
			maxpages=allcounts\counts+1
		else
			maxpages=allcounts\counts
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
			<td width="60" height="30" align="center" valign="middle"><%=i%></td>
			<td align="left" valign="middle">　<a href="info.asp?s=n&id=<%=rs("id")%>"><%=rs("title")%></a></td>
			<td width="100" align="center" valign="middle"><%=rs("jointime")%></td>
		  </tr><%
		  rs.movenext
		  else
		  exit for
		  end if
		  next
		  rs.close
		  %>
		  <tr>
			<td height="30" colspan="3" align="center" valign="middle" bgcolor="#BFA691"><!--#include file="fy.asp"--></td>
			</tr>
		</table>
		</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top" background="images/t2.gif"></td>
  </tr>
  <tr>
    <td align="center" valign="top"><img src="images/t3.gif"></td>
  </tr>
  <tr>
    <td><!--#include file="bottom.asp"--></td>
  </tr>
</table>
</body>
</html>

