<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu"%>
<jsp:useBean id="type" scope="page" class="com.v246.GetTemplateType"/>
<html>
<body>
${aqu:initArticleManage('article')}
${aqu:setPageSize(20)}
总页数：${aqu:getPageCount()}<br>
总记录数：${aqu:getRowsCount()}<br>
${aqu:gotoPage('3')}
<c:forEach var="aqu" begin="0" end="20">
	<c:if test="${aqu:next()}">
		${aqu:getString('Title')}
	</c:if>
</c:forEach>
当前页:${aqu:getCurPage()}
</body>
</html>
