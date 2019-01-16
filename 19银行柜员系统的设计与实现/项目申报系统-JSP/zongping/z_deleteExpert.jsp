<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>
<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean class="firm.firm" id="z_checkEs" scope="page"></jsp:useBean>
<%
    String intPage=request.getParameter("intPage");
    String identityID=request.getParameter("identityID");

    String sql="delete from I_distribute where identityID='"+identityID+"' delete from I_p_info where identityID='"+identityID+"' delete from I_p_log where identityID='"+identityID+"'";
    z_checkEs.executeUpdate(sql);

    response.sendRedirect("z_expert.jsp?page="+intPage);
%>