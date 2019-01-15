<%@page import="com.bjsxt.school.entity.Teacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'teacherCourse.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <script type="text/javascript" src="/school/js/jquery-1.8.2.js"></script>
  <script type="text/javascript">
  		function selectAllMsg() {
			var tno= $("#tno").val();
			if(tno==""){
			return;
			}else{
			location.href="servlet/TeacherServlet?method=selectTeacher&tno="+tno;
			
			}
		}
  </script>
  
  
  </head>
  
  <body>
     <form method="post" action="servlet/TeacherServlet?method=arrangeCourse" >
                       <p align="center"> ======教职任课======</p> 
       
       
       <table align="center" width="80%">
         <tr>
         	<td> 教师编号</td>
         	<td><input type="text" name="tno" id="tno"  onblur="selectAllMsg()"   value="${teacher.tno }"> </td>
            <td> 任课科目</td>
            <td><select name="mno" >
                <c:forEach items="${course }" var="courselist" >
                <option value="${courselist.coursename }">${courselist.coursename } </option>
                 </c:forEach>
                 </select>
             </td>
         	<td>  任职日期</td>
            <td><input type="text" name="workDate">  </td>
         </tr>
       
       </table>
       
       	  
                
              
        
        <br>
        <br> 
         <table align="center" width="80%" border="1" cellspacing="0" cellpadding="0">
         <tr height="30px" style="text-align: center;">
          <td> 教师姓名 </td>
          <td>性别</td>
          <td>年龄</td>
          <td>学历</td>
          <td>授课专业</td>
          <td>婚否</td>
         </tr>
          <tr  height="40px" style="text-align: center;">
          <td>${teacher.tname}</td>
          <td>${teacher.sex}</td>
          <td>${teacher.age}</td>
          <td>${teacher.education}</td>
          <td>${teacher.mno}</td>
          <td> ${teacher.marital}</td>
         </tr>
         
         </table>
          <br>
        <br> 
         
    
      
     
  
      <div align="center"> 
     <input type="submit" value="提交" >${error }
     <input type="reset" value="重置">
     </div>  
      
     </form>   
  </body>
</html>
