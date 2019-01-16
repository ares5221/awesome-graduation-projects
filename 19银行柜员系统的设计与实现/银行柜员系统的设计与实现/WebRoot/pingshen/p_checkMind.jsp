<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=GB2312"%>
<%
    String getLoginmessage=(String)session.getValue("p_loginSign");
    String identityID=(String)session.getValue("identityID");    
    if(getLoginmessage!="OK")
    {
        response.sendRedirect("index3.jsp");
    }
%>
<jsp:useBean class="firm.firm" id="p_checkMind" scope="page"></jsp:useBean>
<%
    String ssql="select * from I_itemSetup";
    ResultSet srs=p_checkMind.executeQuery(ssql);
    java.util.Date today=new java.util.Date();
    java.util.Date p_beginDate=new java.util.Date();
    java.util.Date p_finishDate=new java.util.Date();
    if(srs.next())
    {
	p_beginDate=srs.getDate("p_beginDate");
	p_finishDate=srs.getDate("p_finishDate");
    }
    if(today.before(p_beginDate) || today.after(p_finishDate))
    {
        response.sendRedirect("timeOut.jsp");
    }
%>

<%
    String itemID=request.getParameter("itemID");
    String score0=request.getParameter("score0");
    String score1=request.getParameter("score1");
    String score2=request.getParameter("score2");
    String score3=request.getParameter("score3");
    String score4=request.getParameter("score4");
    String score5=request.getParameter("score5");
    String score6=request.getParameter("score6");
    String mind=new String(request.getParameter("radio_mind").getBytes("8859_1"));
    String expert_mind=new String(request.getParameter("expert_mind").getBytes("8859_1"));
    String sql="update I_distribute set score0='"+score0+"',score1='"+score1+"',score2='"+score2+"',score3='"+score3+"',score4='"+score4+"',score5='"+score5+"',score6='"+score6+"',mind='"+mind+"',expert_mind='"+expert_mind+"' where itemID='"+itemID+"' and identityID='"+identityID+"'";
    p_checkMind.executeUpdate(sql);

        response.sendRedirect("p_showMind.jsp?itemID="+itemID);
%>