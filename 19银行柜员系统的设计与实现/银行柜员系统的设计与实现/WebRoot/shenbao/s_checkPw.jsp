<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=GB2312"%>

<jsp:useBean class="firm.firm" id="s_change" scope="page"></jsp:useBean>
<%    
    String unit_ID=request.getParameter("unit_ID");
    String oldpassword=request.getParameter("oldPassword");
    String newpassword=request.getParameter("newPassword");

    String sql="select * from I_s_logon where unit_ID='"+unit_ID+"' and password='"+oldpassword+"'";
    ResultSet rs=s_change.executeQuery(sql);
    if(rs.next()){
        rs.close();
        s_change.closeStmt();
        s_change.closeConn();
        String strSQL="update I_s_logon set password='"+newpassword+"' where unit_ID='"+unit_ID+"' and password='"+oldpassword+"'";
        s_change.executeUpdate(strSQL);

        response.sendRedirect("s_pwOK.jsp");
    }
    else{
        rs.close();
        s_change.closeStmt();
        s_change.closeConn();
        String msg="单位代码或密码错误！";
        session.putValue("s_changeMessage",msg);

        response.sendRedirect("s_changePw.jsp");
    }    
%>