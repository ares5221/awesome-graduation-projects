<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")==null){
	;}else{
%>
<head>
<style type=text/css>
td  { font:normal 12px 宋体; }
img  { vertical-align:bottom; border:0px; }
a  { font:normal 12px 宋体; color:#000000; text-decoration:none; }
a:hover  { color:#428EFF;text-decoration:underline; }
.sec_menu  { border-left:1px solid white; border-right:1px solid white; border-bottom:1px solid white; overflow:hidden; background:#D6DFF7; }
.menu_title  { }
.menu_title span  { position:relative; top:2px; left:8px; color:#215DC6; font-weight:bold; }
.menu_title2  { }
.menu_title2 span  { position:relative; top:2px; left:8px; color:#428EFF; font-weight:bold; }
</style>
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
	String action=request.getParameter("action");
if(action==null)
	action="notsave";
if(action.equals("save")){
   
    String news_title=getStr((request.getParameter("news_title")).trim());
    String news_content=getStr(request.getParameter("news_content"));
    if(news_title=="" || news_content=="")
        out.print("输入数据不能为空<br><a href=addnews.jsp>返回</a>");
    else{
        String n_c=encode(news_content);
        
		sql="insert into news(news_title,news_content,news_date) values('"+news_title+"','"+n_c+"',now())";
        mdb.executeInsert(sql);
        out.print("新闻添加完成<br><a href=addnews.jsp>返回</a>");
    }
}else{%>
<body style="background-color: #808080">

<table border="0" width="100%" cellspacing="1">
  <tr>
    <td width="100%">
      <form method="POST" action="addnews.jsp?action=save">
        <table border="0" width="100%" cellspacing="1">
          <tr>
            <td width="100%">　</td>
          </tr>
          <tr>
            <td width="100%"><font color="#FFFFFF">新闻标题</font><input type="text" name="news_title" size="20" class=input></td>
          </tr>
          <tr>
            <td width="100%"><font color="#FFFFFF">新闻内容</font></td>
          </tr>
          <tr>
            <td width="100%"><textarea rows="14" name="news_content" cols="79" class=input></textarea></td>
          </tr>
        </table>
        <p><input type="submit" value="提交" name="B1" class=input><input type="reset" value="全部重写" name="B2" class=input></p>
      </form>
      <p>　</td>
  </tr>
</table>
<%mdb.Close();}
	}
%>