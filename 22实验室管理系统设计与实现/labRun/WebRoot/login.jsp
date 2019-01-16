<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>登陆</title>
        <link href="/css/main.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript"
			src="js/main.js"></script>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">


		<script>
    
    function click1()
    {
      var username =  document.form1.username.value;
      var userpwd  =  document.form1.userpwd.value;
      if (username.length == 0)
      { 
          alert("请输入用户名");
          document.form1.username.focus();    //焦点      
          return;
      }
      if (userpwd == ''|| userpwd.length < 6)
      { 
          alert("密码格式不符");
          document.form1.userpwd.focus();          
          return;
      }
    
    document.form1.action = 'labAction.do';
    document.form1.submit(); 
    
    }
    
    </script>

	</head>

	
	<body background="img/login.jpg">
		<form name="form1" action="" method="post">
		<FIELDSET 
      style="border: 1px solid white; left: 678px; width: 250px; position: absolute; top: 393px; height: 140px;"><LEGEND><FONT 
      color=black size="3">登&nbsp;&nbsp;陆</FONT></LEGEND>
      <TABLE class="txt1" cellSpacing=0 cellPadding=0 border=0 style="left: 693px; width: 323px; top: 425px; height: 148px;">
		<tbody>
		<TR>
    <TD colSpan=4  ></TD>
  <TR>
    <TD width=40 >
    <TD width=80>用户名：</TD><td>	<input name="username" type="text" size ='16' value="" autocomplete="off" class="css/login_input"></td><br>
		<TR>
    <TD colSpan=3 height=20></TD>
  <TR>
    <TD width=30>
    <TD width=60>密码：</TD><td><input name="userpwd" type="password"  size ='18' value="" class="login_input"></td></TR>
		<TR>
    <TD colSpan=3 height=20></TD>
  <TR>
    <TD align=middle colSpan=3>
     <!-- 应用一个隐藏的链表来判断servlet语句执行的内容 -->
			<input name="domethod" type="hidden" value="login"> <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="b1" value="登陆" class="Button" onclick="click1();">&nbsp;&nbsp; 
          &nbsp;&nbsp; &nbsp;&nbsp;<INPUT class="Button" type=reset value="清除"> 
</TD></TR>
		 <br>
		<br>
		 
	</body>
</html>

