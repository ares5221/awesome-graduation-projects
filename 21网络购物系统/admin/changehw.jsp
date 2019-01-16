<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*,java.util.Date" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")!=null){
//--------------------------------------logged------------------------------------------------------------------
%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href=../css.css rel=STYLESHEET type=text/css>
</head>
<%!
String encode(String str)
 {
    String result;
    int l;
    if(str=="")
	{
       result="";
	}
    else
    {
    l=str.length();
	char[] chr=new char[l];
	str.getChars(0,l,chr,0);
    result="";
	int i;
	for(i=0;i<=l-1;i++)
	  {
	    
               switch(chr[i])
			    {

			    
	           case '<':
	                result=result+"&lt;";
					break;
	           case '>':
	                result=result+"&gt;";
			   break;

              case 10:
	                result=result+"<br>";
			  break;
			 
	           case 34:
	                result=result+"&quot;";
			   break;
	           case '&':
	                result=result+"&amp;";
			   break;
              case ' ':
			        result=result+"&nbsp;";	
			  break;
	               
	          case 9:
	                result=result+"    ";
			   break;
	           default:
	                result=result+String.valueOf(chr[i]);
				}
	  } 
	}
    return result;
  }
 %>
<%
int hw_id ,hw_cash,sort_id,hw_views,hw_buys,pifa,daili,Nsort_id;
String hw_name,hw_pic,hw_content,hw_content2,hw_sn,company,isbn,chubsh,zhuang,yeshu,action,kaiben;
boolean tuijian=false;
Date data,date;
data=new Date();
action=request.getParameter("action");
if(action!=null)//---------------------------action!=null-------------------------------------
 {   if(action.trim().equals("save"))
      {//--------------------------------action=save---------------------------------
	   boolean founderr=false;
	   String hw_ids ,hw_cashs,sort_ids,pifas,dailis,errmsg,datas,tuijians,Nsort_ids;
	   errmsg="错误信息:";
        hw_name=request.getParameter("hw_name");
       hw_content=request.getParameter("hw_content");
	   hw_content2=request.getParameter("hw_content2");
       hw_cashs=request.getParameter("hw_cash");
       hw_pic=request.getParameter("hw_pic");
	   chubsh=request.getParameter("chubsh");
	   zhuang=request.getParameter("zhuang");
	   yeshu=request.getParameter("yeshu");
	   isbn=request.getParameter("isbn");
       sort_ids=request.getParameter("sort_id");
       Nsort_ids=request.getParameter("Nsort_id");
       tuijians=request.getParameter("tuijian");
       company=request.getParameter("company");
       pifas=request.getParameter("pifa");
       dailis=request.getParameter("daili");
       hw_sn=request.getParameter("hw_sn");
       datas=request.getParameter("data");
       kaiben=request.getParameter("kaiben");
	   hw_ids=request.getParameter("hw_id");
       if (hw_cashs.equals(""))
       {   errmsg="<br>"+"<li>图书的价格不能为空";
        founderr=true;
        }
	    else{
	         hw_cash=Cint(hw_cashs);
	         if(hw_cash==0){
	             errmsg="<br>"+"<li>图书的价格为数字";
                  founderr=true;
	         }
	   }
	 if (pifas.equals(""))
      {   errmsg="<br>"+"<li>图书的价格不能为空";
        founderr=true;
      }
	 else{
	      pifa=Cint(pifas);
	       if(pifa==0){
	      errmsg="<br>"+"<li>图书的价格为数字";
          founderr=true;
	       }
	 }
	 if (dailis.equals(""))
     {   errmsg="<br>"+"<li>图书的价格不能为空";
        founderr=true;
     }
	 else{
	 daili=Cint(dailis);
	   if(daili==0){
	      errmsg="<br>"+"<li>图书的价格为数字";
          founderr=true;
	   }
	 }
    if(hw_name.equals(""))
	{
        errmsg=errmsg+"<br>"+"<li>图书名称不能为空";
        founderr=true;
    }
    if(hw_content.equals(""))
	{
        errmsg=errmsg+"<Br>"+"<li>图书介绍不能为空";
        founderr=true;
		
    }
    if(sort_ids.equals(""))
	{
        errmsg=errmsg+"<br>"+"<li>图书类别不能为空";
        founderr=true;
    }
    if(datas.length()!=10){
	    errmsg=errmsg+"<br>"+"<li>产品生产日期格式不正确";
        founderr=true;
	  }else
	 {
	    if(datas.indexOf('-')!=4||datas.lastIndexOf('-')!=7){
		  errmsg=errmsg+"<br>"+"<li>产品生产日期格式不正确";
          founderr=true;
		}
		else
		{
		int year=Cint(datas.substring(0,4));
		int month=Cint(datas.substring(5,7));
		int day=Cint(datas.substring(8));
		  if(month>12||day>31||month<=0||day<=0){
		      errmsg=errmsg+"<br>"+"<li>产品生产日期格式不正确";
             founderr=true;
		   }else{
		    data=new Date(year-1900,month-1,day);
		   }
		}
	  }
    
    if (hw_pic.equals("")){ hw_pic="img/noimage.gif";}
	if (hw_ids.equals(""))
	{   errmsg=errmsg+"<br>ID参数丢失";
	    founderr=true;
	}
    	if (tuijians.equals(""))
	{   errmsg=errmsg+"<br>推荐与否参数丢失";
	    founderr=true;
	}
   /* check to decide whether to carry the work                            */
     if(founderr==true)
	 {
        out.print(errmsg);
        out.print("<br>");
        out.print("<a href=addhw.jsp>返回</a>");
        
		}
    else
	{   
	    hw_id=Cint(hw_ids);
		sort_id=Cint(sort_ids);
		hw_cash=Cint(hw_cashs);
		daili=Cint(dailis);
		pifa=Cint(pifas);
		Nsort_id=Cint(Nsort_ids);
     
        hw_content=encode(hw_content);
	
        hw_content2=encode(hw_content2);            
      
		if(tuijians.equals("1")){
		  tuijian=true;
		}   
     
		sql="update hw set hw_name='"+getStr(hw_name)+"',hw_content='"+getStr(hw_content)+"',hw_content2='"+getStr(hw_content2);
		sql=sql+"',hw_cash="+hw_cash+",sort_id="+sort_id+",company='"+getStr(company)+"',daili="+daili+",pifa="+pifa;
		sql=sql+",hw_sn='"+getStr(hw_sn)+"',chubsh='"+getStr(chubsh)+"',kaiben='"+getStr(kaiben)+"',yeshu='"+getStr(yeshu)+"',data='"+data.toLocaleString()+"',isbn='"+getStr(isbn);
		sql=sql+"',zhuang='"+getStr(zhuang)+"',hw_pic='"+hw_pic+"',Nsort_id="+Nsort_id+",tuijian='"+tuijian+"' where hw_id="+hw_id;
        mdb.executeUpdate(sql);
		  out.print("商品修改成功!");
        out.print("<br>");
       out.print("<a href=delhw.jsp>返回</a>");
     }
  
   	}//----------------------------------end save---------------------------------------------------
    
   }
    else
  {//------------------------------------------ action==null--------------------------------------------------------------
     %>
	 <%@ include file="in-changehw.jsp" %>
	 <%
  }//----------------------------action== null end--------------------------------------------------------------
}
else
{
//--------------------------------------not logged------------------------------------------------------------------

response.sendRedirect("index.jsp");
}%>