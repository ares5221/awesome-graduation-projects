<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%--注意这里jstl1.0不代jsp,1.1必须得代,否则不能使用表达示语言--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page contentType="text/html;charset=gb2312" language="java" import="java.math.*"%>

<html>
<body>
<c:set value="abcdefgd444" var="ab"/> <!--不带标签体的变量定义并付值-->
<c:out value="${ab}"/>
</body>
</html>