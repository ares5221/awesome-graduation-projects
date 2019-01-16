<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=GB2312"%>

<jsp:useBean class="firm.firm" id="p_log" scope="page"></jsp:useBean>
<%    
    String expert_name=new String(request.getParameter("expert_name").getBytes("8859_1"));
    String identityID=request.getParameter("identityID");
    String password=request.getParameter("password");
    
    String sql="select * from I_p_log where expert_name='"+expert_name+"' and identityID='"+identityID+"' and password='"+password+"'";
    ResultSet rs=p_log.executeQuery(sql);
    if(rs.next()){
        rs.close();
        p_log.closeStmt();
        p_log.closeConn();
        session.putValue("p_loginSign","OK");
        session.putValue("identityID",identityID);
        response.sendRedirect("jieg.html");
    }
    else{
        rs.close();
        p_log.closeStmt();
        p_log.closeConn();
        String msg="专家姓名、身份证号或密码错误！";
        session.putValue("p_logmessage",msg);
        response.sendRedirect("index3.jsp");
    }
%>
