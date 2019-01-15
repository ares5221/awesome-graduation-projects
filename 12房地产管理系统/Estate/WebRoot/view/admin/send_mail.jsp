<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>sendMail</title>
    <script type="text/javascript" src="/Estate/js/jquery-1.8.2.js"></script>
    <script type="text/javascript">
    	
    	$(function(){
    		//页面加载完成后请求数据获取所有的员工信息加载早下拉列表中
    		$.ajax({
    			url:"servlet/EmployeeServlet?method=findAllEmail",
    			type:"get",
    			dataType:"text",
    			success:function(result){
    				var emparr = JSON.parse(result);
    				var s = "";
    				for(var i = 0;i<emparr.length;i++){
    					s+="<option value='"+emparr[i].user_email+"'>"+emparr[i].user_name+"</option>"
    				}
    				$("#alluser").html(s);
    			}
    		});
    	});
    	
    	
    	
    	function checkMail(){
    		var flag1 = checkReceiver();
    		var flag2 = checkmessage();
    		if(flag1&&flag2){
    			return true;
    		}
    		return false;
    	}
    	function checkReceiver(){
    		$("#receivererror").html("");
    		var value = $("#receiver").val();
    		//验证不能为空
    		if(value==""){
    			$("#receivererror").html("收件人不能为空");
    			return false;
    		}
    		//验证是否符合邮箱格式
    		var regex = /\w+@(\w+.\w+)+/;
    		if(!regex.test(value)){
    			$("#receivererror").html("邮箱格式不正确");
    			return false;
    		}
    		return true;
    	}
    	
    	function checkmessage(){
    		$("#mailerror").html("");
    		var mess = $("textarea[name=message]").val();
    		
    		if(""==mess){
    			$("#mailerror").html("邮件内容不能为空");
    			return false;
    		}
    		return true;
    	}
    	
    	function getMail(){
    		var mail = $("#alluser").val();
    		
    		$("#receiver").val(mail);
    	}
    	
    </script>
</head>

<body>
	<form action="servlet/AdminServlet?method=sendMessage" method="post" onsubmit="return checkMail()">
	<table >
    	<tr>
        	<td>收件人:</td>
            <td>
            	<input type="text" size="49" name="receiver" id="receiver" onblur="checkReceiver()" />
            	<select id = "alluser" onchange="getMail()">
            		
            	</select>
            	<span id = "receivererror" style="color: red;"></span>
            </td>
        </tr>
        
        <tr>
        	<td align="center" valign="top">邮件内容:</td>
            <td >
            	<textarea rows="25" cols="70" id="message" name="message" onblur="checkmessage()">	
                </textarea>
                <span id="mailerror" style="color: red;"></span>
            </td>
        </tr>
       
         <tr>
        	<td colspan="2" align="center">
        		<input type="submit"  name="send"  value="发送"/>
        		${success }
        	</td>
        	
        </tr>
    </table>
</form>
</body>
</html>
