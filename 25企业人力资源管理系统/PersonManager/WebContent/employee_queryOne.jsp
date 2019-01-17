<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.DepartmentForm"/>
<jsp:directive.page import="com.wy.form.EmployeeForm"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>措滹人力资源管理系统--员工管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>

          <%
            EmployeeForm employeeForm=(EmployeeForm)request.getAttribute("employeeForm");
            String departmentName=null;
            List list=(List)request.getAttribute("departmentList");
            for(int i=0;i<list.size();i++){
            DepartmentForm departmentForm=(DepartmentForm)list.get(i);
            if(employeeForm.getEm_departmentId().equals(departmentForm.getId()))
            departmentName=departmentForm.getDt_name();
              
            }%>


<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    
      <jsp:include page="top.jsp" flush="true" />   
	  
	     <table width="801" height="48" border="0" cellpadding="0" cellspacing="0" background="images/center1.jpg">
        <tr>
          <td valign="top">		  <table width="494">
            <tr>
              <td width="45" height="25">&nbsp;</td>
              <td width="437" valign="bottom"><font color="#66583D"><b>员工管理&nbsp;</b></font>&gt; <font color="#FF0000"> 员工详细查询</font></td>
            </tr>
          </table></td>
        </tr>
      </table>

      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">		      

		  <table border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr>
              <th width="75" height="25">编号：</th>
              <td width="200" bgcolor="#FFFFFF">${requestScope.employeeForm.em_serialNumber}</td>
              <th width="75">姓名：</th>
              <td width="200" bgcolor="#FFFFFF">${requestScope.employeeForm.em_name}</td>
            </tr>
            <tr>
              <th height="25">年龄：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_age}</td>
              <th>性别：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_sex}</td>
            </tr>
            <tr>
              <th height="25">出生日期：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_born}</td>
              <th>身份证号：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_IDCard}</td>
            </tr>
            <tr>
              <th height="25">民族：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_nation}</td>
              <th>婚姻状况：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_marriage}</td>
            </tr>
            <tr>
              <th height="25">政治面貌：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_visage}</td>
              <th>籍贯：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_ancestralHome}</td>
            </tr>
            <tr>
              <th height="25">联系电话：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_tel}</td>
              <th>家庭住址：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_address}</td>
            </tr>
            <tr>
              <th height="25">毕业学校：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_afterschool}</td>
              <th>专业：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_speciality}</td>
            </tr>
            <tr>
              <th height="25">文化程度：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_culture}</td>
              <th>上岗时间：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_startime}</td>
            </tr>
            <tr>
              <th height="25">部门名称：</th>
              <td bgcolor="#FFFFFF"><%=departmentName %></td>             
              <th>部门工种：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_typework}</td>
            </tr>
            <tr>
              <th height="25">登记人名：</th>
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_creatime}</td>
              <th>登记时间：</th>                                                              
              <td bgcolor="#FFFFFF">${requestScope.employeeForm.em_creatime}</td>
            </tr>
			<tr>
              <th height="107">备注信息：</th>
              <td colspan="3" bgcolor="#FFFFFF">${requestScope.employeeForm.em_bz}</td>
              </tr>
          </table>
           <br>
    
         <html:button property="back" value="返回" onclick="javascript:history.go(-1);"></html:button>

     
     
          </td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>
</body>
</html:html>
