<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu" %>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
<c:if test="${param.id==null}">
	英雄，我说，我什么都告诉你，其实这个程序是www.v246.com的古刹飞鹰做的，你去黑它去吧，别黑我啊！
</c:if>
<c:if test="${param.id!=null&&param.id>0}">
	${aqu:deleteClass(param.id)}
	<c:set value="${aqu:getUrl()}/admin/classManage.jsp" var="url"/>
	<c:redirect url="${url}"/>
</c:if>

