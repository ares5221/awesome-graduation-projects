<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

  </head>
  
  <body>
  <form method="post" action="servlet/TeacherServlet?method=selectTeacherCourse">
      <table align="center" width="30%">
         <tr>
            <td> 请输入查询条件:</td>
            <td> <select name="msg" > 
                  <option value="1">任职科目</option>
                   <option  value="2">教师姓名</option>
                 </select></td>
            <td> <input type="text" name="msg1"></td>
            <td> <input type="submit" value="提交">${error }</td>
         
         </tr>
      
      </table>   
           
          
        
                
            
            
            
            
          <br>  
        <table align="center" width="80%" border="1" cellspacing="0" cellpadding="0px">
           <tr>
           		<td> 教师编号</td>
           		<td>教师姓名</td>
           		<td>教师性别</td>
           		<td>任职时间</td>
           		<td> 任职科目</td>
           </tr>
        	<tr>
           		<td>${teacher.tno }</td>
           		<td>${teacher.tname }</td>
           		<td>${teacher.sex }</td>
           		<td>${teacher.workDate }</td>
           		<td>${teacher.mno }</td>
           </tr>
        
        </table>   
            
            
            
        
         
        
       
     
            
    </form>
  </body>
</html>
