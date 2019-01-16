<%@ page language="java"  contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%
    String getLoginmessage=(String)session.getValue("loginSign");
    String unit_ID=(String)session.getValue("unitID");    
    if(getLoginmessage!="OK")
    {
        response.sendRedirect("index2.jsp");
    }
%>
<jsp:useBean class="firm.firm" id="s_itemDeclare" scope="page"></jsp:useBean>
<%
    String ssql="select * from I_itemSetup";
    ResultSet srs=s_itemDeclare.executeQuery(ssql);
    java.util.Date today=new java.util.Date();
    java.util.Date s_beginDate=new java.util.Date();
    java.util.Date s_finishDate=new java.util.Date();
    if(srs.next())
    {
	s_beginDate=srs.getDate("s_beginDate");
	s_finishDate=srs.getDate("s_finishDate");
    }
    if(today.before(s_beginDate) || today.after(s_finishDate))
    {
        response.sendRedirect("timeOut.jsp");
    }
%>

<%
    String item_name=new String(request.getParameter("item_name").getBytes("8859_1"));
    String isort[]=request.getParameterValues("SelectedIndustry[]");
    String begin_year=new String(request.getParameter("begin_year").getBytes("8859_1"));
    String begin_month=new String(request.getParameter("begin_month").getBytes("8859_1"));
    String finish_year=new String(request.getParameter("finish_year").getBytes("8859_1"));
    String finish_month=new String(request.getParameter("finish_month").getBytes("8859_1"));
    String applicant=new String(request.getParameter("applicant").getBytes("8859_1"));
    String grade=new String(request.getParameter("grade").getBytes("8859_1"));
    String education=new String(request.getParameter("education").getBytes("8859_1"));
    String unit_name=new String(request.getParameter("unit_name").getBytes("8859_1"));
    String fill_year=new String(request.getParameter("fill_year").getBytes("8859_1"));
    String fill_month=new String(request.getParameter("fill_month").getBytes("8859_1"));
    String fill_day=new String(request.getParameter("fill_day").getBytes("8859_1"));
    String purport=new String(request.getParameter("purport").getBytes("8859_1"));
    String status=new String(request.getParameter("status").getBytes("8859_1"));
    String future=new String(request.getParameter("future").getBytes("8859_1"));
    String point=new String(request.getParameter("point").getBytes("8859_1"));
    String analysis=new String(request.getParameter("analysis").getBytes("8859_1"));
    String way=new String(request.getParameter("way").getBytes("8859_1"));
    String moment=new String(request.getParameter("moment").getBytes("8859_1"));
    String result=new String(request.getParameter("result").getBytes("8859_1"));
	String sort[]={"",""};
	for(int i=0;i<isort.length;i++)
	{
	    sort[i]=isort[i];
	}
	//经费预算
    String[] outItem=new String[15];
    String[] money=new String[15];
	String outItem1=new String(request.getParameter("outItem1").trim().getBytes("8859_1"));
        //付值
        outItem[0]=outItem1;
	String money1=new String(request.getParameter("money1").getBytes("8859_1"));
	money[0]=money1;
	String outItem2=new String(request.getParameter("outItem2").trim().getBytes("8859_1"));        
        outItem[1]=outItem2;
	String money2=new String(request.getParameter("money2").getBytes("8859_1"));
	money[1]=money2;
	String outItem3=new String(request.getParameter("outItem3").trim().getBytes("8859_1"));        
        outItem[2]=outItem3;
	String money3=new String(request.getParameter("money3").getBytes("8859_1"));
	money[2]=money3;
	String outItem4=new String(request.getParameter("outItem4").trim().getBytes("8859_1"));        
        outItem[3]=outItem4;
	String money4=new String(request.getParameter("money4").getBytes("8859_1"));
	money[3]=money4;
	String outItem5=new String(request.getParameter("outItem5").trim().getBytes("8859_1"));        
        outItem[4]=outItem5;
	String money5=new String(request.getParameter("money5").getBytes("8859_1"));
	money[4]=money5;
	String outItem6=new String(request.getParameter("outItem6").trim().getBytes("8859_1"));        
        outItem[5]=outItem6;
	String money6=new String(request.getParameter("money6").getBytes("8859_1"));
	money[5]=money6;
	String outItem7=new String(request.getParameter("outItem7").trim().getBytes("8859_1"));        
        outItem[6]=outItem7;
	String money7=new String(request.getParameter("money7").getBytes("8859_1"));
	money[6]=money7;
	String outItem8=new String(request.getParameter("outItem8").trim().getBytes("8859_1"));        
        outItem[7]=outItem8;
	String money8=new String(request.getParameter("money8").getBytes("8859_1"));
	money[7]=money8;
	String outItem9=new String(request.getParameter("outItem9").trim().getBytes("8859_1"));        
        outItem[8]=outItem9;
	String money9=new String(request.getParameter("money9").getBytes("8859_1"));
	money[8]=money9;
	String outItem10=new String(request.getParameter("outItem10").trim().getBytes("8859_1"));        
        outItem[9]=outItem10;
	String money10=new String(request.getParameter("money10").getBytes("8859_1"));
	money[9]=money10;
	String outItem11=new String(request.getParameter("outItem11").trim().getBytes("8859_1"));        
        outItem[10]=outItem11;
	String money11=new String(request.getParameter("money11").getBytes("8859_1"));
	money[10]=money11;
	String outItem12=new String(request.getParameter("outItem12").trim().getBytes("8859_1"));        
        outItem[11]=outItem12;
	String money12=new String(request.getParameter("money12").getBytes("8859_1"));
	money[11]=money12;
	String outItem13=new String(request.getParameter("outItem13").trim().getBytes("8859_1"));        
        outItem[12]=outItem13;
	String money13=new String(request.getParameter("money13").getBytes("8859_1"));
	money[12]=money13;
	String outItem14=new String(request.getParameter("outItem14").trim().getBytes("8859_1"));        
        outItem[13]=outItem14;
	String money14=new String(request.getParameter("money14").getBytes("8859_1"));
	money[13]=money14;
	outItem[14]="合计";
	String money15=new String(request.getParameter("money15").trim().getBytes("8859_1"));
	money[14]=money15;

	
    String reference=new String(request.getParameter("reference").getBytes("8859_1"));
    String market=new String(request.getParameter("market").getBytes("8859_1"));	
    String commend_mind=new String(request.getParameter("commend_mind").getBytes("8859_1"));	
    
    String begin_date=begin_year+"-"+begin_month+"-01";
    String finish_date=finish_year+"-"+finish_month+"-01";
    String fill_date=fill_year+"-"+fill_month+"-"+fill_day;
    
    String sql="insert into I_s_item(unit_ID,item_name,sort1,sort2,begin_date,finish_date,applicant,grade,education,unit_name,fill_date,purport,status,future,point,analysis,way,moment,result,reference,market,commend_mind) values('"+unit_ID+"','"+item_name+"','"+sort[0]+"','"+sort[1]+"','"+begin_date+"','"+finish_date+"','"+applicant+"','"+grade+"','"+education+"','"+unit_name+"','"+fill_date+"','"+purport+"','"+status+"','"+future+"','"+point+"','"+analysis+"','"+way+"','"+moment+"','"+result+"','"+reference+"','"+market+"','"+commend_mind+"')";
    s_itemDeclare.executeUpdate(sql);
    String sql1="select itemID from I_s_item where unit_ID='"+unit_ID+"' and item_name='"+item_name+"'";
    ResultSet rs=s_itemDeclare.executeQuery(sql1);
	String itemID="";
    if(rs.next()){itemID=rs.getString("itemID");}
    int i;
    for(i=0;i<14;i++)
    {
        if(outItem[i].length()<1);
        else
        {
            String sql2="insert into I_s_money(itemID,outItem,sMoney) values('"+itemID+"','"+outItem[i]+"','"+money[i]+"')";
	    s_itemDeclare.executeUpdate(sql2);
        }
    }    

        response.sendRedirect("s_showItem.jsp?itemID="+itemID);
%>