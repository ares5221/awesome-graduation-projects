<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>措滹人力资源管理系统--系统管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<script language="JavaScript">
function deleteForm(date){
if(confirm("确定要删除此管理员吗？")){
window.location.href="manager.do?method=deleteManager&id="+date;
}
}
</script>
<jsp:useBean id="pagination" class="com.wy.tool.MyPagination" scope="session"></jsp:useBean>
<%
String str=request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=(List)request.getAttribute("list");
	int pagesize=15;      //指定每页显示的记录数
	System.out.println("list="+list);
	list=pagination.getInitPage(list,Page,pagesize);     //初始化分页信息
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //获取指定页的数据
}
%>
<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    
      <jsp:include page="top.jsp" flush="true" />   
	  
	     <table width="801" height="48" border="0" cellpadding="0" cellspacing="0" background="images/center1.jpg">
        <tr>
          <td valign="top"><table width="494">
            <tr>
              <td width="45" height="25">&nbsp;</td>
              <td width="437" valign="bottom"><font color="#66583D"><b>系统管理&nbsp;</b></font>&gt; <font color="#FF0000"> 用户查询</font></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">
     <%
     if(pagination.getRecordSize()>0){
     %>
          <table width="400" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr align="center">
              <th height="20"><span class="word_white">序号</span></th>
              <th><span class="word_white">账号</span></th>
              <th><span class="word_white">操作</span></th>
            </tr>
        <logic:iterate id="managerForm" collection="<%=list%>"  indexId="number">
           <bean:define id="userid" name="managerForm" property="id"/>
            <tr align="center" bgcolor="#FFFFFF">           
              <td height="20"><bean:write name="managerForm" property="id"/></td>
              <td><bean:write name="managerForm" property="account"/></td>
              
              <td><a href="javascript:deleteForm('<%=userid%>')">删除</a></td>
            </tr>
         </logic:iterate>
          </table>
           <%=pagination.printCtrl(Page,"method=queryManager")%>
           <%}%>
            <table width="381">
              <tr align="right">
                <td><a href="manager_insert.jsp">添加管理员</a></td>
              </tr>
          </table></td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>
</body>
</html:html>
