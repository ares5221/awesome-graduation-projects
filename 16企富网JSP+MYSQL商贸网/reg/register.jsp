<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>

<%@ include file="../conn/time.jsp"%>

<SCRIPT language=JavaScript>
//校验user的弹出窗口
function check_id_window(value){	window.open("check_id.jsp?user="+value,"",'toolbar=no,directories=no,scrollbars=0,resizable=1,status=no,menubar=0,width=250,height=100');
}
</SCRIPT>


<script LANGUAGE="JavaScript">
function check()
{

       if (document.Form1.user.value == "")
        {
        alert("请填写您的用户名！");
		document.Form1.user.focus();
        return (false);
        }

        var filter=/^\s*[.A-Za-z0-9_-]{5,15}\s*$/;
        if (!filter.test(document.Form1.user.value)) { 
                alert("用户名填写不正确,请重新填写！可使用的字符为（A-Z a-z 0-9 _ - .)长度不小于5个字符，不超过15个字符，注意不要使用空格。"); 
                document.Form1.user.focus();
                document.Form1.user.select();
                return (false); 
                } 
        
         if (document.Form1.pass.value =="") 
         {
         alert("请填写您的密码！");
         document.Form1.pass.focus();
         return (false); 
         }
		
		if(document.Form1.confirmPassword.value==""){
		alert("请输入您的确认密码！");
		document.Form1.confirmPassword.focus();
		return (false);
		}
		
        var filter=/^\s*[.A-Za-z0-9_-]{5,15}\s*$/;
        if (!filter.test(document.Form1.pass.value)) { 
                alert("密码填写不正确,请重新填写！可使用的字符为（A-Z a-z 0-9 _ - .)长度不小于5个字符，不超过15个字符，注意不要使用空格。"); 
                document.Form1.pass.focus();
                document.Form1.pass.select();
                return (false); 
                } 
               
		if (document.Form1.pass.value!=document.Form1.confirmPassword.value ){
		        alert("两次填写的密码不一致，请重新填写！"); 
                document.Form1.pass.focus();
                document.Form1.pass.select();
                return (false); 
                } 
                
 if (document.Form1.question.value == "")        
  {        
    alert("请输入密码提示问题！");        
    document.Form1.question.focus();        
    return (false);        
  }        
 if (document.Form1.answer.value == "")        
  {        
    alert("请输入密码提示答案！");        
    document.Form1.answer.focus();        
    return (false);        
  }        
                

 if (document.Form1.name.value == "")        
  {        
    alert("请输入您的姓名！");        
    document.Form1.name.focus();        
    return (false);        
  }        

   if (document.Form1.myname.value == "")        
  {        
    alert("请填写您的名称！");        
    document.Form1.myname.focus();        
    return (false);        
  } 

 
 if (document.Form1.address.value == "")        
  {        
    alert("请输入您的联系地址！");        
    document.Form1.address.focus();        
    return (false);        
  } 

 if (document.Form1.post.value == "")        
  {        
    alert("请输入邮政编码！");        
    document.Form1.post.focus();        
    return (false);        
  }        

 if (document.Form1.tel.value == "")        
  {        
    alert("请输入您的联系电话！");        
    document.Form1.tel.focus();        
    return (false);        
  }         
  
   if (document.Form1.email.value == "")
        {
        alert("请输入您的电子邮件地址！");
		document.Form1.email.focus();
		document.Form1.email.select();
        return (false);
        }

        var filter=/^\s*([A-Za-z0-9_-]+(\.\w+)*@(\w+\.)+\w{2,3})\s*$/;
        if (!filter.test(document.Form1.email.value)) { 
                alert("邮件地址不正确,请重新填写！"); 
                document.Form1.email.focus();
                document.Form1.email.select();
                return (false); 
                }      
 
  if (document.Form1.qymc.value == "")        
  {        
    alert("请输入您公司的名称！");        
    document.Form1.qymc.focus();        
    return (false);        
  }  
          
 if (document.Form1.qyjj.value == "")
  {        
    alert("请输入公司简介！");        
    document.Form1.qyjj.focus();        
    return (false);        
  } 
  
  
  
    document.Form1.submit()
}
</script>
<SCRIPT language=javascript>
  function PopupCatSel()
  {
   var selProdWnd=window.open("select_sort.jsp","new","resizable=yes,width=580,height=320,top=0,scrollbars=yes");
   if(selProdWnd.opener== null) 
   selProdWnd.opener = self;
   return (false);
  }
</SCRIPT>

<head>
</head>
<BODY text=#000000 leftMargin=0 topMargin=0 
marginheight="0" marginwidth="0">
<center>










<TABLE cellSpacing=0 cellPadding=0 width="750" align=center border=0 height=20>
        <TBODY>
        <TR>
          <TD><embed src="../images/icstock.swf" quality=high 
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
type="application/x-shockwave-flash" width=750  height=80></embed></TD></TR>
</TBODY></TABLE>


















<TABLE cellSpacing=0 cellPadding=0 width=750 border=0 style="border-collapse: collapse" bordercolor="#111111">
  <TBODY>
  <TR>
 

    <TD width=774>
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1">
      <tr>
        <td width="100%">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%" id="AutoNumber2" bgcolor="#FFFFFF">
          <tr>
            <td width="100%" style="color: #000; font-family: 宋体; font-size: 12px">
<CENTER>
<table border="0" style="border-collapse: collapse" bordercolor="#111111" width="750" id="AutoNumber3" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%">
       <center>
  <FORM method="POST" action="Registerok.jsp" name="Form1" >     



<INPUT type=hidden  name=dlid size="20" value="<%=(String) session.getAttribute("Did")%>">





<div align="center">
  <center>     
<TABLE  border=0 cellPadding=0 cellSpacing=0 width="64" style="border-collapse: collapse" bordercolor="#111111">
  <TBODY>
  <TR vAlign=top>
     <TD width="779" height="443">
       <center>
      <TABLE border=0  width="750" bordercolor="#3399FF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" style="border-collapse: collapse" cellspacing="1" cellpadding="0" height="672">
        <TBODY>
                     <tr><TD align=left height="24" colspan="2" width="382">
                       <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="72%" id="AutoNumber4" background="../IMAGES/newmiddle-bg7.gif" height="24">
                         <tr>
                           <td width="100%" height="24" background="newmiddle-bg6.gif">
                           <FONT color=#000000>
                           &nbsp;<IMG 
                  src="../images/bul_arrowGrnSm.gif"></FONT><font class=f12 style="font-size: 10.5pt"><b> 
                           填写个人资料</b></font></td>
                         </tr>
                       </table>
                       </TD>
        </CENTER> 
<TD align=left height="24" colspan="2" width="347">
  <p align="center"><FONT class=text9><B>带</B></FONT> 
            <FONT color=red face="verdana, arial" size=1><B>*</B></FONT> <FONT 
            class=text9><B>的项目是必须填写的</B></FONT></TD>
</tr> 
<CENTER>

        <TR valign="middle">
          <TD align=right width="745" height="12" bgcolor="#ff8a02" colspan="4">
              <p align="right"><font color="#FFffff">注：会员不能重复注册帐号，否则管理员有权删除您的资料&nbsp;&nbsp;&nbsp;&nbsp; 
              </font></TD>
          </TR> 
        <tr>
          <TD align=right width="115" height="26" bgcolor="#ff8a02">会员登录名：</TD>
          <TD height="26" width="630" colspan="3" bgcolor="#f7fce9">&nbsp;<INPUT class=fongt9a 
                  maxLength=15 size=20 name=user> <FONT color=#990000             
            size=2>*</FONT><font color="#666666">&nbsp;</font><INPUT class=buttons onclick=check_id_window(document.Form1.user.value) type=button value="检测帐号" name=Check_ID><font color="#666666"> 5-20个字符（<font face="Arial">A-Z</font>，            
            <font face="Arial"> a-z</font>， <font face="Arial">            
            0-9</font>）。</font></TD>
</tr>
        <TR vAlign="middle"> 
          <TD align=right height="19" width="115" bgcolor="#ff8a02">密 码：</TD>    
          <TD height="19" width="630" colspan="3" bgcolor="#f7fce9">&nbsp;<INPUT class=f11 maxLength=20 name=pass type=password size="20"> <FONT             
            color=#990000 size=2>*</FONT><font color="#666666"> 5-20个字符（<font face="Arial">A-Z</font>，<font face="Arial">a-z</font>，<font face="Arial">0-9</font>，下划线），密码区分大小写。</font></TD></TR> 
        <TR vAlign="middle"> 
          <TD align=right height="27" width="115" bgcolor="#ff8a02">确认密码：</TD> 
          <TD height="27" width="630" colspan="3" bgcolor="#f7fce9">&nbsp;<INPUT class=f11 maxLength=20 name=confirmPassword type=password size="20">   
            <FONT color=#990000 size=2>*</FONT></TD>           
        <TR vAlign="middle"> 
          <TD align=right height="48" width="115" bgcolor="#ff8a02">密码提示问题：</TD> 
          <TD height="48" width="630" colspan="3" bgcolor="#f7fce9">&nbsp;<INPUT class=f11 maxLength=20 name=question size="20"> <FONT color=#990000>*</FONT><font color="#666666"> 在您忘记了密码，需要找回密码的时候，我们的系统会要求您回答这个问题。<BR>&nbsp;比如，您可以把密码提示答案设为：你的电话号码是什么？</font></TD></TR> 
        <TR vAlign="middle"> 
          <TD align=right height="30" width="115" bgcolor="#ff8a02">密码提示答案：</TD> 
          <TD height="30" width="630" colspan="3" bgcolor="#f7fce9">&nbsp;<INPUT class=f11 maxLength=20 name=answer size="20"> <FONT color=#990000>*</FONT><font color="#666666"> 如果您的电话号码是65694771，那您就可以把密码提示答案填写为：85694771。<BR>&nbsp;（请牢记这个答案，以便密码丢失时回答系统的提问。如果您的回答正确，系统就会自动把密码显示给您。）</font></TD></TR> 
                    
 <tr>
          <TD align=right height="26" width="115" bgcolor="#ff8a02">您的姓名：</TD> 
          <TD height="26" width="291" bgcolor="#f7fce9">&nbsp;<INPUT class=f11 maxLength=100 name=myname size="20"> <FONT color=#990000>
          *</FONT>&nbsp; <INPUT class=f11 name=ch type=radio value="先生" checked>先生&nbsp;&nbsp; <INPUT class=f11 name=ch type=radio value="女士">女士</TD> 
          <TD height="26" width="99" align="center" bgcolor="#ff8a02">您的职务：</TD>     
          <TD height="26" width="253" bgcolor="#f7fce9">&nbsp;<INPUT class=f11 maxLength=100 name=zw size="20"><FONT color=#990000 size=2>*</FONT></TD> 
                     </tr>
              
                     <tr>
          <TD align=right height="26" width="115" bgcolor="#ff8a02">联系地址：</TD> 
          <TD height="26" width="291" bgcolor="#f7fce9">&nbsp;<INPUT class=f11 maxLength=250 name=address size=35><FONT color=#990000 size=2>*</FONT></TD> 
          <TD height="26" width="99" align="center" bgcolor="#ff8a02">邮&nbsp;&nbsp;&nbsp; 编：</TD>     
          <TD height="26" width="253" bgcolor="#f7fce9">&nbsp;<INPUT class=f11 maxLength=8 name=post size=8><FONT color=#990000 size=2>*</FONT></TD> 
                     </tr>
                     <tr>
          <TD align=right height="29" width="115" bgcolor="#ff8a02"> 
            <p align="right">电&nbsp;&nbsp;&nbsp; 
          话：：</TD> 
          <TD height="29" width="291" bgcolor="#f7fce9">&nbsp;<INPUT class=f11 name=tel size=20><FONT color=#990000 size=2>*</TD> 
          <TD height="29" width="99" align="center" bgcolor="#ff8a02">传&nbsp;&nbsp;&nbsp; 真：</TD>     
          <TD height="29" width="253" bgcolor="#f7fce9">&nbsp;</FONT>&nbsp;<INPUT class=f11 name=fax size=20></TD> 
                     </tr>
                   
                     <tr>
          <TD align=right height="28" width="115" bgcolor="#ff8a02">您的电子邮件：</TD> 
          <TD height="28" width="291" bgcolor="#f7fce9">&nbsp;<INPUT class=f11 maxLength=100 name=email size=30><FONT size=2 color="#800000">*</FONT>&nbsp;</TD>    
          <TD height="28" width="99" bgcolor="#ff8a02" align="center"> 
            <p>网&nbsp;&nbsp;&nbsp; 址：</TD>    
          <TD height="28" width="253" bgcolor="#f7fce9">&nbsp;<INPUT class=f11 maxLength=100 name=web size=29 value=http://>  
</TD> 
                     </tr>
                     <tr>
          <TD align=right height="28" width="115" bgcolor="#ff8a02">申请会员类别：</TD> 
          <TD height="28" width="400" colspan=3 bgcolor="#f7fce9"><INPUT class=f11 name=comeon type=radio value="0" checked>免费会员 &nbsp; <INPUT class=f11 name=comeon type=radio value="1"><font color=red>企富通会员</font> <FONT color=#990000 size=2>*</FONT><a href=../qifotong.jsp target="_blank">(了解企富通会员的价值)</a></TD>    
                     </tr>
                     <tr>
          <TD align=right height="24" width="100%" colspan="4" bgcolor="#f7fce9">
          <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber8">
            <tr>
              <TD align=left height="22" width="382" bgcolor="#FFFFFF">
                       <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="72%" id="AutoNumber4" background="../IMAGES/newmiddle-bg7.gif" height="24">
                         <tr>
                           <td width="100%" height="24" background="newmiddle-bg6.gif">
                           <FONT color=#000000>
                           &nbsp;<IMG 
                  src="../images/bul_arrowGrnSm.gif"></FONT><font class=f12 style="font-size: 10.5pt"><b> 
                           填写公司资料</b></font></td>
                         </tr>
                       </table>
                       </TD>
<TD align=left height="22" width="347" bgcolor="#FFFFFF">
  　</TD>
            </tr>
          </table>
                       </TD>
                     </tr>
        <tr> 
          <TD align=right height="28" width="115" bgcolor="#ff8a02">公司名称：</TD> 
          <TD height="28" width="643" bgcolor="#f7fce9" colspan="3">&nbsp;<INPUT class=f11 maxLength=80 name=qymc size=40><FONT color=#990000 size=2>*</FONT></TD> 
        </tr> 
        
        <tr> 
          <TD align=right height="28" width="115" bgcolor="#ff8a02">公司介绍：</TD> 
          <TD height="28" width="643" bgcolor="#f7fce9" colspan="3">&nbsp;<textarea class=f11 rows="8" name="qyjj" cols="70"></textarea><FONT size=2 color="#800000">*</FONT>&nbsp;</TD>    
        </CENTER> 
<CENTER> 
        </tr> 
        </CENTER> 
        <tr>
          <TD align=right height="12" width="704" colspan="4" bgcolor="#f7fce9"></TD></tr> 
          <tr> 
<CENTER>
          </tr>
          <tr>
        </CENTER>
<CENTER>
          </tr>
          <tr> 
        </CENTER> 
<CENTER> 
          </tr> 
                     <tr>
          <TD align=right height="88" width="745" bgcolor="#f7fce9" colspan="4">
          <center>
            <table border="0" cellpadding="2" style="border-collapse: collapse" bordercolor="#111111" width="750" id="AutoNumber6" height="88">
              <tr>
                <td width="100%" height="84" bgcolor="#ff8a02">
<p align="center"><br>
<FONT color=#cc0000><B><span style="font-size: 10.5pt">
<font color="#000080"><a href="item.jsp">点此阅读服务条款</a></font></u></p>
                <p align="center">
    <input type="button" value="看过并同意服务条款！进行注册" onclick="check()"></td>
              </tr>
            </table>
            </center>
                                 </TD>
                     </tr>
          </TBODY></TABLE>
        </center>
              </CENTER>
  </TD></TR>
  </TBODY></TABLE>
  </center>
</div>
    </FORM>
    </td>
  </tr>
</table>
            </CENTER></td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    </TD>
    </TR>
  </TBODY></TABLE>
  </center>
<%@ include file="../end.jsp"%>