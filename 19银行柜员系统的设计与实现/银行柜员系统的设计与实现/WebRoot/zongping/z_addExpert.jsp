<%@ page language="java" contentType="text/html;charset=GB2312"%>

<%
    String getLoginmessage=(String)session.getValue("z_loginSign");
    if(getLoginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }	
%>
<HTML>
<HEAD>
<TITLE>修改密码</TITLE>
<script language=JavaScript>
function check(form){
    if (form1.expert_name.value=="")
    { 
       alert("请输入专家姓名！");
       form1.expert_name.focus();
       return false; 
     }
    if (form1.identityID.value=="")
    { 
       alert("请输入身份证号！");
       form1.identityID.focus();
       return false; 
     }
    if (form1.password.value=="")
    { 
       alert("请输入密码！");
       form1.password.focus();
       return false; 
     }
	 if (form1.password2.value=="")
    {
      alert("请输入确认密码！");
      form1.password2.focus();
      return false;
     }
	 if(form1.password.value!=form1.password2.value)
	 {
	   alert("密码与确认密码不一致！");
	   return false;
	 }
     return true;
}
</Script>
</HEAD>
<BODY>
<form name=form1 method=post action="z_checkExpert.jsp" onsubmit="return check(this)">
  <table width="270" border="0" cellspacing="0" cellpadding="1" bgcolor="#4f71b8" align="center">
    <tr> 
      <td>
        <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF" align="center">
          <tr> 
            <td bgcolor="#4f71b8" align="center" colspan="2" height="30"><font color="#FFFFFF">添加专家</font></td>
          </tr>
          <tr> 
            <td bgcolor="#CCCCCC">&nbsp;</td>
            <td bgcolor="#CCCCCC">&nbsp;</td>
          </tr>
          <tr> 
            <td align="center" width="50%" bgcolor="#D8D8D8"><font color="#000099">专家姓名</font></td>
            <td align="center" width="50%"> 
              <input name=expert_name 
                  size=16 type=text>
            </td>
          </tr>
          <tr> 
            <td align="center" width="50%" bgcolor="#D8D8D8"><font color="#000099">身份证号</font></td>
            <td align="center" width="50%"> 
              <input name=identityID 
                  size=16 type=text>
            </td>
          </tr>
          <tr> 
            <td align="center" bgcolor="#d8d8d8"><font color="#000099">密&nbsp;&nbsp;&nbsp;&nbsp;码</font></td>
            <td align="center"> 
              <input name=password 
                  size=16 type=password>
            </td>
          </tr>
          <tr> 
            <td align="center" bgcolor="#d8d8d8"><font color="#000099">确认密码</font></td>
            <td align="center"> 
              <input name=password2 
                  size=16 type=password>
            </td>
          </tr>
          <tr> 
            <td height="5" colspan="2"></td>
          </tr>
          <tr align="center"> 
            <td colspan="2"> 
              <input type=image src="../images/refer.gif" width="62" height="22">
            </td>
          </tr>
          <tr> 
            <td height="2" colspan="2"></td>
          </tr>
        </table>
      </td>
  </tr>
</table>
  <table width="270" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td width="270" align="center" height="20"><div align="center"><font color="#ff0000">                            
                        </font></div></td>
    </tr>
  </table>
</form>
</BODY>
</HTML>