<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../conn/conn.jsp"%>
<%@ include file="../config.jsp"%>
<HTML>
<TITLE><%=webname%>----让天下的商人富起来!</TITLE>
<link href="../conn/laba.css" rel="stylesheet" type="text/css">
<BODY leftMargin=0 marginwidth="0"  topMargin=0 background=../images/c_cnco_bj.gif align=center>

<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../top.jsp topmargin=0 width=760 height=63 align=center></iframe>







<%String dfl=(String)request.getParameter("dfl");
  String lei=request.getParameter("lei");%>














<TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
  <TBODY>
 
  <TR>
    <TD style="PADDING-LEFT: 20px" bgColor=#ff8000 colSpan=2 height=28><strong><img src=../images/icon_point.gif><font color=ffffff size=3><%=dfl%></font>
</strong></TD></TR>
  <TR>
    <TD bgColor=#b25900 colSpan=2 height=2></TD></TR></TBODY></TABLE>





<table width="750" border="0" cellspacing="0" cellpadding="0" align=center>
<tr> 
<td class="fl"  height=30 style="BORDER-RIGHT: #333333 1px solid; BORDER-TOP: #faa800 1px solid; BORDER-LEFT: #333333 1px solid; BORDER-BOTTOM: #faa800 1px solid" bgColor="#ffffff" align="left"><strong>




<table width="100%" border="0" cellpadding="0" cellspacing="0"   class="blackbordernobottom">
<tr> 
<td <%if(Integer.parseInt((String)lei)==0){%> class="buttoncolor" <%}%> class="norightbuttonborder"><a href="sjindex2.jsp?&lei=0&dfl=<%=dfl%>">所有信息</a></td>
<td <%if(Integer.parseInt((String)lei)==1){%> class="buttoncolor" <%}%> class="norightbuttonborder"><a href="sjindex2.jsp?dfl=<%=dfl%>&lei=1">供应信息</a></td>
<td <%if(Integer.parseInt((String)lei)==2){%> class="buttoncolor" <%}%>  class="norightbuttonborder"><a href="sjindex2.jsp?dfl=<%=dfl%>&lei=2">求购信息</a></td>
<td <%if(Integer.parseInt((String)lei)==3){%> class="buttoncolor" <%}%>  class="norightbuttonborder"><a href="sjindex2.jsp?dfl=<%=dfl%>&lei=3">代理信息</a></td>
<td <%if(Integer.parseInt((String)lei)==4){%> class="buttoncolor" <%}%>  class="norightbuttonborder"><a href="sjindex2.jsp?dfl=<%=dfl%>&lei=4">合作信息</a></td>
</tr>
</table>










</strong></td> 


                                    
</tr>
</table>







<TABLE cellSpacing=1 cellPadding=0 width=750 bgColor=#ffffff border=0 align=center>
<TBODY>      
<TR bgColor=#ffffff>

<TD vAlign=center align=center>



<TABLE cellSpacing=1 cellPadding=0 width=750 bgColor=#ffffff border=0 align=center>
<TBODY>      

<TR bgColor=#ffffff>
 



<%int k=1;
rs=stmt.executeQuery("select * from shyfl where dfl='"+dfl+"'");
while(rs.next())
{%>





<TD vAlign=center align=center height=30>
<a href="search2.jsp?lei=<%=lei%>&dfl=<%=dfl%>&sfl=<%=rs.getString("sfl")%>"  class="M">
<img src=../images/icon_day.gif border=0 ><%=rs.getString("sfl")%></a>
<span class="fl2" >
<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=sfltotal.jsp?lei=<%=lei%>&sfl=<%=rs.getString("sfl")%> topmargin=0 width=50 height=15></iframe>
</span>
</TD> 


<%if (k==4){k=1 ;%></tr><TR bgColor=#ffffff><%}else{%><%k++ ;}%>


<%}%>

</tr>




</table>

</td>
</tr>
</table>









<TABLE cellSpacing=0 cellPadding=0 width="750" align=center border=0>
        <TBODY>
        <TR>
          <TD><A onfocus=this.blur() 
            href="../let" target=_blank><IMG 
             src="../images/banner.gif" width=750 border=0></A></TD></TR>
</TBODY></TABLE>











<TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
  <TBODY>
 
  <TR>
    <TD style="PADDING-LEFT: 20px" bgColor=#ff8000 colSpan=2 height=28><strong><img src=../images/icon_point.gif><font color=ffffff size=3><strong><font color="ffffff">"<font color=yellow><%=dfl%></font>"类<%if(Integer.parseInt((String)lei)==1){%>供应<%}%><%if(Integer.parseInt((String)lei)==2){%>求购<%}%><%if(Integer.parseInt((String)lei)==3){%>代理<%}%><%if(Integer.parseInt((String)lei)==4){%>合作<%}%>信息共<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=total.jsp?lei=<%=lei%>&dfl=<%=dfl%> topmargin=0 width=50 height=15></iframe>条</font>　&nbsp;以下为"<font color=yellow><%=dfl%></font>"类推荐信息
</strong></font>
</strong></TD></TR>
  <TR>
    <TD bgColor=#b25900 colSpan=2 height=2></TD></TR></TBODY></TABLE>





<TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
<TBODY>
<TR>


<%int i=1,q=1;
if(Integer.parseInt((String)lei)==0){
rs=stmt.executeQuery("select * from sjxx where dfl='"+dfl+"' and ok=1  order by id desc");
}else{
rs=stmt.executeQuery("select * from sjxx where  dfl='"+dfl+"' and lei='"+lei+"' and ok=1  order by id desc");
}
while(rs.next()&i<60){
i++ ;%>



<TD width=48%>
<img src=../images/indicator.gif><img src=../images/aer1.gif><a href=sjxx.jsp?id=<%=rs.getString("id")%> target="_blank"><%=rs.getString("topic")%><font color=cccccc>[<%=rs.getString("fbtime")%>]</font></a>
</td>
<Td width=4%></tD>


<%if (q==2){q=1 ;%></tr><TR><%}else{%><%q++ ;}%>


<%}%>
</tr>
</TBODY>
</table>


<%@ include file="../end.jsp"%>


