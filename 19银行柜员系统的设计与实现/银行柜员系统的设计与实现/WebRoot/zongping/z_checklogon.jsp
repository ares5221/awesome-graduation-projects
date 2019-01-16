<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=GB2312"%>

<jsp:useBean class="firm.firm" id="z_log" scope="page"></jsp:useBean>
<%    
    String adminID=request.getParameter("adminID");
    String password=request.getParameter("password");
    
    String sql="select * from I_z_log where adminID='"+adminID+"' and password='"+password+"'";
    ResultSet rs=z_log.executeQuery(sql);
    if(rs.next()){
        rs.close();
        z_log.closeStmt();
        z_log.closeConn();
        session.putValue("z_loginSign","OK");
        session.putValue("adminID",adminID);

	response.sendRedirect("jieg.html");
    }
    else{
        rs.close();
        z_log.closeStmt();
        z_log.closeConn();
        String msg="管理员代码或密码错误！";
        session.putValue("login_message",msg);

	response.sendRedirect("index4.jsp");
    }
%>
