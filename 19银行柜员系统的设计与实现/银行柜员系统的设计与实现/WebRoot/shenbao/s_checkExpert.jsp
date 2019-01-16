<%@ page language="java" contentType="text/html;charset=GB2312"%>

<%
    String getLoginmessage=(String)session.getValue("loginSign");
    String unit_ID=(String)session.getValue("unitID");    
    if(getLoginmessage!="OK")
    {
        response.sendRedirect("index2.jsp");
    }
%>
<jsp:useBean class="firm.firm" id="s_checkExpert" scope="page"></jsp:useBean>
<%
    String expert_name=new String(request.getParameter("expert_name").getBytes("8859_1"));
    String identityID=new String(request.getParameter("identityID").getBytes("8859_1"));    
    String password=new String(request.getParameter("password").getBytes("8859_1"));    
    
    String sql="insert into I_p_log(identityID,expert_name,password) values('"+identityID+"','"+expert_name+"','"+password+"')";
    s_checkExpert.executeUpdate(sql);
    String sql1="insert into I_p_info(identityID,expert_name,unit_ID) values('"+identityID+"','"+expert_name+"','"+unit_ID+"')";
    s_checkExpert.executeUpdate(sql1);

    response.sendRedirect("s_expert.jsp");
%>