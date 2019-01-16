<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>
<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean class="firm.firm" id="z_checkEs" scope="page"></jsp:useBean>
<%
    String itemID=request.getParameter("itemID");
    String identityID=new String(request.getParameter("identityID").getBytes("8859_1")); 
    String item_name=new String(request.getParameter("item_name").getBytes("8859_1"));
    String expert_name=new String(request.getParameter("expert_name").getBytes("8859_1"));
    String identityID1=new String(request.getParameter("identityID1").getBytes("8859_1"));    
    String score=new String(request.getParameter("score").getBytes("8859_1"));

    String sql="";
    String sql1="select * from I_distribute where itemID='"+itemID+"' and identityID='"+identityID+"'";
    ResultSet rs1=z_checkEs.executeQuery(sql1);
    if(rs1.next())
    {
        sql="update I_distribute set identityID='"+identityID1+"',expert_name='"+expert_name+"',score6='"+score+"' where itemID='"+itemID+"' and identityID='"+identityID+"'";
    }
    else
    {
        sql="insert into I_distribute(itemID,item_name,identityID,expert_name,score6) values('"+itemID+"','"+item_name+"','"+identityID1+"','"+expert_name+"','"+score+"')";
    }
    z_checkEs.executeUpdate(sql);

    response.sendRedirect("z_expertOK.jsp");
%>