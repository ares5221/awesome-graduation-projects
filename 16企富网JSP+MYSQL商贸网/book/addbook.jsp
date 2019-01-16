<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>
<%@ include file="../info/checksession.jsp"%>
<%@ include file="time.jsp"%>

<TABLE cellSpacing=0 cellPadding=0 width="750" align=center border=0>
<TBODY>
<TR>
<TD><A onfocus=this.blur() href="../let" target=_blank>
<IMG src="../images/banner2.gif" width=750 border=0></A></TD></TR>
</TBODY></TABLE>


<TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
<TBODY>
<TR>
<TD style="PADDING-LEFT: 20px" bgColor=#ff8000 colSpan=2 height=28>
<IMG height=8 src="../images/ico_oval.gif" width=5 align=absMiddle>&nbsp;<b><a href=index.jsp><font color=ffffff>返回首页</font></a></b></FONT></TD></TR>
<TR>
<TD bgColor=#b25900 colSpan=2 height=2></TD>
</TR>
</TBODY>
</TABLE>




<TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
<TBODY>
<TR>
<TD style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 0px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid" vAlign=top align=middle bgColor=#fffff7>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center  border=0>
<TBODY>
<TR><TD background=../images/1x3.gif height=1></TD></TR></TBODY>
</TABLE>
</TD></TR></TBODY></TABLE>







<table cellspacing="0" cellpadding="0" border="0" width="750" align="center">
<tr>  <TD class=outtd>
<table border="0" cellspacing="1" cellpadding="2" width="100%" class="buttoncolor" >
<tr><td width="21%"><font color=ffffff>发表话题</font></td>
<td>

<form  action="../info/addbookok.jsp" method="post" name="Form1"  >
<input name="memid" type="hidden" class="zl" id="memid" size="81" value="<%=(String) session.getAttribute("userid")%>">


<table cellspacing="0" cellpadding="0" border="0" width="100%" class="smalltxt" style="table-layout: fixed; word-wrap: break-word" >
<tr><td>
<select name="lei" id="lei">                           
<option selected>话题分类</option>      
<option value="0">闲聊闲语</option>
<option value="1">最新资讯</option>
<option value="2">创业相关</option>
<option value="3">成功指引</option>
<option value="4">企业管理</option>
</select>

<input name="topic" type="text" class="zl" id="topic" size="81" value="标题" onfocus="if(value =='标题'){value =''}" onblur="if (value ==''){value='标题'}" >

</td>
</tr></table></td>
</tr>
<tr bgcolor="ffffff">
<td valign="top" width="21%">

<bR>
昵称<%=(String) session.getAttribute("loginname")%><bR>
<bR><bR><bR>

</td>
<td width="79%" height="100%">
<table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed; word-wrap: break-word">
<tr><td valign="top"><textarea class=f11 rows="16" name="content" cols="81"></textarea>

<div align=center><input type="button" value="  发表  " onclick="check()"></div>
</td></tr></table>
</td></tr>
</table>
</td></tr>
</table></td></tr></table>

</form>






<script LANGUAGE="JavaScript">
function check()
{     
 if (document.Form1.lei.value == "")        
  {        
    alert("请选择话题分类！");        
    document.Form1.lei.focus();        
    return (false);        
  }        
 if (document.Form1.topic.value == "")        
  {        
    alert("请输入标题！");        
    document.Form1.topic.focus();        
    return (false);        
  }        
 if (document.Form1.content.value == "")        
  {        
    alert("请输入内容！");        
    document.Form1.content.focus();        
    return (false);        
  }        
           
  
    document.Form1.submit()
}
</script>


<table ><tr><td height=5></td></tr></table>
<%@ include file="../end.jsp"%>