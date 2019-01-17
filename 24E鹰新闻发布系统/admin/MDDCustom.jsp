<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/aqu" prefix="aqu" %>
<c:set value="${aqu:getUrl()}/admin/login.jsp" var="url"/>
<c:if test="${sessionScope.admin==null||sessionScope.admin!='yes'}">
	<c:redirect url="${url}"/>
</c:if>
<jsp:useBean id="sort" class="com.v246.NoLevelSort" scope="page"/>
<html>
<head>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="/css/Admin_Style.css" type=text/css rel=stylesheet>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>自定义标签</title>
</head>
<c:choose>
	<c:when test="${param.id==null||param.action==null}">
		你是谁？
	</c:when>
	<c:when test="${param.action=='del'}">
		${aqu:initMDDCustom()}
		${aqu:deleteCustom(param.id)}
		${aqu:customClose()}
		<c:set value="customManage.jsp" var="url"/>
		<c:redirect url="${url}"/>
		删除成功
	</c:when>
	<c:when test="${param.action=='modify'}">
	${aqu:modifyCustom(param.id)}
	<c:if test="${aqu:customNext()}">
<body>
<form name="form1" method="post" action="./addCustom.do" onSubmit="return aquCheckout()">
  请输入标签名称：<font color="#FF0000"><strong>{$</strong></font> 
  <c:set value="${aqu:getCustomString('LableName')}" var="customName"/>
  <input name="lableName" type="text" id="lableName" value="${aqu:subLable(customName)}">
  <font color="#FF0000"><strong>$}</strong></font> 标签描述：
  <input name="remark" type="text" id="remark" size="45" value="${aqu:getCustomString('remark')}">
  <br>
  请选择栏目： 
  <SELECT name=withClass id="withClass">
  <c:set value="${aqu:getCustomInt('WithClass')}" var="withClassId"/>
  	<c:if test="${withClassId==0}">
    <OPTION value=0 selected>无(不指定即为所有栏目)</OPTION>
	</c:if>
	<c:if test="${withClassId!=0}">
    <OPTION value=0>无(不指定即为所有栏目)</OPTION>
	</c:if>
    <c:forEach var="noLevelSort" items="${sort.coll}">
		<c:set value="${noLevelSort.id}" var="classId"/>
		<c:if test="${withClassId!=classId}">
		<OPTION value=${noLevelSort.id}>${noLevelSort.title}</OPTION>
		</c:if>
		<c:if test="${withClassId==classId}">
		<OPTION value=${noLevelSort.id} selected>${noLevelSort.title}</OPTION>
		</c:if>
    </c:forEach> 
  </SELECT>
  <br>
  <c:if test="${aqu:getCustomBoolean('IsHot')=='1'}">
  <input name="hotOrNews" type="radio" value="hot" checked>
  </c:if>
  <c:if test="${aqu:getCustomBoolean('IsHot')!='1'}">
  <input name="hotOrNews" type="radio" value="hot">
  </c:if>
  热门文章 
  <c:if test="${aqu:getCustomBoolean('IsNew')=='1'}">
  <input type="radio" name="hotOrNews" value="news" checked>
  </c:if>
  <c:if test="${aqu:getCustomBoolean('IsNew')!='1'}">
  <input type="radio" name="hotOrNews" value="news">
  </c:if>
  最新文章<br>
  显示条数： 
  <input name="barNumber" type="text" id="barNumber" value="${aqu:getCustomInt('BarNumber')}" size="5" >
  <br>
  每行显示字数： 
  <input name="letterNumber" type="text" id="letterNumber" value="${aqu:getCustomInt('LetterNumber')}" size="5">
  (<font color="#666666">0表示不限制</font>)<br>
  <input name="isDate" type="checkbox" id="isDate" value="checkbox">
  是否显示更新时间 　 
  <input name="isClick" type="checkbox" id="isClick" value="checkbox">
  是否显示点击数 <br>
  <label>
  <c:if test="${aqu:getCustomBoolean('staticed')=='1'}">
  <input name="staticOrDynamic" type="radio" value="staticed" checked>
  </c:if>
  <c:if test="${aqu:getCustomBoolean('staticed')!='1'}">
  <input name="staticOrDynamic" type="radio" value="staticed">
  </c:if>
  静态显示
  </label>
  <label> <c:if test="${aqu:getCustomBoolean('dynamic')=='1'}"> 
  <input type="radio" name="staticOrDynamic" value="dinamic" checked>
  </c:if> <c:if test="${aqu:getCustomBoolean('dynamic')!='1'}"> 
  <input type="radio" name="staticOrDynamic" value="dinamic">
  </c:if> 动态显示<br>
  <input type="hidden" name="modify" value="modify">
  <input type="hidden" name="id" value="${param.id}">
  <br>
  </label>
  <input type="reset" name="Submit" value="重置">
  <input type="submit" name="Submit2" value="提交">
</form>
<p>&nbsp; </p>
<script language="JavaScript">
	function aquCheckout()
	{
		if(document.form1.barNumber.value=="")
		{
			alert("显示条数不能为空");
			document.form1.barNumber.focus();
			return false;
		}
		if(document.form1.letterNumber.value=="")
		{
			alert("请输入每行显示的字数");
			document.form1.letterNumber.focus();
			return false;
		}
	}
</script>
</body>
		</c:if>
	</c:when>
</c:choose>
</html>
