<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=GB2312"%>

<jsp:useBean class="firm.firm" id="z_change" scope="page"></jsp:useBean>
<%    
    String adminID=request.getParameter("adminID");
    String oldpassword=request.getParameter("oldPassword");
    String newpassword=request.getParameter("newPassword");

    String sql="select * from I_z_log where adminID='"+adminID+"' and password='"+oldpassword+"'";
    ResultSet rs=z_change.executeQuery(sql);
    if(rs.next()){
        rs.close();
        z_change.closeStmt();
        z_change.closeConn();
        String strSQL="update I_z_log set password='"+newpassword+"' where adminID='"+adminID+"' and password='"+oldpassword+"'";
        z_change.executeUpdate(strSQL);

        response.sendRedirect("z_pwOK.jsp");
    }
    else{
        rs.close();
        z_change.closeStmt();
        z_change.closeConn();
        String msg="管理员代码或密码错误！";
        session.putValue("z_changeMessage",msg);

        response.sendRedirect("z_changePw.jsp");
    }
%>