<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>

<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean id="z_passOK" scope="page" class="firm.firm"/>
<%
    String intPage=new String(request.getParameter("intPage").getBytes("8859_1"));
    String identityID=new String(request.getParameter("identityID").getBytes("8859_1"));
    String passflag=new String(request.getParameter("pass").getBytes("8859_1"));
    String pass="";
    

    if(passflag.compareTo("0")==0)
    {
        pass="1";
        
    }
    else
    {
        pass="0";
    }
    String sql="update I_p_info set pass='"+pass+"' where identityID='"+identityID+"'";
    z_passOK.executeUpdate(sql);
	response.sendRedirect("z_expert.jsp?page="+intPage);
	System.out.println("456");
%>