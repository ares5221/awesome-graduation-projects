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
    String unit_ID=request.getParameter("unit_ID");

    String sql="delete from I_distribute where itemID "+
                "in (select itemID from I_s_item where unit_ID='"+unit_ID+"')" +
                "delete from I_s_money where itemID in "+
                "(select itemID from I_s_item where unit_ID='"+unit_ID+"') "+
                "delete from I_s_item where unit_ID='"+unit_ID
                +"' delete from I_s_info where unit_ID='"+unit_ID
                +"' delete from I_s_logon where unit_ID='"+unit_ID+"'";
    z_checkEs.executeUpdate(sql);

    response.sendRedirect("z_unit.jsp?page="+intPage);
%>