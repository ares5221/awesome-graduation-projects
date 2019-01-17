<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="type" scope="page" class="com.v246.GetTemplateType"/>
<html>
<body>
<c:set var="a" value="ttttttttttttt"/>
<c:out value="${a}"/>
<select name="templateType" id="templateType" >
		  <c:forEach var="templateType" items="${type.coll}">
            <option value="<c:out value="${templateType.id}"/>"><c:out value="${templateType.type}"/></option>
            <option value="0" selected>请选择模板类型</option>
			</c:forEach>
          </select>
</body>
</html>