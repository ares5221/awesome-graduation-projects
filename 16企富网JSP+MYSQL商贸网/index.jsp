<%@ page contentType="text/html;charset=gb2312" %>




<table width="750" border="0" cellpadding="0" cellspacing="0"   class="blackbordernobottom" align=center>
<tr> 
<td  class="buttoncolor"  class="norightbuttonborder"><font size=2><b>来</b></font>访者请注意:本站只作为演示程序所用!不作为商贸网的运作及经营性的商业目的!如果喜欢本站程序!请与我联系:<b>Q Q : 2 3 4 5 3 2 2</b></td>
</tr>
</table>







<%@ include file="../top.jsp"%>

<%if ((String) session.getAttribute("Did")==null){}else{%>
<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=dlborder.jsp topmargin=0 width=750 height=100 align=center></iframe>
<%}%>



<%@ include file="../conn/conn.jsp"%>


<TABLE class=table-zuoyou cellSpacing=0 cellPadding=0 width=750 align=center border=0>
  <TBODY>
  <TR>
    <TD vAlign=top width=360 bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=0 width=345 align=center border=0>
        <TBODY>

<tr><td>
<TABLE class=main cellSpacing=0 cellPadding=0 width="100%" 
            align=right border=0>
              <TBODY>
<TR><td height=12></td></tr>

</TBODY></TABLE>
</td></tr>


        <TR>
          <TD width=345>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=130 background=images/bg_list01.gif 
                  height=23>&nbsp;&nbsp;<IMG height=11 
                  src="images/icon_20.gif" width=17><STRONG>商业机会</STRONG></TD>
                <TD vAlign=top align=right 
                  background=images/bg_list02.gif><A 
                  href="sj/free.jsp" target="_blank"><font color=red>免注册快速发布信息>>></font></A> 
            </TD></TR></TBODY></TABLE></TD></TR>



<tr>  <TD width=345><table width="100%" border="0" cellpadding="0" cellspacing="0"   class="blackbordernobottom">
<tr> 
<td class="buttoncolor"><a href="sj"><font class="NOL white">所有信息</font></a></td>
<td class="norightbuttonborder"><a href="sj/come1.jsp">供应信息</a></td>
<td class="norightbuttonborder"><a href="sj/come2.jsp">求购信息</a></td>
<td class="norightbuttonborder"><a href="sj/come3.jsp">代理信息</a></td>
<td class="norightbuttonborder"><a href="sj/come4.jsp">合作信息</a></td>
</tr>
</table></td></tr>



        <TR>
          <TD 
          style="BORDER-RIGHT: #ffda68 1px solid; BORDER-TOP: #ffda68 1px solid; BORDER-LEFT: #ffda68 1px solid; BORDER-BOTTOM: #ffda68 1px solid" 
          vAlign=top align=right bgColor=#fffff7>


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


<td  height=25  width="30">&nbsp;</td><td width="180"> <div align="left"><a href="sj/sjindex2.jsp?lei=0&dfl=<%=rs.getString("dfl")%>"  target="_blank"><font color=000000 size=3>
<%=rs.getString("dfl")%></font></a>
<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=sj/total.jsp?lei=0&dfl=<%=rs.getString("dfl")%> topmargin=0 width=50 height=15></iframe>

<%if (i==2){i-- ;%></tr><tr><%}else{%></td><%i++ ;}%>

<%}
%>




</TBODY></TABLE></TD></TR>

<TR><TD height=10></TD></TR>

</TBODY></TABLE>



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
                <TD background=images/1x3.gif height=1></TD></TR>
              <TR>
                <TD height=3></TD></TR></TBODY></TABLE>


<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../login.jsp topmargin=0 width=100% height=100></iframe>





</TD></TR></TBODY></TABLE>





<table ><tr><td height=5></td></tr></table>

<TABLE cellSpacing=0 cellPadding=0 width=390 align=center border=0>
<TBODY>
<TR>
<TD style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid" align=middle bgColor=#fffff7 height=204>
<SCRIPT language=JavaScript>
<!--
var scrollerwidth=390
var scrollerheight=200
var scrollerbgcolor='#ffffff'
var num = 30
var staytime='3000'
var slidespeed='100'
var slides=new Array() 
if (slides.length>1)
i=2
else
i=0 
function move1(whichlayer){  
tlayer=eval(whichlayer)  
if (tlayer.top>0&&tlayer.top<=num){  
tlayer.top=0  
setTimeout("move1(tlayer)",staytime)  
setTimeout("move2(document.main.document.second)",staytime)  
return  
}  
if (tlayer.top>=tlayer.document.height*-1){  
tlayer.top-=num
setTimeout("move1(tlayer)",slidespeed)  
}  
else{  
tlayer.top=scrollerheight  
tlayer.document.write(slides[i])  
tlayer.document.close()  
if (i==slides.length-1)  
i=0  
else  
i++  
}  
}    
function move2(whichlayer){  
tlayer2=eval(whichlayer)  
if (tlayer2.top>0&&tlayer2.top<=num){  
tlayer2.top=0  
setTimeout("move2(tlayer2)",staytime)  
setTimeout("move1(document.main.document.first)",staytime)  
return  
}  
if (tlayer2.top>=tlayer2.document.height*-1){  
tlayer2.top-=num
setTimeout("move2(tlayer2)",slidespeed)  
}  
else{  
tlayer2.top=scrollerheight  
tlayer2.document.write(slides[i])  
tlayer2.document.close()  
if (i==slides.length-1)  
i=0  
else  
i++  
}  
}    
function move3(whichdiv){  
tdiv=eval(whichdiv)
if (tdiv.style.pixelTop>0&&tdiv.style.pixelTop<=num){  
tdiv.style.pixelTop=0  
setTimeout("move3(tdiv)",staytime)  
setTimeout("move4(second2)",staytime)  
return  
}  
if (tdiv.style.pixelTop>=tdiv.offsetHeight*-1){  
tdiv.style.pixelTop-=num
setTimeout("move3(tdiv)",slidespeed)  
}  
else{  
tdiv.style.pixelTop=scrollerheight  
tdiv.innerHTML=slides[i]  
if (i==slides.length-1)  
i=0  
else  
i++  
}  
}    
function move4(whichdiv){  
tdiv2=eval(whichdiv)  
if (tdiv2.style.pixelTop>0&&tdiv2.style.pixelTop<=num){  
tdiv2.style.pixelTop=0  
setTimeout("move4(tdiv2)",staytime)  
setTimeout("move3(first2)",staytime)  
return  
}
if (tdiv2.style.pixelTop>=tdiv2.offsetHeight*-1){  
tdiv2.style.pixelTop-=num  
setTimeout("move4(second2)",slidespeed)  
}  
else{  
tdiv2.style.pixelTop=scrollerheight  
tdiv2.innerHTML=slides[i]  
if (i==slides.length-1)  
i=0  
else  
i++  
}}    
function startscroll(){  
if (document.all){ 
move3(first2)  
second2.style.top=scrollerheight  
second2.style.visibility='visible'  
}  
else if (document.layers){  
document.main.visibility='show'  
move1(document.main.document.first)  
document.main.document.second.top=scrollerheight+num  
document.main.document.second.visibility='show'  
}}
window.onload=startscroll
//-->
</SCRIPT>

<SCRIPT language=JavaScript>
<!--

slides[0]='<a href=qifotong.jsp><img src=../images/g3.gif border=0></a>'

slides[1]='<a href=union><img src=../images/g2.jpg border=0></a>'

slides[2]='<a href=let><img src=../images/g1.gif border=0></a>'

//-->
</SCRIPT>

<SCRIPT language=JavaScript>
<!--
if (document.all){
document.writeln('<span id="main2" style="position:relative;width:'+scrollerwidth+';height:'+scrollerheight+';overflow:hiden;background-color:'+scrollerbgcolor+')">')
document.writeln('<div style="position:absolute;width:'+scrollerwidth+';height:'+scrollerheight+';clip:rect(0 '+scrollerwidth+' '+scrollerheight+' 0);left:0;top:0">')
document.writeln('<div id="first2" style="position:absolute;width:'+scrollerwidth+';left:0;top:1;">')
document.write(slides[1])
document.writeln('</div>') 
document.writeln('<div id="second2" style="position:absolute;width:'+scrollerwidth+';left:0;top:0;visibility:hidden">')
document.write(slides[2])
document.writeln('</div></div></span>')
}
//-->
</SCRIPT>

</TD></TR></TBODY></TABLE>




<table ><tr><td height=5></td></tr></table>




<TABLE cellSpacing=0 cellPadding=0 width=320 align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD width=1 bgColor=#cccccc ></TD>
                      <TD vAlign=top >
                        <TABLE cellSpacing=0 cellPadding=0 width=390 align=right 
                        border=0>
                          <TBODY>
                          <TR>
                            <TD height=1></TD></TR>
                          <TR>
                            <TD bgColor=#cccccc height=1></TD></TR>
                          <TR>
                            <TD bgColor=#ff7100 height=25>　　<IMG height=13 
                              src="images/d.gif" width=13>　<SPAN 
                              class=aa><font color=ffffff>::今日紧急求购::</font></SPAN></TD></TR>
                          <TR>
                            <TD bgColor=#cccccc></TD></TR>
                          <TR>
                            <TD height=55>
                              <DIV align=center>


<TABLE cellSpacing=0 cellPadding=0 width=392 align=center border=0>
<TBODY>
<TR>
<TD style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid" align=middle bgColor=#f7f7f7 height=90>

<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=sj/fast.jsp topmargin=0 width=100% height=90></iframe>


</TD></TR></TBODY></TABLE>










</DIV></TD></TR></TBODY></TABLE>


</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>



<TABLE cellSpacing=0 cellPadding=0 width="750" align=center border=0>
<TBODY>
<TR>
<TD><A href="/sj/come2.jsp" target=_blank><IMG  src="images/banner4.gif"  border=0></A></TD>
 
<Td>
<TABLE borderColor=#ffffff cellSpacing=0 cellPadding=0 width=290 align=center border=1>
<TBODY>

<TR><TD bgColor=#cccccc height=4></TD></TR>

<TR><TD vAlign=top>
<TABLE cellSpacing=0 width="100%" align=center border=0>
<TBODY>
<TR>
<TD><A href="#" target=_blank><IMG height=55  src="images/model_logo.gif" width=55 vspace=7   border=0></A></TD>
<TD width=5>&nbsp;</TD>
<TD><A href="qifotong.jsp" target=_blank>拥有诚信身份证，订单财富滚滚来</A><BR>
    <A href="qifotong.jsp" target=_blank>只需简单申请，轻松完成认证</A><BR>
    <A href="#">企富网会员认证档案</A><BR>
    <A href="info/gradeindex.jsp" target=_blank>如何让我的诚信指数更高？</A>

</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></td>


</TR>
</TBODY></TABLE>





<TABLE borderColor=#ffffff cellSpacing=0 cellPadding=0 width=750 border=1 align=center>
  <TBODY>
  <TR>
    <TD borderColor=#cccccc>
      <TABLE cellSpacing=0 cellPadding=0 width=750 border=0>
        <TBODY>
        <TR>
          <TD bgColor=#cccccc height=1></TD></TR>
        <TR>
          <TD bgColor=#ffa033 height=25>
            <TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD width=46>
                  <DIV align=center><IMG height=13 src="images/d.gif" 
                  width=13></DIV></TD>
                <TD class=aa width=400>热门产品推荐　　　　　　　　　　　　　　　<A class=b2b4 
                  href="show" 
                  target=_blank>更多&gt;&gt;</A></TD>
                <TD class=aa>&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD bgColor=#cccccc height=4></TD></TR>
        <TR>
          <TD vAlign=top height=143>
            <TABLE cellSpacing=0 cellPadding=0 width=750 align=center 
              border=0><TBODY>
              <TR vAlign=top>
                <TD width=445 height=129>


<TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
  <TBODY>

  <TR>

<%int v=1,k=1;
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from showbar order by id desc");
while(rs.next()&v<14){
v++ ;
%>






    <TD width=100 height=101><DIV align=center>

<a href=show/show.jsp?id=<%=rs.getString("id")%> target="_blank">
<IMG height=79  src="../<%=rs.getString("showphoto")%>"" width=73 
border=0><Br><Br><%=rs.getString("showname")%></A></DIV></TD>

<%if (k==7){k=0 ;%></tr><tr><%}else{%><%k++ ;}%>
                       
<%
}
%>






</TR>







</TBODY></TABLE>

</TD>
              </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>


<TABLE cellSpacing=0 cellPadding=0 width="750" align=center border=0>
        <TBODY>
        <TR>
          <TD><embed src="../images/hh.swf" quality=high 
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
type="application/x-shockwave-flash" width=750 height=130></embed></TD></TR>
</TBODY></TABLE>



<TABLE class=table-zuoyou cellSpacing=0 cellPadding=0 width=762 align=center 
border=0>
  <TBODY>
<tr><td height=8></td></tr>

<TR>
    <TD vAlign=top width=360 bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=0 width=345 align=center border=0>
        <TBODY>
        <TR>
          <TD width=130 background=images/bg_list01.gif 
            height=23>&nbsp;&nbsp;<IMG height=13 src="images/icon_day.gif" 
            width=16>&nbsp;<STRONG>最新商机</STRONG></TD>
          <TD background=images/bg_list02.gif>&nbsp; </TD>
          <TD width=130 background=images/bg_list01.gif>&nbsp;&nbsp;<IMG 
            height=13 src="images/icon_day.gif" 
            width=16>&nbsp;<STRONG>新登网站</STRONG></TD>
          <TD background=images/bg_list02.gif>&nbsp;</TD></TR></TBODY></TABLE>
      <TABLE 
      style="BORDER-RIGHT: #ffda68 1px solid; BORDER-TOP: #ffda68 1px solid; BORDER-LEFT: #ffda68 1px solid; BORDER-BOTTOM: #ffda68 1px solid" 
      cellSpacing=0 cellPadding=0 width=345 align=center bgColor=#fffff7 
      border=0>
        <TBODY>
        <TR>
          <TD vAlign=top width=170>
            



<TABLE cellSpacing=0 cellPadding=0 width=170 align=center 
              border=0>


<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=sj/indexsj.jsp topmargin=0 width=170 height=230></iframe>

</TABLE>

</TD>
<TD vAlign=top>
           

<TABLE cellSpacing=0 cellPadding=0 width=170 align=center border=0>

<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=union/indexweb.jsp topmargin=0 width=170 height=210></iframe>

<TR>
<TD align=right height=22>&nbsp;<IMG src="images/ring02.gif">
<A  href="union/add.jsp"  target=_blank><font olor=red>我要马上加入>>></a></A>
</TD></TR></TBODY></TABLE>

</TD></TR></TBODY></TABLE>

<table><tr><td height=8></td></tr></TABLE>


</TD>
    <TD vAlign=top width=400 bgColor=#ffffff>

      <TABLE cellSpacing=0 cellPadding=0 width=380 align=center border=0>
        <TBODY>
        <TR>
          <TD width=130 background=images/bg_list03.gif 
            height=23>&nbsp;&nbsp;<IMG height=13 src="images/icon_day.gif" 
            width=16>&nbsp;<STRONG>最新招骋</STRONG></TD>
          <TD background=images/bg_list04.gif>&nbsp; </TD>
          <TD width=130 background=images/bg_list03.gif>&nbsp;&nbsp;<IMG 
            height=13 src="images/icon_day.gif" 
            width=16>&nbsp;<STRONG>最新加入</STRONG></TD>
          <TD background=images/bg_list04.gif>&nbsp;</TD></TR></TBODY></TABLE>
      


<TABLE style="BORDER-RIGHT: #99cc66 1px solid; BORDER-TOP: #99cc66 1px solid; BORDER-LEFT: #99cc66 1px solid; BORDER-BOTTOM: #99cc66 1px solid" cellSpacing=0 cellPadding=0 width=380 align=center bgColor=#f7fce9 border=0>
<TBODY>
<TR>
<TD vAlign=top width=170>

<TABLE cellSpacing=0 cellPadding=0 width=170 align=center border=0><TBODY>

<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=job/indexjob.jsp topmargin=0 width=170 height=230></iframe>


     
</TBODY></TABLE>



</TD>
<TD vAlign=top width=170>


<TABLE cellSpacing=0 cellPadding=0 width=170 align=center border=0><TBODY>

<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=minglu/indexml.jsp topmargin=0 width=170 height=230></iframe>
      
</TBODY></TABLE>




</TD></TR></TBODY></TABLE>

<table><tr><td height=8></td></tr></TABLE>

</TD></TR></TBODY></TABLE>







<TABLE cellSpacing=0 cellPadding=0 width=760 border=0 align=center>
  <TBODY>
  <TR>
    <TD vAlign=center colSpan=2 height=4></TD></TR>
  <TR>
    <TD vAlign=top width=250>
      <DIV align=left>
      <TABLE borderColor=#ffffff cellSpacing=0 cellPadding=0 width=190 
      align=right border=1>
        <TBODY>
        <TR>
          <TD borderColor=#cccccc>
            <TABLE cellSpacing=0 cellPadding=0 width=250 border=0>
              <TBODY>
              <TR>
                <TD bgColor=#cccccc height=1></TD></TR>
              <TR>
                <TD background=images/b.gif bgColor=#f7f7f7 
                  height=25>  <IMG height=13 src="images/d.gif" 
                  width=13> <SPAN class=aaa>创业指点迷津</SPAN><FONT color=#000000> 
                  </FONT></TD></TR>
              <TR>
                <TD height=63>
                  <TABLE cellSpacing=0 cellPadding=0 width=205 align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD height=10>


<TABLE cellSpacing=0 cellPadding=0 width=205 align=center border=0>
  <TBODY>
  <TR>
    <TD height=10></TD></TR>
  <TR>
    <TD align=right>


<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=zixun/indexzx.jsp?lei=2 topmargin=0 width=205 height=210></iframe>

<Br>
&gt;&gt;<A class=b2b1  href="zixun" target=_blank>更多</A></TD></TR>
  <TR>
    <TD height=8></TD></TR></TBODY></TABLE>


</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></TD>
    <TD vAlign=top width=250>
      <DIV align=right>
      <TABLE borderColor=#ffffff cellSpacing=0 cellPadding=0 width=190 
      align=center border=1>
        <TBODY>
        <TR>
          <TD borderColor=#cccccc>
            <TABLE cellSpacing=0 cellPadding=0 width=250 border=0>
              <TBODY>
              <TR>
                <TD bgColor=#cccccc height=1></TD></TR>
              <TR>
                <TD background=images/b.gif bgColor=#f7f7f7 
                  height=25>　<IMG height=13 src="images/d.gif" 
                  width=13>　<SPAN class=aaa>成败启发</SPAN></TD></TR>
              <TR>
                <TD height=63>
                  <TABLE cellSpacing=0 cellPadding=0 width=205 align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD height=10></TD></TR>
                    <TR>
                      <TD align=right>

<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=zixun/indexzx.jsp?lei=3 topmargin=0 width=205 height=210></iframe>

&gt;&gt;<A class=b2b1 href="zixun"  target=_blank>更多</A></TD></TR>
                    <TR>
                      <TD height=8></TD></TR></TBODY></TABLE>
</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></TD>





<TD vAlign=top width=250>
      <DIV align=right>
      <TABLE borderColor=#ffffff cellSpacing=0 cellPadding=0 width=190 
      align=center border=1>
        <TBODY>
        <TR>
          <TD borderColor=#cccccc>
            <TABLE cellSpacing=0 cellPadding=0 width=250 border=0>
              <TBODY>
              <TR>
                <TD bgColor=#cccccc height=1></TD></TR>
              <TR>
                <TD background=images/b.gif bgColor=#f7f7f7 
                  height=25>　<IMG height=13 src="images/d.gif" 
                  width=13>　<SPAN class=aaa>管理培训 　　　 </SPAN></TD></TR>
              <TR>
                <TD height=63>
                  <TABLE cellSpacing=0 cellPadding=0 width=205 align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD height=10></TD></TR>
                    <TR>
                      <TD align=right>


<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=zixun/indexzx.jsp?lei=4 topmargin=0 width=205 height=210></iframe>

&gt;&gt;<A  class=b2b1 href="zixun"   target=_blank>更多</A></TD></TR>
                    <TR>
                      <TD   height=8></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></TD>



</TR></TBODY></TABLE>








<TABLE cellSpacing=0 cellPadding=0 width="760" align=center border=0>
        <TBODY>
        <TR>
          <TD><embed src="../images/122_1.swf" quality=high 
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
type="application/x-shockwave-flash" width=760 height=90></embed></TD></TR>
</TBODY></TABLE>




<TABLE cellSpacing=0 cellPadding=0 width=760 border=0 align=center>
  <TBODY>
  <TR>
    <TD vAlign=top width=50%>

<TABLE cellSpacing=0 cellPadding=0 width="100%" 
            background="images/bar_email.jpg" 
            border=0>
              <TBODY>
              <TR>
                <TD align=left>
                  <TABLE cellSpacing=2 cellPadding=0 width=150 border=0>
                    <TBODY>
                    <TR>
                      <TD rowSpan=2><IMG height=26 
                        src="images/v6_icon_demo.gif" 
                        width=33 border=0></TD>
                      <TD height=10><IMG height=5 
                        src="images/v6_en_navi_entrance.gif" 
                        width=53 border=0></TD></TR>
                    <TR>
                      <TD><font color=ffffff>常见问题与解答</font></TD></TR></TBODY></TABLE></TD>
                <TD width=2><IMG height=30 
                  src="images/bar_email_block.gif" 
                  width=2></TD>
                <TD width=230>
                  <TABLE cellSpacing=2 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR>
                      <TD rowSpan=2 align=center><IMG height=26 
                        src="images/v6_icon_entrance.gif" 
                        width=33 border=0></TD>
                      <TD height=10><IMG height=5 
                        src="images/v6_en_navi_intro.gif" 
                        width=33></TD></TR>
                    <TR>
                      <TD><font color=ffffff>联系<%=webname%></font></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>



<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="cccccc">
<tr>
<td height="80" valign="top" bgcolor="#FFFFFF">
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="ffffff">
<tr><td width=100%>


<TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <TBODY> 
  <TR>
                <TD class=S noWrap>·<A
                  href="#" 
                 >发布信息要注册吗？</A></TD></TR>
              <TR>
                <TD class=S noWrap>·<A 
                 href="#" 
                  >为什么信息通不过审核？</A></TD></TR>
           
              <TR>
                <TD class=S noWrap>·<A 
                  href="#" 
                 >发布的产品图片怎么不见了？</A></TD></TR>
              <TR>
                <TD class=S noWrap>·<A                    
                  href="#" 
                  >如何实现和求购方线上洽谈？</A></TD></TR>
              <TR>
                <TD class=S noWrap>·<A                   
                  href="#" 
                  >如何变更公司授权人？</A></TD></TR>  <TR>
                <TD class=S noWrap>·<A                   
                  href="#" 
                  >如何变更公司授权人？</A></TD></TR>
              <TR>
                <TD class=s noWrap align=right><IMG height=19 
                  src="images/icon_point.gif" width=18 
                  align=absMiddle> <A 
                   
                  href="#" 
                 >更多</A></TD></TR></TBODY></TABLE></TD>
          <TD class=smalltoppad vAlign=top align=left>
            <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
              <FORM action=finaler/send.jsp  method=post >
<input name=sendmem value="游客" type=hidden>
              <TBODY>
              <TR>
                <TD class=S align=middle>对网站服务提建议？</TD></TR>
              <TR>
                <TD align=middle><TEXTAREA style="BORDER-RIGHT: #7e9eb7 1px solid; BORDER-TOP: #7e9eb7 1px solid; BORDER-LEFT: #7e9eb7 1px solid; COLOR: #000000; BORDER-BOTTOM: #7e9eb7 1px solid" name=content rows=5 cols=15></TEXTAREA> 
                 </TD></TR>
              <TR>
                <TD style="PADDING-left: 75px"><input type="submit" name="submit" value="发送" style="FONT-WEIGHT: bold; BACKGROUND: #cccccc; COLOR: rgb(255,255,255); FONT-STYLE: normal; FONT-VARIANT: normal">  </TD></TR></FORM></TBODY></TABLE>

</td>
</tr>
</table>
</td>
</tr>
</table>

</td><TD vAlign=top width=50%>



<TABLE cellSpacing=0 cellPadding=0 width=410 border=0 align=center>
        <TBODY>
        <TR>
          <TD class="smallleftpad c" 
          style="BORDER-TOP: #ffa55b 2px solid; PADDING-LEFT: 10px; BORDER-BOTTOM: #ff4e00 2px solid" 
          align=left bgColor=#ff7300 height=32><FONT class=M 
            color=#ffffff>商人最新话题:</FONT></TD>
          <TD class="smallleftpad c" 
          style="BORDER-TOP: #ffa55b 2px solid; PADDING-LEFT: 10px; BORDER-BOTTOM: #ff4e00 2px solid" 
          align=right bgColor=#ff7300 height=28><IMG height=16 
            src="images/icon_point_red_16.gif" width=16 align=absMiddle> <A 
            href="book" 
            target=_blank><FONT class=s 
        color=#ffffff>更多</FONT></A>&nbsp;</TD></TR></TBODY></TABLE>


      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
<td><img src=images/cs1.jpg></td>

<TD class=lh15 style="PADDING-RIGHT: 5px; PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; PADDING-TOP: 10px">

<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=book/indexbook.jsp?status=1 topmargin=0 width=320 height=55></iframe>


</TD>
</tr></TABLE>

<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<tr><TD class=lh15 style="PADDING-RIGHT: 5px; PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; PADDING-TOP: 10px">
<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=book/indexbook.jsp?status=0 topmargin=0 width=320 height=55></iframe>
</td><td><img src=images/doc_globe.gif></td>
</TR></TBODY></TABLE>




</DIV></TD></TR></TBODY></TABLE>

















<%@ include file="so.jsp"%>




<%@ include file="end.jsp"%>