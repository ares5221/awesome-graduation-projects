<%@ page contentType="text/html;charset=gb2312" %>


<table cellSpacing="0" cellPadding="0" width="100%" align="center" bgColor="#999999" border="0" height="123">
<tbody>
<tr>
<td bgColor="#ffffff" height=80>
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
<tbody><tr>


<%@ include file="../top.jsp"%>

</table>
   <TABLE cellSpacing=0 cellPadding=0 width="750" align=center 
      bgColor=#ff7d00 border=0>

</tr>

<tr>
<td background="images/title_13.gif" colSpan="3" width="100%">		
<%@ include file="menu.jsp"%>
</td>
              </tr>
              <tr bgColor="#cccccc">
                <td colSpan="3" height="8" width="100%" background="images/de1.gif"></td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>
    </tbody>
  </table>


<html>
<body topmargin="0" leftmargin="0">
  <table style="BORDER-COLLAPSE: collapse" borderColor="#111111" height="22" cellPadding="0" width="750" align=center border="0" bgcolor="#F0F0F0">
    <tbody>
   
      <form action="search.jsp" method=get name=search><tr>
<input name="finaler" type="hidden" value="1">        <td align=center><font size=3>网站查找:</font>
<input class="ibox" size="70" name="key"><input type="image" alt="搜" src="images/search_but.gif" align="absMiddle" border="0" name="I1"> </td>
      </tr></form>
    
   	<tr>
        <td height="9">
<TABLE width=100% border=0 cellPadding=0 cellSpacing=0>
  <TBODY>
  <TR>
    <TD width="25%" bgColor=#a6daf5><SPACER height="1" type="block"></TD>
    <TD width="25%" bgColor=#c0e898><SPACER height="1" type="block"></TD>
    <TD width="25%" bgColor=#f9adbe><SPACER height="1" type="block"></TD>
    <TD width="25%" bgColor=#fed57f><SPACER height="1" type="block"></TD></TR>
  <TR>
    <TD bgColor=#95d3f3><SPACER height="1" type="block"></TD>
    <TD bgColor=#b4e484><SPACER height="1" type="block"></TD>
    <TD bgColor=#f89db2><SPACER height="1" type="block"></TD>
    <TD bgColor=#fece67><SPACER height="1" type="block"></TD></TR>
  <TR>
    <TD bgColor=#7fc9f0><SPACER height="1" type="block"></TD>
    <TD bgColor=#a4de6a><SPACER height="1" type="block"></TD>
    <TD bgColor=#f688a1><SPACER height="1" type="block"></TD>
    <TD bgColor=#fec346><SPACER height="1" type="block"></TD></TR>
  <TR>
    <TD bgColor=#6ec2ee><SPACER height="1" type="block"></TD>
    <TD bgColor=#98da56><SPACER height="1" type="block"></TD>
    <TD bgColor=#f57995><SPACER height="1" type="block"></TD>
    <TD bgColor=#febb2e><SPACER height="1" type="block"></TD></TR>
 </TBODY></TABLE>
<table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table2">
			<tr bgColor="#5d90de">
				<td width="20" background="result_back1.gif" bgcolor="#ff6d00">
				<br>
　</td>
				<td vAlign="bottom" background="result_back1.gif" height="30" bgcolor="#ff6d00"><!-- search bar -->
	<font color=ffffff size=3>网站登录:第三步</font>
				</td>
				<td vAlign="button" noWrap align="right" background="result_back1.gif" height="30" bgcolor="#ff6d00">
				
				<a class="title3" href="add.jsp"><img src=images/add.jpg border=0></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</table>
			</td>
      </tr>
    </tbody>
  </table>
  <table style="BORDER-COLLAPSE: collapse" borderColor="#111111" height="181" cellSpacing="0" cellPadding="0" width="750" border="0" align=center>
    <tbody>
      <tr>
        <td vAlign="top" height="181">
        <TABLE cellSpacing=10 cellPadding=0 width="100%" align=center border=0>
        <COLGROUP>
        <COL width="50%">
        <COL width="50%">
        <TBODY>
        <TR class=p6 vAlign=top>
          <TD valign="top">



<%if (request.getParameter("biglei")==null || request.getParameter("smalllei")==null ){%><script language=JavaScript>{window.location.href='add2.jsp'}</script><%}else{}%>


          </TD></TR>

<tr>

<form name="form1" method="post"  action="../info/addunionok.jsp" onSubmit="return check1();">
<input name="biglei" value="<%=request.getParameter("biglei")%>" type="hidden">
<input name="smalllei" value="<%=request.getParameter("smalllei")%>" type="hidden"><br>
网站分类:<input name=memo type=text value="<%=request.getParameter("biglei")%>==><%=request.getParameter("smalllei")%>" size=25  readonly="true">&nbsp;&nbsp;<a href=add2.jsp><font color=red size=3><<更改分类</font></a></tr>


    <tr> 
      <td width="30%" height="20" valign="top"> <div align="right"><font color="#FF0000">*</font>站点名称：</div></td>
      <td width="70%"> <input name="webname" type="text" id="webname" size="30"> 
        <br>
        1. 请填写网站的正式名称。 <br>
        2. 请不要使用广告或夸大的用语 (例如“最佳网站”或“唯一的经销商”等词)。 </td>
    </tr>
    <tr> 
      <td valign="top"><div align="right"><font color="#FF0000">*</font>站点链接：</div></td>
      <td><font color=red>http://</font><input name="weburl" type="text" id="weburl" value="" size="40"> <br> <br>
        1. 请认真填写您的站点链接！链接必须保持完整且有效！</td>
    </tr>
    <tr> 
      <td valign="top"><div align="right"><font color="#FF0000">*</font>站点简介：</div></td>
      <td><textarea name="webtext" cols="45" rows="10" id="webtext"></textarea> 
        <br>
        1. 请用简短文字描述贵站内容，含全形标点符号最多不超过200个汉字。 <br>
        2. 描述中请避免重覆叙述网站名称或类目。 <br>
        3. 请不要使用HTML标记。 <br>
        4. 请不要使用广告或夸大的用语(例如“最佳网站”或“唯一的经销商”等词)。 </td>
    </tr>

<tr> 
      <td colspan="2" valign="top"><div align="center"> 
                  <input type="submit" name="Submit" value="提交">
        </div></td>
    </tr>

</form>





        </TBODY></TABLE>






</td>
<td vAlign="top" height="181" align="right">




<TABLE cellSpacing=0 cellPadding=0 width="300" border=0>
        <TBODY>
        <TR>
          <TD width=26><IMG src="images/index_left5.gif" border=0></TD>
          <TD class=p6 vAlign=bottom width="100%" 
          background=images/index_back5.gif><FONT 
            color=#5c5c5c><B>网站登录步骤:</B></FONT></TD>
          <TD width=12><IMG height=25 src="images/index_right5.gif" 
            width=13 border=0></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="300" border=0>
        <TBODY>
        <TR>
          <TD bgColor=#f0f0f0><font size=3>
<br>第一步:阅读协议<br><br>
第二步:选择与您网站匹配的子类别<br><br>
<font color=red><b>第三步:完整填写表格.</b></font><br><br>
第四步:我们在24小时以内收录您的网站.<br><br>
</font>
</TD></TR></TBODY></TABLE>




</td></tr></tbody></table>
<%@ include file="../end.jsp"%>
</body>
</html>


<script language=javascript>
 
<!--
  function check1(){
    ff=document.form1 
    
    if (ff.webname.value==""){
      window.alert("请填写站点名称！")
      ff.webname.focus()
      return false
    }
    
        
    if (ff.weburl.value==""){
    window.alert("网站链接不能为空！请填写！")
    ff.weburl.focus()
    return false
    }
    if (ff.webtext.value==""){
    window.alert("请填写网站简介！")
    ff.webtext.focus()
    return false
    }
  }
//-->
</script>

