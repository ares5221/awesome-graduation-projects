<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>
<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean class="firm.firm" id="z_checkMind" scope="page"></jsp:useBean>
<%
    String itemID=request.getParameter("itemID");
    String leadingMind=new String(request.getParameter("leadingMind").getBytes("8859_1"));
    
    String sql="update I_s_item set leading_mind='"+leadingMind+"' where itemID='"+itemID+"'";
    z_checkMind.executeUpdate(sql);

    response.sendRedirect("z_showItem.jsp?itemID="+itemID);
%>