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

<%
String action=request.getParameter("action");
if(action!=null)
{   action=action.trim();
   if(action.equals("del"))
   {int n=0;
    sql="delete * from hw where hw_id="+Cint(request.getParameter("hw_id"));
    mdb.executeDelete(sql);
    out.print("货物删除成功");
    out.print("<br>");
    out.print ("<a href=delhw.jsp>返回</a>");
	}
}else
{
%>

<div align="center">
  <center>

<table width="550" border="0" cellspacing="0" cellpadding="0" bgcolor="#808080" style="border-collapse: collapse" bordercolor="#111111" >
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="1" cellpadding="0" height="73" align="center">
            <!--DWLayoutTable-->
            <tr> 
              <td width="123" height="20" valign="top" bgcolor="#808080"> 
                <div align="center"><font color="#FFFFFF">商品名称</font></div></td>
              <td width="80" valign="top" bgcolor="#808080"> <div align="center"><font color="#FFFFFF">作者 
                  </font> </div></td>
              <td width="78" valign="top" bgcolor="#808080"> 
                <div align="center"><font color="#FFFFFF">会员价</font></div></td>
              <td width="75" valign="top" bgcolor="#808080">
<div align="center"><font color="#FFFFFF">ISBN号码</font></div></td>
              <td width="103" valign="top" bgcolor="#808080"> <div align="center"><font color="#FFFFFF">加入日期</font></div></td>
              <td colspan="3" valign="top" bgcolor="#808080"> <div align="center"><font color="#FFFFFF">操作</font></div></td>
            </tr>
            <%
int PageSize =20; //设置每张网页显示两条记录
int ShowPage = 1; //设置欲显示的页数
int RowCount = 0; //ResultSet的记录数目
int PageCount = 0; //ResultSet分页后的总页数
int duoyu=0;
sql="select * from hw order by hw_id DESC";
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
       } else if(ShowPage <= 0)
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
   int i=1,linshi=1;
  linshi=ShowPage;
  rs.previous();
   String hw_sn,isbn;
   int hw_id;
  while(rs.next()&i<= PageSize)
 {
     i++;
     hw_id=rs.getInt("hw_id"); 
%>
            <tr bgcolor="#FFFFFF"> 
              <td height="18" valign="middle"><%=rs.getString("hw_name")%> </td>
              <td valign="middle"> 
                <div align="center"><%=rs.getString("hw_sn")%></div></td>
              <td valign="middle"> 
                <div align="center"><%=rs.getInt("hw_cash")%></div></td>
              <td valign="middle"> 
                <div align="center"><%=rs.getString("isbn")%></div></td>
              <td valign="middle"> 
                <div align="center"><%=rs.getDate("hw_date")%></div></td>
              <td width="42" valign="middle"> 
                <div align="center"> <a href="delhw.jsp?hw_id=<%=hw_id%>&action=del">删除</a></div></td>
              <td colspan="2" valign="middle"> 
                <div align="center"><a href="changehw.jsp?hw_id=<%=hw_id%>&sort_id=<%=rs.getInt("sort_id")%>&Nsort_id=<%=rs.getInt("Nsort_id")%>">修改</a> 
                </div></td>
            </tr>
            <%
//下面的if判断语句用于防止输出最后一页记录时, 
//将记录指标移至最后一笔记录之后
 //跳出for循环
   }
 %>
            <!-----------------------shonwing unit end----------------------------------------------->
            <tr> 
              <td height="20" colspan="7" valign="middle"> 
                <div align="center">第<%=ShowPage%>页/共<%=PageCount%>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <%
                 linshi=ShowPage-1;
				 if(linshi>0)
				 {%>
                  <a href="delhw.jsp?ToPage=<%=linshi%>">上一页</a> 
                  <%
				 }else
				{%>
                  上一页 
                  <%}		  linshi=ShowPage+1;
				if(linshi<=PageCount)
				{%>
                  <a href="delhw.jsp?ToPage=<%=linshi%>">下一页</a> 
                  <%
				}else
						  {%>
                  下一页 
                  <%}%></font>
                  </div></td>
              <td width="11">&nbsp;</td>
            </tr>
            <tr> 
              <td height="2"></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td width="29"></td>
              <td></td>
            </tr>
            <%
			rs.close();
}
else
{//数据库中无新闻
     out.print("对不起,没有产品!");
}
%>
          </table>
    </td>
  </tr>
</table>
  </center>
</div>

<%
}
mdb.Close();
%>

<%}
else{
//--------------------------------------not logged------------------------------------------------------------------

response.sendRedirect("index.jsp");
}%>