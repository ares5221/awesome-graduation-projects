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
        <td width="460" height="410" align="left" valign="top" style="border:#89613D solid 0px;border-bottom:0px;">
		<div class="title">
		  <div class="text">服装商城</div>
		</div>
		<%
		dim pages,counts,allcounts,maxpages,i
		dim j,names,jiage,pic,id,title
		dim class1
		class1=Trim(Request("class1"))
		title=Trim(Request("title"))
		pages=Trim(Request.form("pages"))
		sql="select * from products where 1=1"
		if(title<>"") then
			sql=sql&" and title like '%"&title&"%'"
		end if
		if(class1<>"") then
			sql=sql&" and class1='"&class1&"' order by jointime desc"
		else
			sql=sql&" order by jointime desc"
		end if

		rs.open sql,conn,1,1
		if(class1<>"") then
		counts=16
		else
		counts=20
		end if
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

		for i=1 to 6
			if(not rs.eof) then
					names=rs("title")
					jiage=rs("cpjg")
					id=rs("id")
					pic="<img src='"&rs("pic")&"' width='110' heihgt='83'>"
				%>
				<table width="195" border="0" cellspacing="0" cellpadding="0" class="items">
				  <tr>
				    <td height="5" align="center" valign="middle">&nbsp;</td>
			      </tr>
				  <tr>
					<td height="20" align="center" valign="middle"><%=pic%></td>
				  </tr>
				  <tr>
					<td height="40" align="center" valign="middle"><a href="pinfo.asp?id=<%=id%>"><%=names%></a></td>
				  </tr>
				  <tr>
					<td height="20" align="center" valign="middle">价格:<%=jiage%>元</td>
				  </tr>
				  <tr>
					<td height="5" align="center" valign="middle"><a href="goumai.asp?id=<%=id%>">购买</a></td>
				  </tr>
				</table>
				<%
				rs.movenext
			else
				exit for
			end if
		next

		if(i<4) then
		%><div style="height:30px;text-align:center;line-height:30px;background-color:#BFA691;width:460px;overflow:hidden">
		<form action="product.asp" method="post" name="form1" id="form1"><%=pages%>/<%=maxpages%>　　<a href="javascript:selectpages('1');">首页</a>　<a href="javascript:selectpages('<%=pages-1%>');">上一页</a>　<a href="javascript:selectpages('<%=pages+1%>');">下一页</a>　<a href="javascript:selectpages('<%=maxpages%>');">尾页</a>　
		    <input name="class1" type="hidden" value="<%=class1%>" />
			<input name="pages" type="text" id="pages" value="<%=pages%>" size="4" maxlength="4" />
			<input name="title" type="hidden" value="<%=title%>" />
		    <input name="" type="submit" value="提交" />
		</form></div><%
		end if
		%>
		</td>
		</tr>
	</table>
	</td>
  </tr>
  <tr>
    <td align="center" valign="top" background="images/t2.gif">
	<table width="680" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td width="220" align="left" valign="top" class="login"><iframe width="220" height="300" frameborder="0" scrolling="no" src=""></iframe></td>
		<td width="460" align="left" valign="top" style="border:#89613D solid 0px;border-top:0px;">
		<%		
		for i=i-1 to counts
			if(not rs.eof) then
					names=rs("title")
					jiage=rs("cpjg")
					id=rs("id")
					pic="<img src='"&rs("pic")&"' width='110' heihgt='83'>"
				%>
				<table width="195" border="0" cellspacing="0" cellpadding="0" class="items">
				  <tr>
				    <td height="5" align="center" valign="middle">&nbsp;</td>
			      </tr>
				  <tr>
					<td height="20" align="center" valign="middle"><%=pic%></td>
				  </tr>
				  <tr>
					<td height="40" align="center" valign="middle"><a href="pinfo.asp?id=<%=id%>"><%=names%></a></td>
				  </tr>
				  <tr>
					<td height="20" align="center" valign="middle">价格:<%=jiage%>元</td>
				  </tr>
				  <tr>
					<td height="5" align="center" valign="middle"><a href="goumai.asp?id=<%=id%>">购买</a></td>
				  </tr>
				</table>
				<%
				rs.movenext
			else
				exit for
			end if
		next
		rs.close
		if(i>=4) then
		%><div style="height:30px;text-align:center;line-height:30px;background-color:#BFA691;width:460px;overflow:hidden">
		<form action="product.asp" method="post" name="form1" id="form1"><%=pages%>/<%=maxpages%>　　<a href="javascript:selectpages('1');">首页</a>　<a href="javascript:selectpages('<%=pages-1%>');">上一页</a>　<a href="javascript:selectpages('<%=pages+1%>');">下一页</a>　<a href="javascript:selectpages('<%=maxpages%>');">尾页</a>　
		    <input name="class1" type="hidden" value="<%=class1%>" />
			<input name="pages" type="text" id="pages" value="<%=pages%>" size="4" maxlength="4" />
			<input name="title" type="hidden" value="<%=title%>" />
		    <input name="" type="submit" value="提交" />
		</form></div><%
		end if
		%>
		
		</td>
	  </tr>
	</table>

	</td>
  </tr>
  <tr>
    <td align="center" valign="top"><img src="images/t3.gif"></td>
  </tr>
  <tr>
    <td><!--#include file="bottom.asp"--></td>
  </tr>
</table>
<script language="javascript">
function selectpages(num)
{
	if(num!="0")
	{
		document.getElementById("pages").value=num;
		form1.submit();
	}
}
</script>
</body>
</html>
