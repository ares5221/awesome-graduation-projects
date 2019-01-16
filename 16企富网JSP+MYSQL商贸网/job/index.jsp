<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>
<%@ include file="../conn/conn.jsp"%>









<BODY text=#000000 leftMargin=0 topMargin=0 
marginheight="0" marginwidth="0">
<div align="center">
<center>
<center>
<table border="0" cellspacing="0" style="border-collapse: collapse" width="750" id="AutoNumber1" cellpadding="0" height="109">
<tr>
<td width="560" valign="top">
<CENTER>
<TABLE border="0" width="100%" height="22" cellspacing="1" style="border-collapse: collapse" bordercolor="#111111">






<tr>
<td width="560" valign="top">
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width="560" align=center border=0>
        <TBODY>
        <TR>
          <TD><embed src="../images/job.swf" quality=high 
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
type="application/x-shockwave-flash" width=560 height=110></embed></TD></TR>
</TBODY></TABLE></td></tr>












<tr>
<TD background=image/CreditDynamic_index_bj06.gif 
height=37>
<DIV align=center class=LL>
<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%" style="font-size: 9pt">
<TBODY>
<form name="searchtitle" method="POST" action="search.jsp"> 
<TR>
<TD width="70%">
<DIV align=right><FONT color=#3366cc><span class="M">职位查询</span>：</FONT><font color="#FFFF00"><input type="text" name="txtitle" size="20" onfocus="this.value=''" value="职位关键字" ></font>
<left>
<Select Class=f11 size="1" name="lei"> 
<OPTION VALUE="全职">招聘全职</OPTION>
<OPTION VALUE="兼职">招聘兼职</OPTION>
<OPTION VALUE="应届生">应届毕业生</OPTION>
</Select><font color="#FFFFFF">&nbsp;</font> </DIV></TD>
<TD width="20%">&nbsp;<INPUT align=bottom border=0 
name=I7 src="image/CreditDynamic_index_search.gif" type=image ></TD></TR></TBODY></TABLE></DIV></TD>
</tr>
</form> 
<tr>
<td height="6" width="100%"></td>
</tr>
</table>
 
<table border="0" width="100%" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#111111"> 
<tr>
<TD style="color: #000; font-family: 宋体; font-size: 12px" width="533">
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="543" id="AutoNumber4" height="25">
<tr>
<td width="543" background="image/zp.gif" height="25">
<p align="right">
</td>
</tr>
</table>
</TD>
</tr>
<tr>
<TD style="color: #000; font-family: 宋体; font-size: 12px" width="533">
<center>
<TABLE cellPadding=4 width="543" 
bgColor=#FFFFFF border=1 style="border-collapse: collapse" bordercolor="#111111" bordercolorlight="#4883BD" bordercolordark="#4883BD" height="56" cellspacing="1">
<TBODY>

<TR>
<TD width=255 bgColor=#ffd51b height=12 style="color: #000; font-family: 宋体; font-size: 12px" align="center">
<DIV align=center><span style="letter-spacing: 5"><font color="#000000"><b>
招聘主题</b></font></span></DIV></TD>
<TD width=187 bgColor=#ffd51b height=12 style="color: #000; font-family: 宋体; font-size: 12px" align="center">
<DIV align=center><font color="#000000"><b>公司名称</b></font></DIV></TD>
<TD width=31 bgColor=#ffd51b height=12 style="color: #000; font-family: 宋体; font-size: 12px" align="center">
<DIV align=center><font color="#000000"><b>人数</b></font></DIV></TD>
<TD width=53 bgColor=#ffd51b height=12 style="color: #000; font-family: 宋体; font-size: 12px" align="center">
<b><font color="#000000">工作地</font></b></TD>
<TD width=65 bgColor=#ffd51b height=12 style="color: #000; font-family: 宋体; font-size: 12px" align="center">
<b><font color="#000000">发布日期</font></b></TD></TR>
 







<%
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from job order by id desc");
String pages = request.getParameter("page") ;
int pageInt =  1 ,i=0 ,k=1;
if(pages==null){}else{pageInt = Integer.parseInt(pages);}
while(i<20*(pageInt-1)&&rs.next()){i++ ;}
i=0;
while(rs.next()&i<20){
i++ ;
%>





<tr>
<TD width=255 height=5 style="color: #000; font-family: 宋体; font-size: 12px" bgcolor="#F2F7FB">
<font color="#FF8019">·</font><span style=\&quot;font-size:9pt;line-height: 15pt\"><a href="list.jsp?id=<%=rs.getString("id")%>" ><%=rs.getString("topic")%></a></span></TD>
<TD align=middle width=187 height=5 style="color: #000; font-family: 宋体; font-size: 12px" bgcolor="#F2F7FB">
<p align="left"> 
<span style=\&quot;font-size:9pt;line-height: 15pt\">

<a href=../web/index.jsp?id=<%=rs.getString("fbmemid")%> target="_blank"><%=rs.getString("fbmemcompany")%> 
</span></TD>
<TD align=middle width=31 height=5 style="color: #000; font-family: 宋体; font-size: 12px" bgcolor="#F2F7FB">
<%=rs.getString("jobnum")%>名</TD>
<TD width=53 height=5 style="color: #000; font-family: 宋体; font-size: 12px" bgcolor="#F2F7FB">
<p align="center"><%=rs.getString("jobaddress")%></TD>
<TD width=65 height=5 style="color: #000; font-family: 宋体; font-size: 12px" bgcolor="#F2F7FB">
<p align="center"><%=rs.getString("fbtime")%></TD></TR>




<%
}
%>
           










</TBODY></TABLE></center>
</TD>
</tr>
</table> 


<table border=0 width=98% cellspacing=0 cellpadding=0>
<tr height=25 >


<%
rs=stmt.executeQuery("SELECT count(*) from JOB order by id desc");
while(rs.next()) i = rs.getInt(1) ;
%>

  <td width="350" class="zl">共有招骋职位<font color="#FF0000"><%=i%></font>个 
                                        分<%=(i+20)/20%>页 当前为第<%=pageInt%>页</td>
                                      <td valign="middle">
<div align="right"> 
                                          <p class="zl">
										  
									转到第&nbsp;<%for(int j=1;j<(i+40)/20;j++){%><a href="index.jsp?page=<%=j%>"><font color=red><%=j%></font></a>&nbsp;<%}%>页
																	  
								
                                        </div></td>

</tr>
</table>
<td width="7" height="109" valign="top" background="image/CreditDynamic_zxqy_03.gif">
　<td width="193" height="109" valign="top">
<div align="center">
<center>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="188" id="AutoNumber2">
<tr>
<TD vAlign=top width="190">


<TABLE border=0 cellPadding=0 cellSpacing=0 width="190" style="border-collapse: collapse; font-size:9pt" bordercolor="#111111">
<TBODY>
<TR>
<TD width="189" height="26" background="image/j11.gif">
&nbsp; <span style="letter-spacing: 1"><font color="#FFFFFF">
<span style="font-size: 10.5pt"><b>创业最新话题</b></span></font></span></TD></TR>
<TR>
<TD 
background=image/CreditDynamic_index_bj11.gif width="189">
<DIV align=center>
<TABLE border=0 cellSpacing=1 width="181" style="border-collapse: collapse; font-size:9pt" bordercolor="#111111" height="37">
<TBODY>

<TR>
<TD class=LL width="68" height="17">

<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../zixun/indexzx.jsp?lei=2 topmargin=0 width=180 height=210></iframe>


</TD></TR>
 
<TR>
<TD height=14 width="181" colspan="3">
<DIV align=right><B><a href="../zixun/"><FONT 
color=#ff6600>&gt;&gt;&gt;更多</FONT></a></B><FONT 
color=#ff6600><B>&nbsp;</B></FONT></DIV></TD></TR></TBODY></TABLE></DIV></TD></TR>
<TR>
<TD bgColor=#527dce 
height=1 width="189"></TD></TR></TBODY></TABLE></TD>
</tr>








<TR>
<TD width="189" height="26" >
<img src=image/index_good100.jpg width=190 height=220 ></TD></TR>












</table>
</center>
</div>
<TBODY>
</TBODY></TABLE></center>
</div>
<div align="center">
<center>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="750" id="AutoNumber3">
<tr>
<td width="100%" background="../images/bt1.gif">　</td>
</tr>
</table>
</center>
</div>


















<%@ include file="../end.jsp"%>