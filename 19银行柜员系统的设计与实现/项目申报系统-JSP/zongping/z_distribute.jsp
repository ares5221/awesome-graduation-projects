<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>

<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean class="firm.firm" id="distribute" scope="page"></jsp:useBean>
<%
    String ssql="select * from I_itemSetup";
    ResultSet srs=distribute.executeQuery(ssql);
    java.util.Date today=new java.util.Date();
    java.util.Date p_beginDate=new java.util.Date();
    java.util.Date s_finishDate=new java.util.Date();
    if(srs.next())
    {
	s_finishDate=srs.getDate("s_finishDate");
	p_beginDate=srs.getDate("p_beginDate");
    }
    if(today.before(s_finishDate) || today.after(p_beginDate))
    {
        response.sendRedirect("timeOut.jsp");
    }
    else{
%>
<%
    String itemID="";
    String unit_ID="";
    String item_name="";
    String sort1="";
    String sort2="";
    String identityID="";

    String sql2="select * from I_s_item";
    ResultSet rs2=distribute.executeQuery(sql2);

    while(rs2.next())
    {
	itemID=rs2.getString("itemID");
	unit_ID=rs2.getString("unit_ID");
	item_name=rs2.getString("item_name");
	sort1=rs2.getString("sort1");
	sort2=rs2.getString("sort2");

        if(sort1=="")sort1="nosort";
        if(sort2=="")sort2="nosort";
        String sql="select identityID,expert_name from I_p_info where (sort1='"+sort1+"' or sort1='"+sort2+"' or sort2='"+sort1+"' or sort2='"+sort2+"') and pass='1' and unit_ID<>'"+unit_ID+"'";
        ResultSet rs=distribute.executeQuery(sql);//从专家库中选出适合领域的专家ID

        String sql1="select count(distinct identityID) as num from I_p_info where (sort1='"+sort1+"' or sort1='"+sort2+"' or sort2='"+sort1+"' or sort2='"+sort2+"') and pass='1' and unit_ID<>'"+unit_ID+"'";
        ResultSet rs1=distribute.executeQuery(sql1);//适合领域的专家的人数

        if(rs1.next())
        {//从适合领域的专家中随机选出5名
            int i=rs1.getInt("num");
            int k1=0,k2=0,k3=0,k4=0,k5=0;
            String expert[]={"","","","",""};
            String expertName[]=new String[5];out.println(i);
            if(i>0)
            {
                 String id[]=new String[i];
			String name[]=new String[i];
                 int j=0;
                 while(rs.next())
                 {
                     id[j]=rs.getString("identityID");
				name[j]=rs.getString("expert_name");
                     j++;
                 }

 
    		 k1=(int)(Math.random()*i);
                 expert[0]=id[k1];
			expertName[0]=name[k1];
            if(i>1)
            {
                 while(true)
                 {
                     k2=(int)(Math.random()*i);
                     if(k2!=k1) break;
                 }
                 expert[1]=id[k2];
			expertName[1]=name[k2];
            }
            if(i>2)
            {
                 while(true)
                 {
                     k3=(int)(Math.random()*i);
                     if(k3!=k1 && k3!=k2) break;
                 }
                 expert[2]=id[k3];
			expertName[2]=name[k3];
            }
            if(i>3)
            {
                 while(true)
                 {
                     k4=(int)(Math.random()*i);
                     if(k4!=k1 && k4!=k2 && k4!=k3) break;
                 }
                 expert[3]=id[k4];
			expertName[3]=name[k4];
            }
            if(i>4)
            {
                 while(true)
                 {
                     k5=(int)(Math.random()*i);
                     if(k5!=k1 && k5!=k2 && k5!=k3 && k5!=k4) break;
                 }
                 expert[4]=id[k5];
			expertName[4]=name[k5];
            }

            String sql3="delete from I_distribute where itemID='"+itemID+"'";
            distribute.executeUpdate(sql3);
            for(int k=0;k<5;k++)
            {
                 if(expert[k]=="");
                 else
                 {
                     String sql4="insert into I_distribute(itemID,item_name,identityID,expert_name) values('"+itemID+"','"+item_name+"','"+expert[k]+"','"+expertName[k]+"')";
                     distribute.executeUpdate(sql4);
                 }
            }
            }
        }
    }
    response.sendRedirect("z_disOK.jsp");
    }
%>