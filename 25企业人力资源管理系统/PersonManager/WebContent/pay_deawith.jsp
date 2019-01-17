<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
if(request.getAttribute("id")!=null){

String id=(String)request.getAttribute("id");
out.print("<script language=javascript>window.location.href='inviteJob.do?method=employeeInviteJob&id="+id+"';</script>");
}






if(request.getAttribute("result")!=null){
	out
		.print("<script language=javascript>alert('"+request.getAttribute("result")+"');history.go(-1);</script>");
}else{
out
		.print("<script language=javascript>window.location.href='pay.do?method=queryPay';</script>");
}

%>