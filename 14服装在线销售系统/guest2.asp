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
        <td width="460" height="410" align="left" valign="top"><div class="title">
          <div class="text">查看留言</div>
        </div><br /><br />
		<table width="100%" border="0" cellspacing="1" cellpadding="0">
		  <tr>
			<td width="315" height="30" align="center" valign="middle" bgcolor="#89613D">留言标题</td>
			<td height="30" align="center" valign="middle" bgcolor="#89613D">留言人</td>
		  </tr>
		<%
					dim pages,counts,allcounts,maxpages,i
					sql="select * from guest order by adddate desc"
					rs.open sql,conn,1,1
					
					pages=Trim(Request("pages"))
					counts=12
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
					<td height="25" align="left" valign="middle"><%
					if(rs("reply")<>"") then
						Response.Write("[已回复]")
					end if
					%><a href="javascript:seeliuyan('<%=rs("id")%>');"><%=rs("title")%></a></td>
					<td width="80" align="left" valign="middle"><%=rs("name")%></td>
			  </tr><%
				  rs.movenext
				  else
				  exit for
				  end if
				  next
				  rs.close
				  %>
				  <tr>
					<td height="30" colspan="2" align="center" valign="middle" bgcolor="#BFA691">
					<form action="guest2.asp" method="post" name="form1" style="display:inline">
						<a href="javascript:gotopages('1');">首页</a> <a href="javascript:gotopages('<%=pages-1%>');">上一页</a> <a href="javascript:gotopages('<%=pages+1%>');">下一页</a> <a href="javascript:gotopages('<%=maxpages%>');">尾页</a> 页次：<%=pages%>/<%=maxpages%>页 共有<%=allcounts%>条留言 转到：<input name="pages" type="text" value="<%=pages%>" style="width:20px;" id="pages" /> 
						<a href="javascript:form1.submit();">GO</a>
					</form></td>
			  </tr>
		</table>
		</td>
		</tr>
	</table>
	
	</td>
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
<script language="javascript">
function gotopages(num)
{
	document.getElementById("pages").value=num;
	form1.submit();
}
function seeliuyan(id)
{
	var url="seeliuyan.asp?id=";
	url=url+id;
	window.showModalDialog(url);
}
</script>
</body>
</html>

