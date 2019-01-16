<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>

<%
    String getLoginmessage=(String)session.getValue("p_loginSign");
    String identityID=(String)session.getValue("identityID");    
    if(getLoginmessage!="OK")
    {
        response.sendRedirect("index3.jsp");
    }
%>

<jsp:useBean class="firm.firm" id="p_change" scope="page"></jsp:useBean>

<%    
    String expert_name=new String(request.getParameter("expert_name").getBytes("8859_1"));
    String oldpassword=new String(request.getParameter("oldPassword").getBytes("8859_1"));
    String newpassword=new String(request.getParameter("newPassword").getBytes("8859_1"));

    String sql="select * from I_p_log where expert_name='"+expert_name+"' and identityID='"+identityID+"' and password='"+oldpassword+"'";
    ResultSet rs=p_change.executeQuery(sql);
    if(rs.next()){
        rs.close();
        p_change.closeStmt();
       p_change.closeConn();
        String strSQL="update I_p_log set password='"+newpassword+"' where expert_name='"+expert_name+"' and identityID='"+identityID+"' and password='"+oldpassword+"'";
        p_change.executeUpdate(strSQL);

        response.sendRedirect("p_pwOK.jsp");
    }
    else{
        out.println(expert_name);
        out.println(oldpassword);
        out.println(newpassword);
        rs.close();
        p_change.closeStmt();
        p_change.closeConn();
        String msg="专家姓名、身份证号或密码错误！";
        session.putValue("p_changeMessage",msg);

        response.sendRedirect("p_changePw.jsp");
    }
%>
