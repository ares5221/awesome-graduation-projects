<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu"%>
<html>
<body>
	<c:set value="${aqu:getTest()}" var="aqu"/>
	${aqu[2]}
</body>
</html>