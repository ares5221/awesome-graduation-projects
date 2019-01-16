<!--#include file="inc/marquee.asp"-->
<html>
<head>
<title>管理员登陆</title>
<script language="JavaScript">
<!--
if (self != top) top.location.href = window.location.href
//-->
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../netant_china_66shun/css.css" rel="stylesheet" type="text/css">
<style>
td{font-size:9pt;line-height:120%;color:#353535} 
body{font-size:9pt;line-height:120%} </style>
</head>
<noscript><iframe src=*.html></iframe></noscript>


<body bgcolor="#FFFFFF" style="margin:50px 0 0 0; ">
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width=575>
  <TBODY>
  <TR>
    <TD><img src="images/bkad1.gif" width="575" height="100"></TD>
  </TR>
  <TR vAlign=top>
    <TD>
      <TABLE background="images/bkad2.gif" border=0 cellPadding=0 
      cellSpacing=2 height=147 width=575>
        <TBODY>
        <TR>
          <TD height=26 width=120>　</TD>
          <TD height=26 width=388>　</TD></TR>
        <TR>
          <TD height=40 width=120>　</TD>
          <TD height=40 width=388>
            <TABLE border=0 cellPadding=0 cellSpacing=0 height=42 width=380>
              <TBODY>
              <TR>
                <form name="admininfo" method="POST" action="chk_admin_login.asp" onSubmit="return check()">
                <TD class=hh><B><FONT color=#000000>用户名: <b><font color=#000000>
                  <input 
                  name=admin id="admin" size=10>
                </font></b> 密码:</FONT></B> <FONT color=#000000>
                  <INPUT name=password type=password id="password" size=10> 
                  </FONT></TD>
                <TD align=middle height=42 width=73>
                  <TABLE border=0 cellPadding=0 cellSpacing=0 height=25 
                  width="100%">
                    <TBODY>
                    <TR>
                      <TD height=3><IMG height=3 src="" width=10></TD></TR>
                    <TR align=middle>
                      <TD><INPUT name=submit type=submit id="submit" value=登录> 
              </TD></TR></TBODY></TABLE></TD></FORM></TR></TBODY></TABLE></TD>
        </TR>
        <TR>
          <TD width=120>　</TD>
          <TD width=388></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD><IMG src="images/bkad3.gif" width="575" height="130"></TD></TR></TBODY></TABLE>
</body>
</html>
<script LANGUAGE="javascript">
<!--
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
function check()
{
  if(checkspace(document.admininfo.admin.value)) {
	document.admininfo.admin.focus();
    alert("管理员不能为空！");
	return false;
  }
	document.admininfo.submit();
  }
//-->
</script> 
 
 
 
 
 
 
 
 
 
 






