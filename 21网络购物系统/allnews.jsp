<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*,java.util.*" %>
<%@ page autoFlush="true" errorPage="error.html"%>
<html>
<%@ include file="top.jsp"%>

<link href="css.css" rel="stylesheet" type="text/css">


          <div align="center">
            <center> 


          <table width="778" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#111111">
            <tr> 
                    <td width="0%" height="25" bgcolor="#989DA5" align="center">
                    <font color="#FFFFFF"><b>新闻热点</b></font></td>
                  </tr>
                  
   <%
int PageSize =10; //设置每张网页显示两条记录
int ShowPage = 1; //设置欲显示的页数
int RowCount = 0; //ResultSet的记录数目
int PageCount = 0; //ResultSet分页后的总页数
int duoyu=0;
sql="select * from news order by news_ID DESC";
rs=mdb.executeQuery(sql);
if(rs.next())
{  
  //建立ResultSet(结果集)对象，并执行SQL语句
    rs.last(); //将指标移至最后一笔记录
    RowCount=rs.getRow();
    duoyu=RowCount % PageSize;
    if(duoyu==0)
     {
          PageCount=RowCount/PageSize;
      }
     else{
      PageCount=(RowCount-duoyu)/PageSize;
       PageCount++;
      }
 // PageCount=((RowCount % PageSize) == 0?(RowCount/PageSize) : (RowCount/PageSize)+1);
  //计算显示的页数
    String ToPage = request.getParameter("ToPage");
    if(ToPage==""){ToPage="1";}
//判断是否可正确取得ToPage参数, 
//可取得则表示JSP网页应显示特定分页记录的语句
   if(ToPage!=""){
      ShowPage =Cint(ToPage); //取得指定显示的分页页数
   //下面的if语句将判断用户输入的页数是否正确
       if(ShowPage > PageCount)
       { //判断指定页数是否大于总页数, 是则设置显示最后一页
           ShowPage = PageCount;
       }
      else if(ShowPage <= 0)
       { //若指定页数小于0, 则设置显示第一页的记录
              ShowPage = 1;
        }
    }
rs.absolute((ShowPage - 1) * PageSize+1); 
//计算欲显示页的第一笔记录位置
%>                       
  <!----------------------one showing unit------------------------------->
<%
 //利用For循环配合PageSize属性输出一页中的记录
   int i=1,news_id,linshi=1;
  linshi=ShowPage;
  rs.previous();
   String news_title;
  while(rs.next()&i<= PageSize)
 {
     i++;
     news_id=rs.getInt("news_id");
     news_title=rs.getString("news_title");
      if(news_title.length()>20)
      {
          news_title.substring(0,20);
          news_title=news_title+"...";
       }
 
%>
<tr> 
                    <td height="2"> 
<img src="img/pics/biao.gif" width="15" height="18">&nbsp;<a href="news.jsp?news_id=<%=news_id%>"><%=news_title%>……&nbsp;(<%=rs.getDate("news_date").toLocaleString()%>) 
 
                          </td>
 </tr>
 <%
//下面的if判断语句用于防止输出最后一页记录时, 
//将记录指标移至最后一笔记录之后
 //跳出for循环
   }
 %>
<!-----------------------shonwing unit end----------------------------------------------->
                                        
                
                     
<tr> 
                      <td width=478 height="23"> 
                        <p align="right">第<%=ShowPage%>页/共<%=PageCount%>页,<%=RowCount%>条新闻&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<%
                 linshi=ShowPage-1;
				 if(linshi>0)
				 {%><a href="allnews.jsp?ToPage=<%=linshi%>">上一页</a> 
<%
				 }else
				{%>
                          上一页 
                <%}		  linshi=ShowPage+1;
				if(linshi<=PageCount)
				{%>
                          <a href="allnews.jsp?ToPage=<%=linshi%>">下一页</a> 
                          <%
				}else
						  {%>
                          下一页 
                <%}%>
	
                          </font></p>
<%
}
else
{//数据库中无新闻
     out.print("对不起,没有新闻!");
}
%>
                     
                      </table>
            </center>
</div>

<%@ include file="copy.jsp"%>
</body>
</html>