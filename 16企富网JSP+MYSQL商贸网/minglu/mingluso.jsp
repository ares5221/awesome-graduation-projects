<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="../top.jsp"%>
<%@ include file="../conn/conn.jsp"%>













<TABLE cellSpacing=0 cellPadding=0 width="750" align=center border=0>
        <TBODY>
        <TR>
          <TD><embed src="../images/kk.swf" quality=high 
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
type="application/x-shockwave-flash" width=750 height=100></embed></TD></TR>
</TBODY></TABLE>





<TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
  <TBODY>
 
  <TR>
    <TD style="PADDING-LEFT: 20px" bgColor=#ff8000 colSpan=2 height=28><IMG 
      height=8 src="../images/ico_oval.gif" width=5 align=absMiddle> <FONT 
      color=#ffffff size=4><b>企业大全</b></FONT></TD></TR>
  <TR>
    <TD bgColor=#b25900 colSpan=2 height=2></TD></TR></TBODY></TABLE>






<TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
  <TBODY>
  <TR>
    <TD width=1><IMG height=72 src="images/back1.gif" width=1> 
    </TD>
    <TD vAlign=top width=750 background=images/lian.gif>
      <TABLE cellSpacing=0 cellPadding=0 width=750 border=0>
        <TBODY>
        <TR>
          <TD height=41>





<TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
  <TBODY>
 
<FORM name=searchform action=mingluso.jsp method=get>
 <TBODY>
<TR>
<TD width=170>
<DIV align=center><IMG height=36 src="images/search.jpg" width=88></DIV></TD>
<TD width=128><INPUT class=bb size=15 name=gjz> </TD><TD width=90>
<SELECT name=sf> 
<OPTION selected value="">==所有区域==</OPTION> 
<OPTION value=河南>河南</OPTION> 
<OPTION value=安徽>安徽</OPTION> 
<OPTION value=北京>北京</OPTION> 
<OPTION 
value=重庆>重庆</OPTION> <OPTION value=福建>福建</OPTION> 
<OPTION value=甘肃>甘肃</OPTION> 
<OPTION 
value=广东>广东</OPTION> <OPTION value=广西>广西</OPTION> 
<OPTION value=贵州>贵州</OPTION> 
<OPTION 
value=海南>海南</OPTION> <OPTION value=河北>河北</OPTION> 
<OPTION value=黑龙江>黑龙江</OPTION> 
<OPTION 
value=浙江>浙江</OPTION> <OPTION value=湖北>湖北</OPTION> 
<OPTION value=湖南>湖南</OPTION> 
<OPTION 
value=内蒙古>内蒙古</OPTION> <OPTION value=江苏>江苏</OPTION> 
<OPTION value=江西>江西</OPTION> 
<OPTION 
value=吉林>吉林</OPTION> <OPTION value=辽宁>辽宁</OPTION> 
<OPTION value=宁夏>宁夏</OPTION> 
<OPTION 
value=青海>青海</OPTION> <OPTION value=山西>山西</OPTION> 
<OPTION value=陕西>陕西</OPTION> 
<OPTION 
value=山东>山东</OPTION> <OPTION value=上海>上海</OPTION> 
<OPTION value=四川>四川</OPTION> 
<OPTION 
value=天津>天津</OPTION> <OPTION value=西藏>西藏</OPTION> 
<OPTION value=新疆>新疆</OPTION> 
<OPTION 
value=云南>云南</OPTION> 
<OPTION value=香港>香港</OPTION> 
<OPTION 
value=澳门>澳门</OPTION> <OPTION value=台湾>台湾</OPTION> 
</SELECT>


</TD>
<TD width=67><INPUT class=b2b7 type=submit value="搜 索" name=submit> 
</TD>
<TD vAlign=center width=322>

<TABLE height=30 cellSpacing=0 width=300 align=center 
background=biztop.files/lian1.gif border=0>
  <TBODY>
  <TR>
    <TD><FONT color=#ffffff>热门搜索: </FONT><A class=b2b3 
      href="mingluso.jsp?gjz=服饰&sf=" 
      ><FONT color=#ffffff>服饰</FONT></A> <A class=b2b3 
      href="mingluso.jsp?gjz=电子&sf=" 
      ><FONT color=#ffffff>电子</FONT></A> <A class=b2b3 
      href="mingluso.jsp?gjz=软件&sf=" 
      ><FONT color=#ffffff>软件</FONT></A> <A class=b2b3 
      href="mingluso.jsp?gjz=无线电&sf=" 
      ><FONT color=#ffffff>无线电</FONT></A> <A class=b2b3 
      href="mingluso.jsp?gjz=照明&sf=" 
      ><FONT color=#ffffff>照明</FONT></A> <A class=b2b3 
      href="mingluso.jsp?gjz=玻璃&sf=" 
      ><FONT color=#ffffff>玻璃</FONT></A>
</TD></TR></TBODY></TABLE>

</TD></TR></FORM></TBODY></TABLE>




</TD></TR></FORM></TBODY></TABLE>


</TD></TR></FORM></TBODY></TABLE>













<TABLE class=table-zuoyou cellSpacing=1 cellPadding=0 width=750 align=center 
bgColor=#efefef>
  <TBODY>
  <TR vAlign=center height=30>
    <TD align=middle width=200><FONT color=#ff3300>企业名称</FONT></TD>
    <TD align=middle width=450><FONT color=#ff3300>企业简介</FONT></TD>
    <TD align=middle width=100><FONT color=#ff3300>企业站点</FONT></TD></TR>



<%String gjz=request.getParameter("gjz");
   if(gjz==null)gjz = "";
%>

<%String sf=request.getParameter("sf");%>




<%
stmt = con.createStatement() ;
rs=stmt.executeQuery("SELECT * from qyml where qymc like '%"+gjz+"%' and qyjj like '%"+sf+"%' order by id desc");
String pages = request.getParameter("page") ;
int pageInt =  1 ,i=0 ,k=1;
if(pages==null){}else{pageInt = Integer.parseInt(pages);}
while(i<20*(pageInt-1)&&rs.next()){i++ ;}
i=0;
while(rs.next()&i<20){
i++ ;
%>








  <TR>
    <TD bgColor=#cccccc colSpan=3 height=1></TD>
  <TR vAlign=center bgColor=#fffdf7 height=120>
    <TD align=middle width=200 valgin="middle"><a target="_blank" href="../web/index.jsp?id=<%=rs.getString("id")%>"><font color=red><%=rs.getString("qymc")%></font></a><br><br>诚信指数：<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=../info/memgrade.jsp?memid=<%=rs.getString("id")%> topmargin=0 width=65 height=15></iframe><BR><BR></TD>
    <TD align=middle width=450 valgin="top">
      <TABLE width=400>
        <TBODY>
        <TR>
          <TD><IMG height=11 src="../images/ring01.gif" width=11><%=rs.getString("qyjj")%>
            ...</TD></TR></TBODY></TABLE></TD>
    <TD align=middle width=100 valgin="middle"><a style="text-decoration: none" target="_blank" href="../web/index.jsp?id=<%=rs.getString("id")%>">>>>点击进入>>></a><BR><BR></TD></TR>
 





<%
}
%>




<%
rs=stmt.executeQuery("SELECT count(*)  from qyml  where qymc like '%"+gjz+"%' and qyjj like  '%"+sf+"%' ");
while(rs.next()) i = rs.getInt(1) ;
%>









<table border=0 width=750 cellspacing=3 bgcolor=#F2F2F2 cellpadding=2 align=center><tr height=15><td align=left>共找到<font color=ff6600><b><%=i%></b></font>条信息&nbsp;当前为第<font color=ff6600><b><%=pageInt%></b></font>页&nbsp;共到<font color=ff6600><b><%=(i+20)/20%></b></font>页</TD><td align=right>转到第<%for(int j=1;j<(i+40)/20;j++){%>&nbsp;<a href="mingluso.jsp?page=<%=j%>&gjz=<%=gjz%>&sf=<%=sf%>"><font color=red><%=j%></font></a>&nbsp;<%}%>页</td><td>






  <TR>
    <TD colSpan=3>
      <TABLE height=30 cellSpacing=0 cellPadding=0 width="98%" align=center>
        <TBODY>
        <TR>
          <TD vAlign=center align=middle></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>




<%@ include file="../end.jsp"%>