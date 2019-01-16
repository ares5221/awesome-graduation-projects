<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="include/style.css" rel="stylesheet" type="text/css" />
</head>
<body><%dim i%>
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td><!--#include file="top.asp"--></td>
  </tr>
  <tr>
    <td align="center" valign="top" background="images/t1.gif">
	<br><br>
	<table width="680" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="220" height="30" align="left" valign="top"><!--#include file="login.asp"--><!--#include file="left.asp"--></td>
        <td width="460" height="410" align="left" valign="top">
		<div class="title"><div class="text">购买商品</div></div><br /><br />
		<br /><br /><br /><br /><br /><center>
		<%
		dim dingdanid,id
		id=Trim(Request("id"))
		dingdanid=session("dingdanid")
		
		if(dingdanid="") then
			dingdanid="d"&replace(replace(replace(now()," ",""),"-",""),":","")
			session("dingdanid")=dingdanid
		end if
		
		if(isnumeric(id)) then
			if(session("UserLogin")="") then
				Response.Write("您没有登陆，请先登陆。")
			else
				sql="select * from dingdan where productid="&id&" and flags=0 and dingdanid='"&dingdanid&"'"
				rs.open sql,conn,1,3
				
				if(not rs.eof) then
					response.redirect "ddcx.asp"
					resposne.end
				else
					rs.addnew
					rs("name")=session("UserLogin")
					rs("productid")=id
					rs("productnum")=1
					rs("dingdanid")=dingdanid
					rs("jointime")=now()
					rs("flags")=0
					rs.update
					Response.Write("购买成功，物品已经加入订单。")
				end if
				rs.close
			end if
		end if
		%></center>
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
</body>
</html>

