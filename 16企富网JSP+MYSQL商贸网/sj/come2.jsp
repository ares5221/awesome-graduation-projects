<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>
<%@ include file="../conn/conn.jsp"%>






<TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
  <TBODY>
 
  <TR>
    <TD style="PADDING-LEFT: 20px" bgColor=#ff8000 colSpan=2 height=28><IMG 
      height=8 src="../images/ico_oval.gif" width=5 align=absMiddle> <FONT 
      color=#ffffff size=4><b><%if (request.getParameter("baae")==null){%>求购专区<%}else{%>我要销售<%}%></b></FONT></TD></TR>
  <TR>
    <TD bgColor=#b25900 colSpan=2 height=2></TD></TR></TBODY></TABLE>






<TABLE class=table-zuoyou cellSpacing=0 cellPadding=0 width=750 align=center 
border=0>
  <TBODY>
  <TR>
    <TD vAlign=top width=360 bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=0 width=345 align=center border=0>
        <TBODY>


<tr><td>
<TABLE class=main cellSpacing=0 cellPadding=0 width="100%" 
            align=right border=0>
              <TBODY>

<TR>


<TR><td height=10></td></tr>

</TBODY></TABLE>
</td></tr>


<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width=10><IMG height=30 
            src="../images/top_bj006.jpg" 
            width=13></TD>
          <TD align=middle 
          background=../images/top_bj006c.jpg><IMG 
            height=16 src="../images/i_my2.gif" 
            width=64></TD>
          <TD width=21><IMG height=30 
            src="../images/top_bj006a.jpg" 
            width=21></TD>
          <TD vAlign=bottom width=240>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD align=middle><A 
                  href="../sj/free.jsp" target="_blank"><font color=red>免注册快速发布信息>>></font></A> </TD></TR>
              <TR>
                <TD 
                background=../images/top_bj006b.jpg 
                height=9><IMG height=1 
                  src="../images/ico_tm.gif" 
                  width=1></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>














<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD style="BORDER-RIGHT: #2770cf 1px solid; BORDER-TOP: #2770cf 1px solid; BORDER-LEFT: #2770cf 1px solid; BORDER-BOTTOM: #2770cf 1px solid" vAlign=top align=right bgColor=#fffff7>

<TABLE cellSpacing=2 cellPadding=1 width="99%" align=center 
border=0>
<TBODY>      
<TR>

<%
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from dhyfl order by px asc");
int i = 1 ;
while(rs.next())
{%>
            
    

<td  height=25  width="30">&nbsp;</td><td width="180"> <div align="left"><a href="../sj/sjindex2.jsp?dfl=<%=rs.getString("dfl")%>&lei=2"  target="_blank"><font color=000000 size=3><b><%=rs.getString("dfl")%></b></font></a>


<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=total.jsp?lei=2&dfl=<%=rs.getString("dfl")%> topmargin=0 width=50 height=15></iframe>

<br>
<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=sfl.jsp?lei=2&dfl=<%=rs.getString("dfl")%> topmargin=0 width=150 height=34></iframe>
<br><br>




<%if (i==2){i-- ;%></tr><tr><%}else{i++ ;}%>
<%}
rs.close();
stmt.close();
con.close();
%>


</tr>


</TBODY></TABLE></TD></TR>
<TR><TD height=10></TD></TR></TBODY></TABLE>





















</TD>
    <TD vAlign=top width=400 bgColor=#ffffff>












<TABLE cellSpacing=0 cellPadding=0 width=390 align=center border=0>
        <TBODY>
        <TR>
          <TD 
          style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 0px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid" 
          vAlign=top align=middle bgColor=#fffff7 height=126>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center 
            border=0>
              <TBODY>
              <TR>
                <TD vAlign=center bgColor=#f1f2db height=22>&nbsp; <IMG 
                  src="../images/an05.gif">&nbsp;<STRONG>会员办公桌</STRONG></td>
<td align=right><a href=../reg/register.jsp><img  src=../images/arrow.gif border=0>10秒钟成为会员>></a></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center 
            border=0>
              <TBODY>
              <TR>
                <TD background=../images/1x3.gif height=1></TD></TR>
              <TR>
                <TD height=3></TD></TR></TBODY></TABLE>
            <TABLE class=main cellSpacing=0 cellPadding=0 width="99%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD vAlign=center width=100% height=30><iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../login.jsp topmargin=0 width=100% height=100></iframe></TD></TR>
  <TR>
<TD background=images/1x3.gif height=1></TD></TR>
</TBODY></TABLE>





</TD></TR></TBODY></TABLE>









<table ><tr><td height=10></td></tr></table>








<TABLE cellSpacing=0 cellPadding=0 width="390" align=center border=0>
        <TBODY>
        <TR>
          <TD><embed src="../images/wlmp.swf" quality=high 
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
type="application/x-shockwave-flash" width=390></embed></TD></TR>
</TBODY></TABLE>
















<TABLE cellSpacing=0 cellPadding=0 width=390 align=center border=0 height=350>
        <TBODY>
        <TR>
          <TD 
          style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 0px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid" 
          vAlign=top align=middle bgColor=#fffff7 height=126>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center 
            border=0>
              <TBODY>
              <TR>
                <TD vAlign=center bgColor=#f1f2db height=22>&nbsp; <IMG 
                  height=13 src="../images/icon_day.gif" 
                  width=16>&nbsp;<STRONG>最新求购信息</STRONG></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center 
            border=0>
              <TBODY>
              <TR>
                <TD background=../images/1x3.gif height=1></TD></TR>
              <TR>
                <TD height=3></TD></TR></TBODY></TABLE>
           






<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=right.jsp?lei=2 topmargin=0 width=380 height=783></iframe>

</TD></TR></TBODY></TABLE>
</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>


<%@ include file="../end.jsp"%>