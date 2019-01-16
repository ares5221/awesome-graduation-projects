<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=GB2312"%>

<jsp:useBean class="firm.firm" id="distribute" scope="page"></jsp:useBean>
<%
    String itemID=request.getParameter("itemID");
    String item_name=new String(request.getParameter("item_name").getBytes("8859_1"));
    String sort1=new String(request.getParameter("sort1").getBytes("8859_1"));
    String sort2=new String(request.getParameter("sort2").getBytes("8859_1"));
    String identityID="";
    
    if(sort1=="")sort1=="nosort";
    if(sort2=="")sort2=="nosort";
    String sql="select identityID,expert_name from I_p_info where sort1='"+sort1+"' or sort1='"+sort2+"' or sort2='"+sort1+"' or sor2='"+sort2+"'";
    ResultSet rs=distribute.executeQuery(sql);//从专家库中选出适合领域的专家ID

    String sql1="select count(distinct distribute) from I_p_info where sort1='"+sort1+"' or sort1='"+sort2+"' or sort2='"+sort1+"' or sor2='"+sort2+"'";
    ResultSet rs1=distribute.executeQuery(sql1);//适合领域的专家的人数

    if(rs1.next())
    {//从适合领域的专家中随机选出5名
        int i=rs1.count(distrinct distribute);
        String id[]=new String[i];
        int j=0;
        while(rs.next())
        {
            id[j]=rs.identityID;
            j++;
        }

        int k1,k2,k3,k4,k5;
        k1=(int)(Math.random()*i);
        String expert1=id[k1];
        while(1)
        {
            k2=(int)(Math.random()*i);
            if(k2!=k1) break;
        }
        String expert2=id[k2];
        while(1)
        {
            k3=(int)(Math.random()*i);
            if(k3!=k1 && k3!=k2) break;
        }
        String expert3=id[k3];
        while(1)
        {
            k4=(int)(Math.random()*i);
            if(k4!=k1 && k4!=k2 && k4!=k3) break;
        }
        String expert4=id[k4];
        while(1)
        {
            k5=(int)(Math.random()*i);
            if(k5!=k1 && k5!=k2 && k5!=k3 && k5!=k4) break;
        }
        String expert5=id[k5];

        String sql2="insert into I_distribute(itemID,item_name,identityID) values('"+itemID+"','"+item_name+"','"+expert1+"') values('"+itemID+"','"+item_name+"','"+expert2+"') values('"+itemID+"','"+item_name+"','"+expert3+"') values('"+itemID+"','"+item_name+"','"+expert4+"') values('"+itemID+"','"+item_name+"','"+expert5+"')";
        distribute.executeUpdate(sql);
    }
%>