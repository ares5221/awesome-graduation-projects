<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=GB2312"%>

<jsp:useBean class="firm.firm" id="s_log" scope="page"></jsp:useBean>
<%    
    String unit_ID=request.getParameter("unit_ID");
    String password=request.getParameter("password");
    
    String sql="select * from I_s_logon where unit_ID='"+unit_ID+"' and password='"+password+"'";
    ResultSet rs=s_log.executeQuery(sql);
    if(rs.next()){
        rs.close();
        s_log.closeStmt();
        s_log.closeConn();
        session.putValue("loginSign","OK");
        session.putValue("unitID",unit_ID);

        response.sendRedirect("jieg.html");
    }
    else{
        rs.close();
        s_log.closeStmt();
        s_log.closeConn();
        String msg="单位代码或密码错误！";
        session.putValue("login_message",msg);
        response.sendRedirect("index2.jsp");
    }
%>
