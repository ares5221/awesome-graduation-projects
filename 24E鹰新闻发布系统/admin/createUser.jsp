<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/struts-logic" prefix="logic" %>
<%@ taglib uri="/struts-bean" prefix="bean" %>
<%@ taglib uri="/struts-html" prefix="html" %>
<html:html locale="true">
<html>
<title>

</title>
</head>
<body>
<html:errors/>
<h2>ddd</h2>
<html:form action="createUser" method="get"> 
	userName:<input type="text" name="userName"><br/>
	password:<input type="text" name="passwords"><br/>
	<input type="submit" name="submit">
</html:form>
</body>
</html:html>