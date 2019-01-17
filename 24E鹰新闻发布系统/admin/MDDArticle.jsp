<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu"%>
<html>
</body> <c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/> <c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}"> 
<c:redirect url="${url}"/> </c:if> <c:url value="${aqu:getUrl()}/admin/articleManage.jsp" var="aqu"/> 
<c:choose> 
	<c:when test="${param.action=='del'}">  
		${aqu:deleteArticle(param.id)} 
		<c:redirect url="${aqu}"/>
	 </c:when>
	 <c:when test="${param.action=='writeOne'}">
	 	${aqu:writeOne(param.id)}
		成功生成
	</c:when>
	<c:when test="${param.action=='writeAll'}">
		${aqu:writeAll()}
		生成所有文章成功！
	</c:when>
</c:choose> 
</body>
</html>