<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=GB2312"%>

<jsp:useBean class="firm.firm" id="s_change" scope="page"></jsp:useBean>
<%
    String unit_ID=(String)session.getValue("unitID");
    String unit_name=new String(request.getParameter("unit_name").getBytes("8859_1"));
    String ename=new String(request.getParameter("ename").getBytes("8859_1"));
    String cardno=new String(request.getParameter("cardno").getBytes("8859_1"));
    String corporation=new String(request.getParameter("corporation").getBytes("8859_1"));
    String property=new String(request.getParameter("property").getBytes("8859_1"));
    String trade=new String(request.getParameter("trade").getBytes("8859_1"));
    String investment=new String(request.getParameter("investment").getBytes("8859_1"));
    String stuff=new String(request.getParameter("stuff").getBytes("8859_1"));
    String business=new String(request.getParameter("business").getBytes("8859_1"));
    String connectman=new String(request.getParameter("connectman").getBytes("8859_1"));
    String tel=new String(request.getParameter("tel").getBytes("8859_1"));
    String fax=new String(request.getParameter("fax").getBytes("8859_1"));
    String email=new String(request.getParameter("email").getBytes("8859_1"));
    String address=new String(request.getParameter("address").getBytes("8859_1"));
    String zipcode=new String(request.getParameter("zipcode").getBytes("8859_1"));
    String introduction=new String(request.getParameter("introduction").getBytes("8859_1"));

    
    String sql="update I_s_info set unit_name='"+
                       unit_name+
                       "',ename='"+ename+
                       "',cardno='"+cardno+
                       "',corporation='"+corporation+
                       "',property='"+property+
                       "',trade='"+trade+
                       "',investment='"+investment+
                       "',stuff='"+stuff+
                       "',business='"+business+
                       "',connectman='"+connectman+
                       "',tel='"+tel+
                       "',fax='"+fax+
                       "',email='"+email+
                       "',address='"+address+
                       "',zipcode='"+zipcode+
                       "',introduction='"+introduction+
                       "' where unit_ID='"+unit_ID+"'";
    s_change.executeUpdate(sql);

    response.sendRedirect("s_showInfo.jsp");
%>