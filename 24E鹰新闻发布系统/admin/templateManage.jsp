
<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/aqu" prefix="aqu"%>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0068)http://127.0.0.1/admin/Admin_Template.asp?ChannelID=1&TemplateType=3 -->
<HTML>
<HEAD>

<TITLE>文章中心管理----模板管理</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK 
href="file:///C|/abc/%B6%AF%D2%D7%CD%F8%C2%E7--%BA%F3%CC%A8%B9%DC%C0%ED.files/Admin_Template.files/Admin_Style.css" type=text/css rel=stylesheet>
<STYLE title="" type=text/css>INPUT {
	BORDER-RIGHT: #666666 1px solid; BORDER-TOP: #666666 1px solid; FONT-SIZE: 9pt; BORDER-LEFT: #666666 1px solid; COLOR: #666666; BORDER-BOTTOM: #666666 1px solid; HEIGHT: 18px; BACKGROUND-COLOR: #ffffff
}
SELECT {
	FONT-SIZE: 9pt; HEIGHT: 20px
}
.y1 {
	FILTER: shadow(color=#cccccc,direction=135,Strength:10)
}
.y2 {
	FILTER: dropshadow(color=#cccccc,offx=5,offy=5)
}
.y3 {
	FILTER: Glow(Color:#D83303, Strength:10)
}
.y4 {
	FILTER: blur(strength=10,direction=135)
}
</STYLE>
<META content="MSHTML 6.00.2800.1515" name=GENERATOR>
</HEAD>
<BODY leftMargin=2 topMargin=0 marginheight="0" marginwidth="0">

<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center 
border=0>
  <TBODY>
    <TR class=topbg> 
      <TD align=middle colSpan=3 height=22><STRONG>文章中心管理----模板管理</STRONG></TD>
    </TR>
    <TR class=tdbg> 
      <TD width=70 height=30><STRONG>管理导航：</STRONG></TD>
      <TD><A 
      href="/templateManage.jsp">模板管理首页</A> | <A 
      href="/addTemplate.jsp">添加模板</A> |</TD>
    </TR>
  </TBODY>
</TABLE>
<BR>
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center 
border=0>
  <TBODY>
    <TR class=title> 
      <TD>${aqu:getAllType()}
    <TR class=title> 
      <TD>&nbsp;</TD>
    </TR>
  </TBODY>
</TABLE>
<FORM name=form1 action=file:///C|/abc/%B6%AF%D2%D7%CD%F8%C2%E7--%BA%F3%CC%A8%B9%DC%C0%ED.files/Admin_Template.asp method=post>
  <TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center 
border=0>
    <TBODY>
      <TR class=title height=22> 
        <TD align=middle width=30><STRONG>ID</STRONG></TD>
        <TD align=middle width=150><B>模板类型</B></TD>
        <TD align=middle height=22><STRONG>模板名称</STRONG></TD>
        <TD align=middle width=100><STRONG>默认模板</STRONG></TD>
        <TD align=middle width=200><STRONG>操作</STRONG></TD>
      </TR>
	  <c:if test="${param.id==null}">
	      ${aqu:getManage('0')}
	  </c:if>
	  <c:if test="${param.id!=null}">
	      ${aqu:getManage(param.id)}
	  </c:if>
    </TBODY>
  </TABLE>
  <BR>
  <DIV align=center>
    <INPUT onclick="window.location.href='addTemplate.jsp'" type=button value=添加内容页模板 name=buttonm>
  </DIV>
  <!-- Powered by: PowerEasy 2005 -->
</FORM>
</BODY>
</HTML>
