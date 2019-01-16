<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>
<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean class="firm.firm" id="z_checkExpert" scope="page"></jsp:useBean>
<%
    String expert_name=new String(request.getParameter("expert_name").getBytes("8859_1"));
    String identityID=new String(request.getParameter("identityID").getBytes("8859_1"));    
    String password=new String(request.getParameter("password").getBytes("8859_1"));    
    
    String sql="insert into I_p_log(identityID,expert_name,password) values('"+identityID+"','"+expert_name+"','"+password+"')";
    z_checkExpert.executeUpdate(sql);
    String sql1="insert into I_p_info(identityID,expert_name,pass) values('"+identityID+"','"+expert_name+"','1')";
    z_checkExpert.executeUpdate(sql1);

    response.sendRedirect("z_expert.jsp");
%>