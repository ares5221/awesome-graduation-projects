<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.EmployeeForm"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>措滹人力资源管理系统--部门管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<script language="JavaScript">
function deleteForm(date){
if(confirm("确定要删除此部门信息吗？")){
window.location.href="department.do?method=deleteDepartment&id="+date;
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
          <td valign="top">
		  <table width="494">
            <tr>
              <td width="45" height="25">&nbsp;</td>
              <td width="437" valign="bottom"><font color="#66583D"><b>部门管理&nbsp;</b></font>&gt; <font color="#FF0000"> 部门查询</font></td>
            </tr>
          </table>
		  </td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">
        <%
        if(pagination.getRecordSize()>0){
        %>
         <table width="650" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr align="center">
              <th width="46" height="20"><span class="word_white">序号</span></th>
              <th width="109"><span class="word_white">部门名称</span></th>
              <th width="138"><span class="word_white">创建时间</span></th>
			  <th width="138"><span class="word_white">部门人数</span></th>
              <th width="203"><span class="word_white">备注</span></th>
              <th width="88"><span class="word_white">操作</span></th>
            </tr>
        <logic:iterate id="departmentForm" collection="<%=list%>"  indexId="number">
           <bean:define id="id" name="departmentForm" property="id"/>
           <%
           int employeeNumber=0;
           List employeeList=(List)request.getAttribute("employeeList");
           for(int i=0;i<employeeList.size();i++){
              EmployeeForm employeeForm=(EmployeeForm)employeeList.get(i);
              if(employeeForm.getEm_departmentId().equals(id))
              employeeNumber++;
           }                  
           %>                       
            <tr align="center" bgcolor="#FFFFFF">           
              <td height="20"><bean:write name="departmentForm" property="id"/></td>
              <td><bean:write name="departmentForm" property="dt_name"/></td>              
              <td><bean:write name="departmentForm" property="dt_createTime"/></td>
              <td><%=employeeNumber%></td>
			  <td><bean:write name="departmentForm" property="dt_bz"/></td>
              <td><a href="javascript:deleteForm('<%=id%>')">删除</a></td>
            </tr>
         </logic:iterate>
          </table>
           <table width="650">
             <tr>
               <td>  <div align="right"><%=pagination.printCtrl(Page,"method=queryDepartment")%></div></td>
             </tr>
           </table>         
         <%}%>
         
         
            <table width="650">
              <tr align="right">
                <td><a href="department_insert.jsp">添加部门</a></td>
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
