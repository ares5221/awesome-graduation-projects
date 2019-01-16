<!--#include file="inc/conn.asp"-->
<%

Call QuanXian(Register_B)
UserID=Request("ID")
IF UserID=Empty Then 
	TwScript("对不起，参数有误")
End IF
Set Rs=Conn.execute("select * from [Net_Order] where ID="&UserID&"")
IF Rs.Eof Then
	TwScript("对不起，没有此订单")
End IF

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.b_t {padding-left:10px;padding-right:10px;}
.style1 {color: #FF0000}
-->
</style>
</head>

<body>
<form name="form1" method="post" action="User_Sava.asp?action=Modify" onSubmit="return useradd(this)">
  <table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="table_border">
    <tr bgcolor="#DBE6FF">
      <td colspan="2" class="padding_1"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bg">
          <tr>
            <td align="center" class="table_bg_size"> 在线订单 </td>
          </tr>
      </table></td>
    </tr>
    <tr bgcolor="#DBE6FF">
      <td colspan="2"><table width=100% border=0 align="center" cellpadding=0 cellspacing=1 bgcolor="#FFFFFF" style="border-collapse: collapse">
            <tr>
              <td width="106" height="25" align="right" bgcolor="#DBE6FF"><div align="right"><font 
                size="2">预约人：</font></div></td>
              <td width="509" height="25" bgcolor="#DBE6FF"><font size="2"><%= Rs("order1") %><font 
                  size="2">(中文名) </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
              QQ：<%= Rs("order2") %></font></td>
            </tr>
            <tr>
              <td width="106" height="25" align="right" bgcolor="#DBE6FF"><div align="right"><font size="2">性别：</font></div>
              <div align="right"></div></td>
              <td width="509" height="25" bgcolor="#DBE6FF"><font size="2"><%= Rs("order3") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年龄：<%= Rs("order4") %></font> </td>
            </tr>
            <tr>
              <td width="106" height="25" align="right" bgcolor="#DBE6FF"><div align="right"><font 
size="2">星座：</font></div></td>
              <td width="509" height="25" bgcolor="#DBE6FF"><font size="2"><%= Rs("order5") %></font></td>
            </tr>
            <tr>
              <td width="106" height="25" align="right" bgcolor="#DBE6FF"><div align="right"><font 
                size="2">固定电话：</font></div></td>
              <td width="509" height="25" bgcolor="#DBE6FF"><font size="2">
                <%= Rs("order6") %>              (住宅)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= Rs("order7") %>
              (单位电话)
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= Rs("order8") %>              (手机) </font></td>
            </tr>
            <tr>
              <td width="106" height="25" align="right" bgcolor="#DBE6FF"><div align="right"><font 
                  size="2">E-mail：</font></div></td>
              <td width="509" height="25" bgcolor="#DBE6FF"><font size="2"><%= Rs("order9") %></font></td>
            </tr>
            <tr>
              <td width="106" height="25" align="right" bgcolor="#DBE6FF"><div align="right"><font 
                size="2">拍摄套系：</font></div></td>
              <td width="509" height="25" bgcolor="#DBE6FF"><font size="2"><%= Rs("order10") %></font></td>
            </tr>
            <tr>
              <td width="106" height="25" align="right" bgcolor="#DBE6FF"><div align="right"><font 
                  size="2">预计拍摄日期：</font></div></td>
              <td width="509" height="25" bgcolor="#DBE6FF"><font size="2">
                                               <%= Rs("order11") %></font></td>
            </tr>
            <tr>
              <td width="106" height="25" align="right" bgcolor="#DBE6FF"><div align="right"><font 
                  size="2">预计拍摄时间：</font></div></td>
              <td width="509" height="25" bgcolor="#DBE6FF"><font size="2"><%= Rs("order12") %></font></td>
            </tr>
            <tr>
              <td width="106" height="91" bgcolor="#DBE6FF"><p align="right"><font size="2">特别说明：</font></p>
                  <p align="right"><font 
                size="2"><br />
              </font></p></td>
              <td width="509" height="91" valign="top" bgcolor="#DBE6FF"><font size="2"><%= Rs("order13") %></font></td>
            </tr>
          <TR class="table_bg_n" ><input type="Hidden" name="ID" value="<%Tw(Rs("ID"))%>">
            <TD height="25" colspan="2" align="center">
            <input type="reset" name="Submit" value="返回" onclick='javascript:window.location.href("Gorder.asp")'></TD>
          </TR>
      </TABLE></td>
    </tr>
  </table>
</form>
</body>
</html>
