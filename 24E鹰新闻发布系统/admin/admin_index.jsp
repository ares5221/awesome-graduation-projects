<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu" %>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Frameset//EN">
<!-- saved from url=(0038)http://127.0.0.1/admin/Admin_Index.asp -->
<HTML><HEAD><TITLE>E鹰文章管理系统--后台管理</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2800.1505" name=GENERATOR></HEAD><FRAMESET id=frame 
border=false frameSpacing=0 rows=* frameBorder=1 cols=181,* 
scrolling="yes"><FRAME name=left marginWidth=0 marginHeight=0 
src="Admin_Index_Left.jsp"><FRAME name=main 
src="index.jsp"></FRAMESET><noframes></noframes></HTML>
