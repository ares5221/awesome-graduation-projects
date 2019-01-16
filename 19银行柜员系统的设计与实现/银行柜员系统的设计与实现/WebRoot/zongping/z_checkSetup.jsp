<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>
<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean class="firm.firm" id="z_checkSetup" scope="page"></jsp:useBean>
<%
    String s_beginYear=new String(request.getParameter("s_beginYear").getBytes("8859_1"));
    String s_beginMonth=new String(request.getParameter("s_beginMonth").getBytes("8859_1"));
    String s_beginDay=new String(request.getParameter("s_beginDay").getBytes("8859_1"));
    String s_finishYear=new String(request.getParameter("s_finishYear").getBytes("8859_1"));
    String s_finishMonth=new String(request.getParameter("s_finishMonth").getBytes("8859_1"));
    String s_finishDay=new String(request.getParameter("s_finishDay").getBytes("8859_1"));

    String p_beginYear=new String(request.getParameter("p_beginYear").getBytes("8859_1"));
    String p_beginMonth=new String(request.getParameter("p_beginMonth").getBytes("8859_1"));
    String p_beginDay=new String(request.getParameter("p_beginDay").getBytes("8859_1"));
    String p_finishYear=new String(request.getParameter("p_finishYear").getBytes("8859_1"));
    String p_finishMonth=new String(request.getParameter("p_finishMonth").getBytes("8859_1"));
    String p_finishDay=new String(request.getParameter("p_finishDay").getBytes("8859_1"));

    String s_beginDate=s_beginYear+"-"+s_beginMonth+"-"+s_beginDay;
    String s_finishDate=s_finishYear+"-"+s_finishMonth+"-"+s_finishDay+" 23:59:59";
    String p_beginDate=p_beginYear+"-"+p_beginMonth+"-"+p_beginDay;
    String p_finishDate=p_finishYear+"-"+p_finishMonth+"-"+p_finishDay;
    
    String sql="update I_itemSetup set s_beginDate='"+s_beginDate+"',s_finishDate='"+s_finishDate+"',p_beginDate='"+p_beginDate+"',p_finishDate='"+p_finishDate+"'";
    z_checkSetup.executeUpdate(sql);

    response.sendRedirect("z_setupOK.jsp");
%>