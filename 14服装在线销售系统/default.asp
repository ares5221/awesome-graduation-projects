<!--#include file="conn.asp"-->
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
        <td width="460" height="410" align="right" valign="top"><table width="460" border="00" cellspacing="0" cellpadding="0">
          <tr>
            <td width="230" align="left" valign="top"><%
			  dim pic,texts,links
			  pic=""
			  texts=""
			  links=""
			  sql="select top 4 * from products order by rnd(id)"
			  rs.open sql,conn,1,1
			  while not rs.eof
				pic=pic&rs("pic")&"|"
				texts=texts&rs("title")&"|"
				links=links&""&"|"
				rs.movenext
			  wend
			  rs.close
			  pic=left(pic,len(pic)-1)
			  texts=left(texts,len(texts)-1)
			  links=left(links,len(links)-1)
			  %>
            <script type="text/javascript">
			//<![CDATA[
			var interval_time=0; //图片停顿时间，单位为秒，为0则停止自动切换
			var focus_width=290;
			var focus_height=220;
			var text_height=20;
			var text_align="center" //标题文字对齐方式(left、center、right)
			var swf_height=focus_height+text_height; //相加之和最好是偶数,否则数字会出现模糊失真的问题
			var pics="<%=pic%>";
			var links="<%=links%>";
			var texts="<%=texts%>";
			document.write('<div style=\'width:'+focus_width+'px;height:'+(focus_height+text_height)+'px;overflow:hidden;\'><object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
			document.write('<param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="images/focus.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#F0F0F0">');
			document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
			document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
			document.write('<embed src="images/focus.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#F0F0F0" quality="high" width="'+ focus_width +'" height="'+ focus_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
			document.write('</object></div>');
			//]]>
			</script></td>
            <td width="230" align="left" valign="top" style="line-height:25px;"><a href="about.asp"><%
			sql="select * from aboutus"
			rs.open sql,conn,1,1
			if(not rs.eof) then
				Response.Write(left(replace(rs("contents"),vbcrlf,"<br>"),130))
			end if
			rs.close
			%></a></td>
          </tr>
        </table>
		<div class="title"><div class="text">新闻动态</div></div>
		<table width="450" border="0" cellspacing="0" cellpadding="0">
		  <%
		dim i
		sql="select top 10 * from news order by jointime desc"
		rs.open sql,conn,1,1
		
		for i=1 to 6
		if(not rs.eof) then
		%>
		  <tr>
			<td width="100" height="25" align="center" valign="middle" style="border-bottom: 1px solid #89613D;"><%=i%></td>
			<td align="left" valign="middle" style="border-bottom: 1px solid #89613D;">　<a href='info.asp?id=<%=rs("id")%>'><%=left(rs("title"),19)%></a></td>
			<td width="100" align="center" valign="middle" style="border-bottom: 1px solid #89613D;"><%=rs("seenum")%></td>
		  </tr><%
		  rs.movenext
		  else
		  	exit for
		  end if
		 next
		 rs.close
		  %>
		</table>
		</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top" background="images/t2.gif">
	<table width="680" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td><div class="title"><div class="text">服装商城</div></div><br></td>
	  </tr>
	  <tr>
		<td><%
		sql="select top 12 * from products order by jointime desc"
		rs.open sql,conn,1,1
		while not rs.eof
			Response.Write("<a href='pinfo.asp?id="&rs("id")&"' title='"&rs("title")&"'>")
			Response.Write("<img src='"&rs("pic")&"' width='100' height='100' border='0' >")
			Response.Write("</a>　")
			rs.movenext
		wend
		rs.close
		%></td>
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
</body>
</html>
