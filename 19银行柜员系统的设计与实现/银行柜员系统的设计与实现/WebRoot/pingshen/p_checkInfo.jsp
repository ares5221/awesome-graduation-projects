<%@ page language="java" import="java.sql.*"contentType="text/html;charset=GB2312"%>


<jsp:useBean class="firm.firm" id="p_change" scope="page"></jsp:useBean>
<%
    System.out.println("<<aaaaaaaaaaaa>>");
    String oldidentityID=(String)session.getValue("identityID");
    
    String expert_name=new String(request.getParameter("expert_name").getBytes("8859_1"));
    String sex=new String(request.getParameter("sex").getBytes("8859_1"));
    String nation=new String(request.getParameter("nation").getBytes("8859_1"));
    String bir_year=new String(request.getParameter("bir_year").getBytes("8859_1"));
    String bir_month=new String(request.getParameter("bir_month").getBytes("8859_1"));
    String bir_day=new String(request.getParameter("bir_day").getBytes("8859_1"));
    String unit_ID=new String(request.getParameter("unit_ID").getBytes("8859_1"));
    String unit_name=new String(request.getParameter("unit_name").getBytes("8859_1"));
    String grade=new String(request.getParameter("grade").getBytes("8859_1"));
    String domain=new String(request.getParameter("domain").getBytes("8859_1"));    
    String isort1[]=request.getParameterValues("SelectedIndustry[]");
    String email=new String(request.getParameter("email").getBytes("8859_1"));
    String address=new String(request.getParameter("address").getBytes("8859_1"));
    String zipcode=new String(request.getParameter("zipcode").getBytes("8859_1"));
    String tel=new String(request.getParameter("tel").getBytes("8859_1"));
    String introduction=new String(request.getParameter("introduction").getBytes("8859_1"));
    String bir_date=bir_year+"-"+bir_month+"-"+bir_day;
     System.out.println("<<bbbffff>>");
    System.out.println("<<isort.length>>"+isort1.length);
    String sort[]={"",""};
   System.out.println("<<fffffff>>");
      if(isort1.length>0) {
        for(int i=0;i<isort1.length;i++){
	           sort[i]=isort1[i];
	     System.out.println("<<fffffff>>");
         }
       }

    else  {
         out.println("qqq");
          }
    
   String sql="update I_p_info set expert_name='"+expert_name+"',sex='"+sex+"',bir_date='"+bir_date+"',unit_ID='"+unit_ID+"',unit_name='"+unit_name+"',grade='"+grade+"',domain='"+domain+"',sort1='"+sort[0]+"',sort2='"+sort[1]+"',email='"+email+"',address='"+address+"',zipcode='"+zipcode+"',tel='"+tel+"',introduction='"+introduction+"' where identityID='"+oldidentityID+"'";
   out.println(sql);
 p_change.executeUpdate(sql);
    
    String sql1="update I_p_log set expert_name='"+expert_name+"' where identityID='"+oldidentityID+"'";
    p_change.executeUpdate(sql1);

    response.sendRedirect("p_showInfo.jsp");
	
%>