
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../config.jsp"%>
<HTML>
<TITLE><%=webname%>----让天下的商人富起来!</TITLE>
<link href="../conn/laba.css" rel="stylesheet" type="text/css">
<BODY leftMargin=0 marginwidth="0"  topMargin=0 background=../images/c_cnco_bj.gif align=center>

<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../top.jsp topmargin=0 width=760 height=63 align=center></iframe>


<CENTER><BR>
<FORM name=Form1 action=forgetnext.jsp method=post>
<BR>
<TABLE cellSpacing=0 cellPadding=0 width=750 border=0>
  <TBODY>
  <TR>
    <TD class=M><IMG height=16 src="../images/icon_attion_16.gif" 
      width=16 align=absMiddle> <FONT 
      color=#ff7300>取回密码</FONT> </TD></TR></TBODY></TABLE>
<HR width=750 color=#ff7300 SIZE=3>
<BR><BR>
<TABLE cellSpacing=0 cellPadding=0 width=730 border=0>
  <TBODY>
  <TR>
    <TD><IMG height=23 src="images/joinin_bmember.gif" 
      width=105><BR><BR></TD></TR>
  <TR>
    <TD align=middle width="50%">
      <TABLE height=142 cellSpacing=0 cellPadding=0 width=352 border=0>
        <TBODY>
        <TR>
          <TD background=images/signin_back.gif>
            <TABLE cellSpacing=3 cellPadding=3 width="90%" align=center 
border=0>
              <TBODY>
              <TR>
                <TD colSpan=3>
                  <DIV class=S align=center>
                  <DIV align=left>请输入你注册时的帐号，按“下一步”继续操作。<br><br></DIV></DIV></TD></TR>
              <TR>
                <TD class=M width="35%">会员登录名： </TD>
                <TD width="35%"><INPUT tabIndex=1 maxLength=20 size=17 
                  name=user></TD>
                <TD class=S></TD></TR>
              

              <TR>
                <TD class=M>&nbsp;</TD>
                <TD><INPUT class=M tabIndex=3 value=" 下一步 " name=Submit  type="button" onclick="check()"></TD>
                <TD class=S>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
    </TR></TBODY></TABLE><BR><BR>





<script LANGUAGE="JavaScript">
function check()
{     

   if (document.Form1.user.value == "")        
  {        
    alert("请填写您的登录名！");        
    document.Form1.user.focus();        
    return (false);        
  } 


  
    document.Form1.submit()
}
</script>

<HR style="HEIGHT: 3px" color=#ff7300 width=750>

<%@ include file="../end.jsp"%>