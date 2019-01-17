<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu" %>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
请稍候正在生成网站首页.....
<c:set value="${aqu:writeIndex()}" var="check"/>
<c:if test="${check=='ok'}">
	<br>生成网站首页成功!
</c:if>
<c:if test="${check=='error'}">
	<br>在生成网站首页的时候发生错误，请您稍候重试!
</c:if>
