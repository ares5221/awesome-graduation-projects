<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu" %>
<jsp:useBean id="sort" class="com.v246.NoLevelSort" scope="page"/>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>文章中心管理----栏目管理</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="/css/Admin_Style.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1522" name=GENERATOR></HEAD>
<BODY leftMargin=2 topMargin=0 marginheight="0" marginwidth="0">
<TABLE class=border cellSpacing=1 cellPadding=2 width="100%" align=center 
border=0>
  <TBODY>
  <TR class=topbg>
    <TD align=middle colSpan=2 height=22><STRONG>文章中心管理----栏目管理</STRONG></TD></TR>
  <TR class=tdbg>
    <TD width=70 height=30><STRONG>管理导航：</STRONG></TD>
      <TD height=30><A 
      href="addTemplate.jsp">添加文章栏目</A>&nbsp;|</TD>
    </TR></TBODY></TABLE><BR>
<TABLE class=border cellSpacing=1 cellPadding=0 width="100%" align=center 
border=0>
  <TBODY>
    <TR class=title height=22> 
      <TD align=middle width=30><STRONG>ID</STRONG></TD>
      <TD align=middle><STRONG>栏目名称</STRONG></TD>
      <TD align=middle width=60><STRONG>栏目权限</STRONG></TD>
      <TD align=middle width=100><STRONG>栏目属性</STRONG></TD>
      <TD align=middle width=380><STRONG>操作选项</STRONG></TD>
    </TR>
	<c:forEach var="noLevelSort" items="${sort.coll}">
    <TR class=tdbg onmouseover="this.style.backgroundColor='#BFDFFF'" 
  onmouseout="this.style.backgroundColor=''"> 
      <TD align=middle width=30><c:out value="${noLevelSort.id}"/></TD>
      <TD><B><c:out value="${noLevelSort.title}"/></B></TD>
      <TD align=middle width=60>&nbsp;</TD>
      <TD align=left width=100>&nbsp;</TD>
      <TD align=left width=380>&nbsp;<A onClick="return ConfirmDel2()"href="MDDClass.jsp?id=${noLevelSort.id}">删除</A></TD>
    </TR>
	</c:forEach>
  </TBODY>
</TABLE>
<TABLE width="100%">
  <TBODY>
  <TR>
    <FORM name=form1 action=/admin/Admin_Class.asp method=post>
    <TD align=middle><INPUT id=Action type=hidden value=CreateJS 
      name=Action><INPUT id=ChannelID type=hidden value=1 name=ChannelID><INPUT style="CURSOR: hand" type=submit value=刷新栏目JS name=submit></TD></FORM></TR></TBODY></TABLE>
<SCRIPT language=JavaScript type=text/JavaScript>
function ConfirmDel1(){
   alert('此栏目下还有子栏目，必须先删除下属子栏目后才能删除此栏目！');
   return false;}
function ConfirmDel2(){
   if(confirm('删除栏目操作将删除此栏目中的所有子栏目和文章，并且不能恢复！确定要删除此栏目吗？'))
     return true;
   else
     return false;}
function ConfirmDel3(){
   if(confirm('清空栏目将把栏目（包括子栏目）的所有文章放入回收站中！确定要清空此栏目吗？'))
     return true;
   else
     return false;}
</SCRIPT>
<BR>
<TABLE width="100%">
  <TBODY>
  <TR>
    <TD colSpan=5><B>栏目属性中各项的含义：</B></TD></TR>
  <TR>
    <TD>原----在原窗口打开</TD>
    <TD>新----在新窗口打开</TD>
    <TD>首----在首页分类列表处显示，只对一级栏目有效</TD></TR>
  <TR>
    <TD>列----在父栏目分类列表处显示</TD>
    <TD>锁----有子栏目时不允许添加文章</TD>
    <TD>开----有子栏目时可以添加文章</TD></TR>
  <TR>
    <TD>保----启用防复制/下载功能</TD></TR></TBODY></TABLE><!-- Powered by: PowerEasy 2005 --></BODY></HTML>
