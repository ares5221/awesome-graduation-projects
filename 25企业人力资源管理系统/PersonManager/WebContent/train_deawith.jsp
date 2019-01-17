<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%

if(request.getAttribute("result")!=null){
	out
		.print("<script language=javascript>alert('"+request.getAttribute("result")+"');history.go(-1);</script>");
}else{
out
		.print("<script language=javascript>window.location.href='train.do?method=queryTrain';</script>");
}

%>