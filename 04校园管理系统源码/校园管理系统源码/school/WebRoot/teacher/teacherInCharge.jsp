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
     <script type="text/javascript" src="/school/js/jquery-1.8.2.js"></script>
  <script type="text/javascript">
  		
		$(function(){
		
		 $.ajax({
		        type:'POST',
   				url:"servlet/TeacherServlet?method=selectAll",
   				
   				dataType:"text",
   				success:function(data){
   					//将json字符串转换成json对象
   					eval("var arr = "+data);
   				
   					for(var i=0;i<arr.length;i++){ 			
   							$("#classname").append("<option value='"+arr[i].classname+"</option>");
   							$("#majorname").append("<option value='"+arr[i].majorname+"</option>");
   							$("#classid").append("<option value='"+arr[i].classid+"</option>");
   							
   					}
   				}   	
		 
		 
		 });
		
		
		});
		
		function selectAllMsg() {
			var tno= $("#tno").val();
			if(tno==""){
			return;
			}else{
			location.href="servlet/TeacherServlet?method=selectTeacher1&tno="+tno;
			
			}
		}
		
  </script>
  </head>
  
  <body>
   <form method="post" action="servlet/TeacherServlet?method=teacherInCharge" >
     
         <div align="center"> 教师编号<input type="text" name="tno" id="tno"  onblur="selectAllMsg()"   value="${teacher.tno }">  
          <input  type="submit" value="提交"> 
         </div>
         
     <br> 
     <table align="center" width="80%" border="1" cellspacing="0" cellpadding="0">
        <tr height="30px" style="text-align: center;">
           <td>教师姓名</td>
           <td>性别</td>
           <td>年龄</td>
           <td>学历</td>
           <td>授课专业</td>
           <td>婚否</td>
        </tr>
        <tr>
           <td>${teacher.tname}</td>
           <td>${teacher.sex}</td>
           <td>${teacher.age}</td>
           <td>${teacher.education}</td>
           <td>${teacher.mno}</td>
           <td>${teacher.marital}</td>
        </tr>
     
     
     
     
     </table>
     
     
    	
       
      ${error }
      <br>
   
     
   
      
    
      
      
     </form>  
  </body>
</html>
