<HEAD>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="top.jsp"%>

<TABLE cellSpacing=0 cellPadding=0 width=778 border=0>
<TBODY>
<TR>
<TD vAlign=top align=middle width=150  background=images/leftmanu_bg.gif>
<%@ include file="left.jsp"%>
</TD>


<TD style="BACKGROUND-POSITION: right 50%; BACKGROUND-IMAGE: url(images/bg1.gif); BACKGROUND-REPEAT: repeat-y; BACKGROUND-COLOR: #ffffff"  vAlign=top align=middle width=628>     




 <TABLE cellSpacing=0 cellPadding=0 width=628 border=0>
        <TBODY>
        <TR>
          <TD class=s vAlign=top align=right width=459 
          background=images/leftmanu_top1.gif height=30><FONT 
            color=#ffffff></FONT></TD>
          <TD class=s vAlign=top width=141 
          background=images/top_nav_bg2.gif><FONT 
            color=#ffffff></FONT> </TD>
          <TD width=28><IMG height=30 src="images/top_nav_5.gif" 
            width=28></TD></TR></TBODY></TABLE><BR>

     
      <TABLE cellSpacing=0 cellPadding=0 width=570 border=0>
        <TBODY>
        <TR>
          <TD 
          style="BACKGROUND-POSITION: left top; BACKGROUND-REPEAT: no-repeat" 
          align=right background=images/mi1.gif 
          height=154>
            <TABLE cellSpacing=0 cellPadding=2 border=0>
              <TBODY>
              <TR>
                <TD class=C vAlign=top align=left><font color=browse>超级管理员</font>:<STRONG><%=(String) session.getAttribute("finalername")%></STRONG> 
                  先生，您好！ </TD></TR>
              
              </TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width=478 border=0>
              <TBODY>
              <TR>
                <TD colSpan=3><IMG height=13 src="images/tj_1.gif" 
                  width=478></TD></TR>
              <TR>
                <TD width=2 bgColor=#ffc75c><IMG height=1 
                  src="images/shim.gif" width=2></TD>
                <TD align=middle width=474 bgColor=#ffffd6>
                  <TABLE cellSpacing=0 cellPadding=0 width="92%" border=0>
                    <TBODY>
                    <TR>
                      <TD 
                        class="C lh13"><STRONG>我是您的小帮手！</STRONG>
<script language="JavaScript">
<!--
var mess1="";
day = new Date( )
hr = day.getHours( )
if (( hr >= 0 ) && (hr <= 4 ))
mess1="深夜了，您别累坏身体了哦！"
if (( hr >= 4 ) && (hr < 7))
mess1="清晨好，您这麽早就工作了呀？！ "
if (( hr >= 7 ) && (hr < 12))
mess1="早上好，祝您今天有个好心情！"
if (( hr >= 12) && (hr <= 13))
mess1="该放下鼠标吃午饭了吧?"
if (( hr >= 13) && (hr <= 17))
mess1="现在外面天气还好吧?您困不困呀? "
if (( hr >= 17) && (hr <= 18))
mess1="太阳落山了！准备下班了吗?"
if ((hr >= 18) && (hr <= 20))
mess1="您吃过晚饭了吗？"
if ((hr >= 20) && (hr <= 23))
mess1="晚上了!今天收获不少吧!？"
document.write(mess1)
//--->
</script>
</TD>

<TR><td>
<br><br></td></tr>

<%
int  i=0 ;
rs=stmt.executeQuery("SELECT count(*) from finalermsg where flag=0 order by id desc");
while(rs.next()) i = rs.getInt(1) ;
%>

<TR>
<TD colSpan=8 class=C  align=left>
你有<font color=red><%=i%></font>条未读留言</TD></TR>


<TR><td>
<br><br></td></tr>


<TR>
<TD colSpan=8 class=C  align=left>今日注册<font color=red><iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=todaytotal.jsp topmargin=0 width=50 height=13></iframe></font>人 今日商机<font color=red><iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=todaysjtotal.jsp topmargin=0 width=50 height=13></iframe></font>条  今日申请加盟<font color=red><iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=todaydltotal.jsp topmargin=0 width=50 height=13></iframe></font>家
</TD></TR>


<TR><td>
<br><br></td></tr>


<TR>
<TD colSpan=8 class=C  align=left>目前共有注册会员<font color=red><iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=memtotal.jsp topmargin=0 width=50 height=13></iframe></font>人 商机<font color=red><iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=sjtotal.jsp topmargin=0 width=50 height=13></iframe></font>条 目前总加盟<font color=red><iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=dltotal.jsp topmargin=0 width=50 height=13></iframe></font>家
</TD></TR>


</TR></TBODY></TABLE></TD>
                <TD width=2 bgColor=#ffc75c><IMG height=1 
                  src="images/shim.gif" width=2></TD></TR>
              <TR>
                <TD colSpan=3><IMG height=13 src="images/tj_2.gif" 
                  width=478></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><BR>







      <TABLE cellSpacing=0 cellPadding=0 width=570 border=0>
        <TBODY>
        <TR>
          <TD background=images/bodybg.gif colSpan=3 height=22>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width="3%"><IMG height=22 
                  src="images/bodyleft.gif" width=10></TD>
                <TD class=index_title width="64%">最新留言 <IMG height=4 
                  src="images/point2.gif" width=7 align=absMiddle></TD>
                <TD align=right width="33%"><IMG height=22 
                  src="images/bodyright.gif" 
            width=10></TD></TR></TBODY></TABLE></TD></TR>
      

  <TR>


          <TD width=1 bgColor=#8abaff><IMG height=1 
            src="images/shim.gif" width=1></TD>
          <TD align=middle width=568><BR>
            <TABLE cellSpacing=2 cellPadding=2 width="94%" border=0>
              <TBODY>
              <TR>
                <TD class=C align=middle colSpan=2>













     <table width="521" border="0" cellpadding="3" cellspacing="1" bgcolor="A8A8A9">
                                                                    <tr bgcolor="EAECED" class="zl"> 
                                                                    
                                                                      <td width="191"><div align="center"><strong><font color="#333333">留言内容</font></strong></div></td>

<td width="70" bgcolor="EAECED"> 
                                                                        <div align="center"><strong><font color="#333333">留言人</font></strong></div></td>


                                                                      <td width="70" bgcolor="EAECED"> 
                                                                        <div align="center"><strong><font color="#333333">接收时间</font></strong></div></td>
                                                                      <td width="50" bgcolor="EAECED"><div align="center"><strong><font color="#333333">状态</font></strong></div></td>
                                                                      <td width="51" bgcolor="EAECED"><div align="center"><strong><font color="#333333">回复</font></strong></div></td>
                                                                      <td width="51" bgcolor="EAECED"><div align="center"><strong><font color="#333333">操作</font></strong></div></td>
</tr>





<%
String userid=(String) session.getAttribute("userid");
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from finalermsg  where flag=0 order by id desc");
while(rs.next()&i<20){
i++ ;
%>







                                                                    <tr bgcolor="#FFFFFF"> 
                                                                      <td class="zl"> 
                                                                        <div align="center">
<%=rs.getString("content")%>
                                                                          
</div></td>


<td class="zl"> 
                                                                        <div align="center"><font color="#333333"><%=rs.getString("sendmem")%></font></div></td>




                                                                      <td class="zl"> 
                                                                        <div align="center"><font color="#333333"><%=rs.getString("sendtime")%></font></div></td>
                                                                      <td class="zl"><div align="center"><%if(Integer.parseInt((String)rs.getString("flag"))==0){%><a href=flag.jsp?id=<%=rs.getString("id")%>><font color=red>未读</font></a><%}else{%><font color=cccccc>已读</font><%}%></div></td>
                                                                      <td class="zl"> 
                                                                        <div align="center"><a href="replymsg.jsp?recemem=<%=rs.getString("sendmem")%>" class="zllink"><font color="#333333">回复</font></a></div></td>
                                                                      <td class="zl"> 
                                                                        <div align="center"><a href="delmsg.jsp?id=<%=rs.getString("id")%>" class="zllink"><font color="#333333">删除</font></a></div></td>
                                                                    </tr>
                                                                






                               
<%
}
%>
   









                                                                    <tr bgcolor="#FFFFFF"> 
                                                                      <td height="30" colspan="7" bgcolor="#FFFFFF" class="zl"> 
                                                                        <div align="center">
                                                                          <table width="500" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr> 
                                                                            
                                                                            
                                                                              <td width="39"><div align="right">
                                                                                  
                                                                                </div></td>
                                                                            </tr>
                                                                          </table>
                                                                        </div></td>
                                                                    </tr>



</td>
                                                            </tr>
                                                          </table>























</TD></TR></TBODY></TABLE>


<BR></TD>
          <TD width=1 bgColor=#8abaff><IMG height=1 
            src="images/shim.gif" width=1></TD></TR>
        <TR bgColor=#8abaff>
          <TD colSpan=3 height=1><IMG height=1 src="images/shim.gif" 
            width=1></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><IMG 
height=10 src="images/bottom.gif" width=778><BR>


<%@ include file="end.jsp"%>
</BODY></HTML>
