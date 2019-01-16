<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>
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
			  case 13:
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
int news_id=Integer.parseInt(request.getParameter("news_id"));
String news_title=getStr((request.getParameter("news_title")).trim());
String news_content=getStr(request.getParameter("news_content"));
if(news_title=="" || news_content=="")
        out.print("输入数据不能为空<br><a href=addnews.jsp>返回</a>");
    else{
String n_c=encode(news_content);

sql="update news set news_title='"+news_title+"',news_content='"+n_c+"' where news_id="+news_id+"";
mdb.executeUpdate(sql);

out.print("新闻修改成功!<br><a href=delnews.jsp>返回</a>");
	mdb.Close();
	}
	
%>