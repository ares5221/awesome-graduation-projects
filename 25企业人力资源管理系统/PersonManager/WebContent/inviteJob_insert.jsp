<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>措滹人力资源管理系统--招聘人员添加</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<jsp:useBean id="getSystemTime" scope="page" class="com.wy.tool.GetSystemTime"></jsp:useBean>
<script language="javascript">
function checkEmptyForm(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
if(isNaN(form.age.value)){
window.alert("年龄只能为数字");
return false;
}
if(isNaN(form.tel.value)){
window.alert("电话只能为数字");
return false;
}


alert(form.elements[i].title);
return false;
}
}





}
</script>



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
              <td width="437" valign="bottom"><font color="#66583D"><b>招聘管理&nbsp;</b></font>&gt; <font color="#FF0000">添加应聘人信息</font></td>
            </tr>
          </table>
		  </td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">
        <html:form action="inviteJob.do?method=insertInviteJob" onsubmit="return checkEmptyForm(inviteJobForm)">  
          <table width="493" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
            <tr>
              <th width="69" height="30" class="word_white">姓名：</th>
              <td width="166" bgcolor="#FFFFFF"><html:text property="name" title="请输入应聘人姓名"/></td>
              <th width="67" class="word_white">性别：</th>
              <td width="171" bgcolor="#FFFFFF">&nbsp;&nbsp;<html:radio property="sex" value="男" styleClass="input1" />&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;<html:radio property="sex" value="女" styleClass="input1"/>&nbsp;女</td>
            </tr>
            <tr>
              <th height="30" class="word_white">年龄：</th>
              <td bgcolor="#FFFFFF"><html:text property="age" title="请输入应聘人年龄"/></td>
              <th class="word_white">出生日期：</th>
              <td bgcolor="#FFFFFF"><html:text property="born" title="请输入出生日期"/></td>
            </tr>
            <tr>
              <th height="30" class="word_white">应聘职位：</th>
              <td bgcolor="#FFFFFF"><html:text property="job" title="请输入应聘职务"/></td>
              <th class="word_white">所学专业：</th>
              <td bgcolor="#FFFFFF"><html:text property="specialty" title="请输入所学专业"/></td>
            </tr>
            <tr>
              <th height="30" class="word_white">工作经验：</th>
              <td bgcolor="#FFFFFF"><html:text property="experience" title="请输入工作经验"/></td>
              <th class="word_white">文化程度：</th>
              <td bgcolor="#FFFFFF">
                  <html:select property="teachSchool" >
                     <html:option value="研究生">研究生</html:option>
                     <html:option value="本科生">本科生</html:option>
                     <html:option value="大专生">大专生</html:option>
                  </html:select>
             </td>
            </tr>
            <tr>
              <th height="30" class="word_white">联系电话：</th>
              <td bgcolor="#FFFFFF"><html:text property="tel" title="请输入联系电话"/></td>
              <th class="word_white">毕业学校：</th>
              <td bgcolor="#FFFFFF"><html:text property="afterSchool" title="请输入毕业学校"/></td>
            </tr>
            <tr>
              <th height="30" class="word_white">家庭住址：</th>
              <td bgcolor="#FFFFFF"><html:text property="address" title="请输入家庭住址"/></td>
              <th class="word_white">登记时间：</th>
              <td bgcolor="#FFFFFF"><html:text property="createtime" value="<%=getSystemTime.getToday()%>" readonly="readonly" onclick="alert('此文本框已设为只读，用户不能修改')"/></td>
            </tr>
            <tr>
              <th height="111" class="word_white">个人简介:<html:hidden property="isstock" value="0"/></th>
              <td colspan="3" bgcolor="#FFFFFF"><html:textarea property="content" rows="8" styleClass="textarea" cols="50" title="请输入个人简介"/></td>
            </tr>
          </table>
          <br>
             <html:submit>保存</html:submit> &nbsp; <html:reset>重置</html:reset> &nbsp; <html:button property="back" value="返回" onclick="javascript:history.go(-1);"></html:button>
        </html:form>
      
      
		  </td>
        </tr>
      </table>
	  <jsp:include page="down.jsp" flush="true" />
    </td>
  </tr>
</table>
</body>
</html:html>
