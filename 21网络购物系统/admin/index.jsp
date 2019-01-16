<%@ page contentType="text/html;charset=GBK" language="java" errorPage="" %>
<html>
<style type=text/css>
body  { background:#799AE1; margin:0px; font:9pt 宋体; }
table  { border:0px; }
td  { font:normal 12px 宋体; }
img  { vertical-align:bottom; border:0px; }
a  { font:normal 12px 宋体; color:#000000; text-decoration:none; }
a:hover  { color:#428EFF;text-decoration:underline; }
.sec_menu  { border-left:1px solid white; border-right:1px solid white; border-bottom:1px solid white; overflow:hidden; background:#D6DFF7; }
.menu_title  { }
.menu_title span  { position:relative; top:2px; left:8px; color:#215DC6; font-weight:bold; }
.menu_title2  { }
.menu_title2 span  { position:relative; top:2px; left:8px; color:#428EFF; font-weight:bold; }
</style>
<head>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>后台管理</title>

</head>

<body bgcolor="#F0F0E8" link="#FFFFFF" style="background-color: #989DA5">
<p align="center" style="line-height: 200%; margin-top: 50px">
	<font color="#FFFFFF" size="4" face="华文行楷, Bookman Old Style">管理员登陆<br>
	</font>
  <font color="#FFFFFF">（他人请勿非法尝试，否则后果自负！）</font></p>
<table border="0" width="254" cellspacing="1" height="6" align="center">
  <tr>
    <td width="100%" height="1">
    
      </td>
  </tr>
  
  <tr>
    <td width="100%" height="57">
      <form method="POST" action="2login.jsp?action=login">
        <table border="0" width="100%" cellspacing="1">
          <tr>
            <td width="26%"> 
              <div align="right"><font color="#FFFFFF">用户名</font>:</div>
            </td>
            <td width="74%"> 
              <input type="text" name="admin_name" size="20" class=input></td>
          </tr>
          <tr>
            <td width="26%"> 
              <div align="right"><font color="#FFFFFF">密码</font>:</div>
            </td>
            <td width="74%"> 
              <input type="password" name="admin_pass" size="20" class=input></td>
          </tr>
        </table>
        <div align="center">
          <input type="submit" value="提交" name="B1" class=input>
          <input type="reset" value="全部重写" name="B2" class=input>
        </div>
      </form>
    </td>
  </tr>
  <tr>
    <td width="100%" height="1"></td>
  </tr>
</table>