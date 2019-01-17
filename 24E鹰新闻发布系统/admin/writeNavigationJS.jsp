<%@ page contentType="text/html;charset=gb2312" import="com.v246.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu" %>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
<%
	ArticleNavigation navigation=new ArticleNavigation();
	navigation.write(); 
%>
生成导航JSA文件成功！
