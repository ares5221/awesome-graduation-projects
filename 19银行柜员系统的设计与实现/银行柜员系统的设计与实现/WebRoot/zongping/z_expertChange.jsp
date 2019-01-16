<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>
<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean class="firm.firm" id="z_expertChange" scope="page"></jsp:useBean>
<%
    String itemID=request.getParameter("itemID");
    String item_name=new String(request.getParameter("item_name").getBytes("8859_1"));
    String identityID1=new String(request.getParameter("identityID1").getBytes("8859_1"));
    String expert_name1=new String(request.getParameter("expert_name1").getBytes("8859_1")); 
    String identityID2=new String(request.getParameter("identityID2").getBytes("8859_1"));
    String expert_name2=new String(request.getParameter("expert_name2").getBytes("8859_1")); 
    String identityID3=new String(request.getParameter("identityID3").getBytes("8859_1"));
    String expert_name3=new String(request.getParameter("expert_name3").getBytes("8859_1")); 
    String identityID4=new String(request.getParameter("identityID4").getBytes("8859_1"));
    String expert_name4=new String(request.getParameter("expert_name4").getBytes("8859_1")); 
    String identityID5=new String(request.getParameter("identityID5").getBytes("8859_1"));
    String expert_name5=new String(request.getParameter("expert_name5").getBytes("8859_1"));    
    
    String sql="delete from I_distribute where itemID='"+itemID+"' insert into I_distribute(itemID,item_name,identityID,expert_name) values('"+itemID+"','"+item_name+"','"+identityID1+"','"+expert_name1+"') insert into I_distribute(itemID,item_name,identityID,expert_name) values('"+itemID+"','"+item_name+"','"+identityID2+"','"+expert_name2+"') insert into I_distribute(itemID,item_name,identityID,expert_name) values('"+itemID+"','"+item_name+"','"+identityID3+"','"+expert_name3+"') insert into I_distribute(itemID,item_name,identityID,expert_name) values('"+itemID+"','"+item_name+"','"+identityID4+"','"+expert_name4+"') insert into I_distribute(itemID,item_name,identityID,expert_name) values('"+itemID+"','"+item_name+"','"+identityID5+"','"+expert_name+5"')";
    z_expertChange.executeUpdate(sql);

    response.sendRedirect("z_expertOK.jsp");
%>