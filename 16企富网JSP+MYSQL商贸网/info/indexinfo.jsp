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



<%int i=0 ;
String userid=(String) session.getAttribute("userid");
String username=(String) session.getAttribute("loginname");
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT count(*)  from message where recemem='"+userid+"' and flag=0");
while(rs.next()) i = rs.getInt(1) ;
int msg = i;
rs=stmt.executeQuery("SELECT * from visiter where username='"+username+"'");
rs.next();
%>

<%if  (Integer.parseInt((String)rs.getString("sound"))==1){%>

<%if(msg==0){%>

<%if ((String) session.getAttribute("sound")==null){%>
<bgsound src=great.wav border=0>
<%session.setAttribute("sound","ok");%>
<%}%>


<%}else{%>
<bgsound src="newpm.wav" border=0>
<%session.setAttribute("sound","ok");%>

<%}%>
<%}%>


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
          align=right background=images/mi<%=rs.getString("css")%>.gif 
          height=154>
            <TABLE cellSpacing=0 cellPadding=2 border=0>
              <TBODY>
              <TR>
                <TD class=C vAlign=top align=left><STRONG><%=(String) session.getAttribute("loginname")%></STRONG> 
                  (<%=(String) session.getAttribute("myname")%>) 先生，您好！ </TD></TR>
              
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
                        class="C lh13"><STRONG>我是您的小秘书！</STRONG>
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
mess1="外面天气还好吧?您困不困呀? "
if (( hr >= 17) && (hr <= 18))
mess1="太阳落山了！准备下班了吗?"
if ((hr >= 18) && (hr <= 20))
mess1="您吃过晚饭了吗？"
if ((hr >= 20) && (hr <= 23))
mess1="晚上了!今天收获不少吧!？"
document.write(mess1)
//--->
</script>


<br>
<a href=mymessage.jsp>你有<font color=red> <%=msg%> </font>条未读留言</a>  诚信指数:<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=grade.jsp topmargin=0 width=65 height=13></iframe>
<br>
<br>
<A href=mysj.jsp  target="_blank">今日共有<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=how.jsp topmargin=0 width=40 height=13></iframe>条符合您的商机</a>&nbsp;&nbsp;<a href=dingzhisj.jsp><<马上定制</a>

<form action="visiter.jsp" method="post" name="form" id="form">

<div align=left>

<select name="sound"><%if  (Integer.parseInt((String)rs.getString("sound"))==1){%><option value="1" selected>声音已开</option><option value="0">声音关闭</option><%}else{%><option value="0" selected>声音已关</option><option value="1">声音开启</option><%}%></select>
<select name=css><option value="1" selected>敬业秘书</option><option value="2">清纯秘书</option><option value="3">可爱秘书</option><option value="4">细心秘书</option></select>
<INPUT type=image src="images/update_040210.gif"  align=middle border=0 name=I6></div>

</form>
</TD>
<SCRIPT src="images/func.js"></SCRIPT>
<td width=124 background=images/liuliang.jpg valign=bottom><br>悄悄话:把上图加到您的网站上可以增加诚信指数哦,马上获取<INPUT style="left: auto;clip:  rect(auto 1px auto auto);border: 1 double #666666;" onclick="turnit('code_area770')" type=button value=代码></td>


<TR id=code_area770 style="DISPLAY: none">
<TD align=middle colSpan=8>
<TEXTAREA onmouseover=this.select() rows=2 cols=60>&lt;script src="<%=WebUrl%>/in.js"&gt;&lt;/script&gt;
&lt;script>showImg("<%=(String) session.getAttribute("loginname")%>")&lt;/script&gt;
</TEXTAREA> 
</TD></TR>




</TR></TBODY></TABLE></TD>
                <TD width=2 bgColor=#ffc75c><IMG height=1 
                  src="images/shim.gif" width=2></TD></TR>
              <TR>
                <TD colSpan=3><IMG height=13 src="images/tj_2.gif" 
                  width=478></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><BR>



<form action="../sj/search.jsp" method="post" name="form" id="form" target="_blank">
<TABLE cellSpacing=0 cellPadding=0 width=570 border=0 align=center>
        <TBODY>
        <TR>
          <TD class="smallleftpad c" 
          style="BORDER-TOP: #ffa55b 2px solid; PADDING-LEFT: 10px; BORDER-BOTTOM: #ff4e00 2px solid" 
          align=right bgColor=#ff7300 height=32><FONT class=M 
            color=#ffffff><INPUT size=13 name=key id=key value="供求信息关键字" onfocus="if(value =='供求信息关键字'){value =''}" onblur="if (value ==''){value='供求信息关键字'}" >&nbsp;&nbsp;&nbsp;&nbsp;<select name="lei" id="lei">                           
<option value="0" selected>所有信息</option>
<option value="1">供应信息</option>
<option value="2">求购信息</option>
<option value="3">代理信息</option>
<option value="4">合作信息</option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;
<INPUT type=image src="../images/index_sous.gif"  align=middle border=0 name=I6>&nbsp;&nbsp;
<a href="../let" target="_blank"><font color=ffffff>加盟地方分站,年薪三十万轻松赚</font></a>&nbsp;
 
 
</TD>
  </TR></TBODY></TABLE>
</form>




      <TABLE cellSpacing=0 cellPadding=0 width=570 border=0>
        <TBODY>
        <TR>
          <TD background=images/bodybg.gif colSpan=3 height=22>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width="3%"><IMG height=22 
                  src="images/bodyleft.gif" width=10></TD>
                <TD class=index_title width="64%">快速通道 <IMG height=4 
                  src="images/point2.gif" width=7 align=absMiddle></TD>
                <TD align=right width="33%"><IMG height=22 
                  src="images/bodyright.gif" 
            width=10></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD width=1 bgColor=#8abaff><IMG height=1 
            src="images/shim.gif" width=1></TD>
          <TD align=middle width=568><BR>
            <TABLE cellSpacing=0 cellPadding=2 width="94%" border=0>
              <TBODY>
              <TR>
                <TD class="C lh15"><IMG height=13 
                  src="images/star.gif" width=14 align=absMiddle> <A 
                  href="dingzhisj.jsp"><STRONG>定制商机</STRONG></A> 
                  - 定制属于您行业的商机,  <BR>　　　　　　　&nbsp;让你第一时间掌握最新的商机,万无一失<IMG height=9 src="images/indexpoint.gif" 
                  width=5><A href="dingzhisj.jsp">立即定制</A></TD></TR></TBODY></TABLE><BR><IMG 
            height=1 src="images/index_line.gif" width=520><BR><BR>
            <TABLE cellSpacing=0 cellPadding=2 width="94%" border=0>
              <TBODY>
              <TR>
                <TD class="C lh15"><IMG height=13 
                  src="images/star.gif" width=14 align=absMiddle> <A 
                  href="glbook.jsp" 
                  target=_balnk><STRONG>我的文集</STRONG></A> - 发布你的话题可以让诚信指数上升哦! <IMG 
                  height=9 src="images/indexpoint.gif" width=5> <A 
                  href="../book/addbook.jsp">立即发布</A> 
                  <BR>　　　　　　　  <FONT color=#ff6600>好的文章，会成为</FONT><A 
                  href="../zixun" 
                  target=_blank>行业资讯</A>的精华哦！ </TD></TR></TBODY></TABLE><BR><IMG 
            height=1 src="images/index_line.gif" width=520><BR><BR>
            <TABLE cellSpacing=0 cellPadding=2 width="94%" border=0>
              <TBODY>
              <TR>
                <TD class="C lh15"><IMG height=13 
                  src="images/star.gif" width=14 align=absMiddle> <A 
                  href="../union/add2.jsp"><STRONG>网站登录</STRONG></A> 
                  - 免费推广您的网站，请 <IMG height=9 
                  src="images/indexpoint.gif" width=5> <A 
                  href="../union/add2.jsp">马上登录</A> 
                  <BR>　　　　　　　&nbsp;详细的网站介绍能为您带来更多的流量! 
            </TD></TR></TBODY></TABLE>
         </TD>
          <TD width=1 bgColor=#8abaff><IMG height=1 
            src="images/shim.gif" width=1></TD></TR>
        <TR bgColor=#8abaff>
          <TD colSpan=3 height=1><IMG height=1 src="images/shim.gif" 
            width=1></TD></TR></TBODY></TABLE><BR>
      <TABLE cellSpacing=0 cellPadding=0 width=570 border=0>
        <TBODY>
        <TR>
          <TD background=images/bodybg.gif colSpan=3 height=22>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width="3%"><IMG height=22 
                  src="images/bodyleft.gif" width=10></TD>
                <TD class=index_title width="64%">高级服务 <IMG height=4 
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
                <TD class=C align=middle colSpan=2><A 
                  href="../qifotong.jsp" 
                  target=_blank><IMG height=26 src="images/applytp.gif" 
                  width=107 align=absMiddle border=0></A> 让您的成交机会提高<FONT 
                  color=#ff6600><B>7</B></FONT>倍！&nbsp;&nbsp;&nbsp;诚信指数：<FONT 
                  color=#ff6600><B>100%</B></FONT> 
                  <DIV align=right><IMG src="images/indexpoint.gif"> <A 
                  href="../qifotong.jsp" 
                  target=_blank>了解企富通服务</A></DIV></TD></TR></TBODY></TABLE><BR><IMG 
            height=1 src="images/index_line.gif" width=520><BR><BR>
            <TABLE cellSpacing=2 cellPadding=2 width="94%" border=0>
              <TBODY>
              <TR>
                <TD align=center><img src=../images/cs_lm1_1.gif></TD></TR>
              </TBODY></TABLE><BR><IMG 
            height=1 src="images/index_line.gif" width=520><BR><BR>
            <TABLE cellSpacing=2 cellPadding=2 width="94%" border=0>
              <TBODY>
              <TR>
                <TD class=C width="47%">·<A 
                  href="gradeindex.jsp" 
                  target=_blank>如何更快地提高我的诚信指数？ </A></TD>
                <TD class=C>·<A 
                  href="gradeindex.jsp" 
                  target=_blank>为何我的诚信指数总是不变？ </A></TD></TR></TBODY></TABLE><BR></TD>
          <TD width=1 bgColor=#8abaff><IMG height=1 
            src="images/shim.gif" width=1></TD></TR>
        <TR bgColor=#8abaff>
          <TD colSpan=3 height=1><IMG height=1 src="images/shim.gif" 
            width=1></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><IMG 
height=10 src="images/bottom.gif" width=778><BR>

<%@ include file="end.jsp"%>
</BODY></HTML>
