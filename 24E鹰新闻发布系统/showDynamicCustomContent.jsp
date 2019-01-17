<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu" %>
<c:if test="${param.id==null}">
	<b>欢迎使用E鹰文章管理系统，网址：<a href='http://www.v246.com'>http://www.v246.com</a></b>
</c:if>
<c:if test="${param.id!=null}">
var out;
out="${aqu:getContent(param.id)}";
document.write(out);
</c:if>