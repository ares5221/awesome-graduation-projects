<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>
<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean class="firm.firm" id="z_checkUnit" scope="page"></jsp:useBean>
<%
    String unit_ID=new String(request.getParameter("unit_ID").getBytes("8859_1"));
    String password=new String(request.getParameter("password").getBytes("8859_1"));    
    
    String sql="insert into I_s_logon(unit_ID,password) values('"+unit_ID+"','"+password+"')";
    z_checkUnit.executeUpdate(sql);
    String sql1="insert into I_s_info(unit_ID) values('"+unit_ID+"')";
    z_checkUnit.executeUpdate(sql1);

    response.sendRedirect("z_unit.jsp");
%>