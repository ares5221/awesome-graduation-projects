<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>

<%@include file="_SessionCheck.jsp"%>

<html>
<script language="javascript">
	state = 0 ;
	menuState = 0;
	mainState = 0;
</script>

<head>
<title>金尚商城管理平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset rows="29,*" frameborder="0" border="0" framespacing="0" cols="*">
  <frame name="top" scrolling="NO" noresize src="top.html">
  <frameset cols="20%,*" frameborder="0" border="0" framespacing="0" rows="*" scrolling="NO" name="mleft">
    <frame src="menu.html" frameborder=NO border="0" scrolling="NO" >
    <frameset rows="20,100%,*" name="content" frameborder="1" framespacing="1" cols="*">
      <frame src="title.html" frameborder=0 noresize scrolling="NO" name="mtitle">
      <frame src="" frameborder=0  name="main" marginwidth="0" marginheight="0" scrolling="YES">
      <frame src="" frameborder=0  name="detail">
    </frameset>
  </frameset>
</frameset>
<noframes>
</noframes>
</html>