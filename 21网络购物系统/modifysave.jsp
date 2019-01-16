<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<link href="css.css" rel="stylesheet" type="text/css">
<title>用户资料更改</title>
</head>
<jsp:useBean id="mdb" class="ckstudio.db.mysqlconn2" scope="page"/>
<link href=css.css rel=STYLESHEET type=text/css>
<%!
boolean IsMail(String user_mail){
	int index=user_mail.indexOf("@");
	int index2=user_mail.indexOf(".");
	if(index==-1 || index2==-1)
		return false;
	else return true;
}
%>
<%
//-------------------------------------------------------------------
String errmsg="错误!",sql;
boolean founderr=false;
String user_name,user_namec,user_pass,user_adds,user_tel,user_mail,user_postcode;
user_name=errmsg;
user_namec=errmsg;
user_pass=errmsg;
user_adds=errmsg;
user_tel=errmsg;
user_mail=errmsg;
user_postcode=errmsg;

if(request.getParameter("user_namec").equals("")){
	errmsg=errmsg+"真实名不能为空,";
	founderr=true;
}else user_namec=request.getParameter("user_namec");


if(request.getParameter("user_pass").equals("")){
	errmsg=errmsg+"密码不能为空,";
	founderr=true;
}else user_pass=request.getParameter("user_pass");

    if(request.getParameter("user_adds").equals("")){
	errmsg=errmsg+"地址不能为空,";
	founderr=true;
}else user_adds=request.getParameter("user_adds");

if(request.getParameter("user_tel").equals("")){
	errmsg=errmsg+"电话号码不能为空,";
	founderr=true;
}else user_tel=request.getParameter("user_tel");

if(!IsMail(request.getParameter("user_mail"))){
	errmsg=errmsg+"你的E-mail有错误,";
	founderr=true;
}else user_mail=request.getParameter("user_mail");

if(request.getParameter("user_postcode").equals("")){
	errmsg=errmsg+"邮编不能为空,";
	founderr=true;
}else user_postcode=request.getParameter("user_postcode");
    
    if(founderr==true){
       out.print(errmsg);
	   }
    else
	{
        user_name=request.getParameter("user_name");
        sql="select * from member where user_name='"+user_name+"'";
		ResultSet rs;
        rs=mdb.executeQuery(sql);
        if(rs.next()){
		rs.updateString("user_pass",user_pass);
        rs.updateString("user_mail",user_mail);
        rs.updateString("user_adds",user_adds);
        rs.updateString("user_postcode",user_postcode);
        rs.updateString("user_tel",user_tel);
        rs.updateString("user_namec",user_namec);
        rs.updateRow();
        out.print("<font>");
        out.print("用户资料更改完毕,请记牢你更改后的信息");
        out.print("</font>");
		rs.close();
       }
   }
   mdb.Close();
   %>