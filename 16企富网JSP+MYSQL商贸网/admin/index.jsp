<%if ((String) session.getAttribute("finaler")=="yes"){%>
<script language=JavaScript>{window.location.href='finaler.jsp'}</script>
<%}%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>超级管理登录</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="images/style.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1476" name=GENERATOR></HEAD>
<BODY bgColor=#799ae1 leftMargin=0 topMargin=0 marginwidth="0" 
marginheight="0"><BR><BR><BR>
<FORM action=check.jsp method=post>
<TABLE cellSpacing=0 cellPadding=0 width=413 align=center bgColor=#eeead6 
border=0>
  <TBODY>
  <TR>
    <TD background=images/topbg.gif colSpan=3 height=29>
      <TABLE cellSpacing=0 cellPadding=0 width="95%" align=right border=0>
        <TBODY>
        <TR>
          <TD vAlign=center align=left><FONT color=#ffffff><B>请不要非法登录</B></FONT></TD>
          <TD align=right width="8%"></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD width=3 background=images/link.gif></TD>
    <TD>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD background=images/bgtop.gif height=75>
            <TABLE height=75 cellSpacing=0 cellPadding=0 width="100%" 
              border=0><TBODY>
              <TR>
                <TD vAlign=bottom align=left width="30%"><FONT 
                  color=#ffffff><IMG src="images/xpbg.gif" 
                width=409></FONT></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD>
            <TABLE width="95%" align=center border=0>
              <TBODY>
              <TR>
                <TD>
                  <FIELDSET><LEGEND accessKey=F align=left>登陆窗口</LEGEND>
                  <TABLE cellSpacing=2 cellPadding=2 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD width="10%">&nbsp;</TD>
                      <TD width="20%">用&nbsp;户&nbsp;名：</TD>
                      <TD><INPUT name=finalername></TD></TR>
                    <TR>
                      <TD width="10%">&nbsp;</TD>
                      <TD width="20%">密&nbsp;&nbsp;&nbsp;&nbsp;码：</TD>
                      <TD><INPUT type=password name=finalerpass> </TD></TR>
               
                    <TR>
                      <TD align=middle colSpan=3><INPUT class=tbutton type=submit value=" 登 陆 " name=submit></TD></TR></TBODY></TABLE></FIELDSET> 
                  &nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
    <TD width=3 background=images/link.gif></TD></TR>
  <TR>
    <TD background=images/linkbom.gif colSpan=3 
height=3></TD></TR></TBODY></TABLE><INPUT type=hidden value=CheckLogin 
name=method> </FORM></BODY></HTML>
