<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<HTML>
<TITLE><%=webname%>----让天下的商人富起来!</TITLE>
<HEAD>
<link href="../conn/laba.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY leftMargin=0 marginwidth="0"  topMargin=0 background=../images/c_cnco_bj.gif align=center>

<TABLE cellSpacing=0 cellPadding=0 width=750 border=0 background="../images/v6_top_bg.gif" align=center>
  <TBODY>
  <TR>
    <TD width=270 rowSpan=2><A  href="../"   target="_parent"><IMG  
      src="../images/logo.gif" border=0></A></TD>
    <TD class=s align=right width=480>
<IMG height=10 src="../images/v6_header_spirits.gif" ><br>

<img src=../images/TriTanium17.jpg><a href=../  target="_parent">首  页</a><SPAN 
      class=gray> | </SPAN>
<IMG height=17 alt=诚信通服务 
      src="../images/icon_trustpass_logo_min.gif"  align=absMiddle 
      border=0><A href="../qifotong.jsp"  target="_parent">企富通服务</A><SPAN 
      class=gray><SPAN class=gray> 
      | </SPAN><IMG height=16 alt=地区加盟 
      src="../images/cs2.gif" align=absMiddle 
      border=0><A  href="../let"  target="_parent">地区加盟</A>
</TD></TR>
  <TR>
    <TD vAlign=bottom>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 >
        <TBODY>
        <TR><TD class=headborder width=20%><A href="../reg/register.jsp"  target="_parent">注册会员</a></TD>
          
          <TD <%if (request.getParameter("baar")==null){}else{%> class=headonborder<%}%> class=headborder width=20%>
<A href="../sj/come1.jsp?baar=buy" target="_parent"<%if (request.getParameter("baar")==null){}else{%> class=nav <%}%>>我要采购</A></TD>
          <TD <%if (request.getParameter("baae")==null){}else{%> class=headonborder<%}%> class=headborder width=20%>
<A href="../sj/come2.jsp?baae=sale" target="_parent"<%if (request.getParameter("baae")==null){}else{%> class=nav <%}%>>我要销售</A></TD>
         

          <TD class=headborder width=20%><A href="../info/" target="_parent">我的会员助手</A> 
           </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>


<TABLE height=45 cellSpacing=0 cellPadding=0 width=750 background=../images/top_bj001.jpg border=0 align=center>
<TBODY>
<TR>
<TD align=center width=10><IMG height=45 src="../images/top_bj002.jpg" width=3></TD>
<form action="../sj/search.jsp" method="post" name="form" id="form" target="_blank">
<td ><img src=../images/s_1.jpg></td>
<TD align=center><INPUT size=13 name=key id=key value="供求信息关键字" onfocus="if(value =='供求信息关键字'){value =''}" onblur="if (value ==''){value='供求信息关键字'}" ></td>
<TD align=center width=5> </TD>
<td ><select name="lei" id="lei">                           
<option value="0" selected>所有信息</option>        
<option value="1" >供应信息</option>
<option value="2">求购信息</option>
<option value="3">代理信息</option>
<option value="4">合作信息</option>
</select></td>
<TD vAlign=center align=middle><INPUT type=image src="../images/index_sous.gif"  align=middle border=0></td>
<td width=10></td>
<td><font color=cccccc>热门搜索:</font>
 <a href=../sj/search.jsp?key=玻璃&lei=0 target="_blank"><font color=ffffff>玻璃</a>
 <a href=../sj/search.jsp?key=服装&lei=0 target="_blank"><font color=ffffff>服装</a>
 <a href=../sj/search.jsp?key=钢材&lei=0 target="_blank"><font color=ffffff>钢材</a>
 <a href=../sj/search.jsp?key=灯&lei=0 target="_blank"><font color=ffffff>灯</a>
 <a href=../sj/search.jsp?key=电子&lei=0 target="_blank"><font color=ffffff>电子</a>
 <a href=../sj/search.jsp?key=工艺品&lei=0 target="_blank"><font color=ffffff>工艺品</a></td>
<TD align=center width=80><a href=../../searchhelp.jsp target="_blank"><img border=0  src=../images/help.gif width=15 height=15><font color=ffffff> 查找窍门</font></a></TD>
<TD align=center width=10></td>
</form></TR></TBODY></TABLE>




   <TABLE cellSpacing=0 cellPadding=0 width="750" align=center 
      bgColor=#ff7d00 border=0>
        <TBODY>
        <TR>
          <TD bgColor=#cccccc height=6></TD></TR>
        <TR>
          <TD height=30>
            <DIV align=center>
            <TABLE height=30 cellSpacing=0 cellPadding=0 width=750 align=center 
            border=0>
              <TBODY>
              <TR>
                <TD align=middle width=82 height=28><A class=nav 
                  href="../sj/"  target="_parent">商业机会</A></TD>
                <TD width=1 bgColor=#ffffff></TD>
                <TD align=middle width=82><A class=nav 
                  href="../show/"  target="_parent">产品展会</A></TD>
                <TD align=right width=1 bgColor=#ffffff></TD>
                <TD align=middle width=82><A class=nav 
                  href="../minglu/" target="_parent">企业大全</A></TD>
                <TD width=1 bgColor=#ffffff></TD> 
                <TD align=middle width=82><A class=nav 
                  href="../zixun/" target="_parent">行业资讯</A></TD>
                <TD width=1 bgColor=#ffffff></TD>
                <TD align=middle width=82><A class=nav 
                  href="../book/" target="_parent">商人话题</A></TD>
                <TD width=1 bgColor=#ffffff></TD>
                <TD align=middle width=82><A class=nav 
                  href="../job/" target="_parent">招骋专区</A></TD>
                <TD width=1 bgColor=#ffffff></TD>
                <TD align=middle width=82><A class=nav 
                  href="../union/" target="_parent">网站登录</font></A></TD> 
                <TD width=1 bgColor=#ffffff></TD>
                <TD align=middle bgColor=#666666><A class=nav 
                  href="../let/" target="_parent">年薪三十万轻松赚</A></TD></TR></TBODY></TABLE></DIV></TD></TR>
        <TR>
          <TD background=../images/bg_navline.gif 
      height=5></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>