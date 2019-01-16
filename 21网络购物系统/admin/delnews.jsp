<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")==null){
	;}else{
%>
<head>
<link href=../css.css rel=STYLESHEET type=text/css>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
</head>
<%!
 boolean IsInt(String NInt)
   {
    try {
	  int n;
      n=Integer.parseInt(NInt);
	  return true;
        }
       catch(NumberFormatException e){
                 return false;
        }
}
%>
<%
String action=request.getParameter("action");
if(action==null)
	action="notdel";
if(action.equals("del")){
	int news_id=Integer.parseInt(request.getParameter("news_id"));
    sql="select * from news where news_id="+news_id+"";
    rs=mdb.executeQuery(sql);
    if(!rs.next())
       response.sendRedirect("delnews.jsp");
    else{
        sql="delete from news where news_id="+news_id+"";
        mdb.executeDelete(sql);
        out.print("内容删除完毕<Br><a href=delnews.jsp>返回</a>");
	}
}else{
%>



<table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
      <div align="center">
        <center>
      <table border="1" width="550" cellspacing="0" bordercolor="#C0C0C0" style="border-collapse: collapse" cellpadding="0">
        <%
String mypage;
int intpage=1;
mypage=request.getParameter("page");

if(mypage=="")
intpage=1;

if(!IsInt(mypage))
intpage=1;

if(IsInt(mypage))
intpage=Integer.parseInt(mypage);

if(intpage<1)
intpage=1;

mypage=Integer.toString(intpage);
  
  sql="select * from news order by news_id DESC";
  rs=mdb.executeQuery(sql);
if(!rs.next()){
%>
        <tr bgcolor="#FFFFFF"> 
          <td width="55">编号</td>
          <td colspan="3">标题</td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td colspan="4">没有内容</td>
        </tr>
        <%}else{
  int PageSize =20; //设置每张网页显示两条记录
int ShowPage = 1; //设置欲显示的页数
int RowCount = 0; //ResultSet的记录数目
int PageCount = 0; //ResultSet分页后的总页数
int duoyu=0;
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
//String ToPage = request.getParameter("ToPage");
//if(ToPage==""){ToPage="1";}
//判断是否可正确取得ToPage参数, 
//可取得则表示JSP网页应显示特定分页记录的语句
//if(ToPage!=""){
   ShowPage=intpage; //取得指定显示的分页页数
   //下面的if语句将判断用户输入的页数是否正确
  if(ShowPage>PageCount)
   { //判断指定页数是否大于总页数, 是则设置显示最后一页
    ShowPage=PageCount;
   }
   else if(ShowPage<=0)
   { //若指定页数小于0, 则设置显示第一页的记录
     ShowPage = 1;
   }
}
rs.absolute((ShowPage - 1) * PageSize + 1); 
  %>
        <tr bgcolor="#6894d8"> 
          <td width="55" bgcolor="#808080"> 
            <div align="center"><font color="#FFFFFF">编号</font></div>
          </td>
          <td width="399" bgcolor="#808080"> 
            <div align="center"><font color="#FFFFFF">标题</font></div>
          </td>
          <td colspan="2" bgcolor="#808080"> 
            <div align="center"><font color="#FFFFFF">操作</font></div>
          </td>
        </tr>
        <%int i=1;
rs.previous();
	while(rs.next()&&i<=PageSize){
		
		i++;
		int news_id=rs.getInt("news_id");
		String news_title=rs.getString("news_title");
		
%>
        <tr bgcolor="#FFFFFF"> 
          <td width="55" height="20"><%=news_id%></td>
          <td width="399" height="20"><%=news_title%></td>
          <td width="43" height="20"> 
            <div align="center"><a href="delnews.jsp?news_id=<%=news_id%>&action=del">删除</a></div>
          </td>
          <td width="40" height="20"> 
            <div align="center"><a href="editnews.jsp?news_id=<%=news_id%>">修改</a></div>
          </td>
        </tr>
        <%}%>
      </table>
        </center>
      </div>
    </td>
  </tr>
</table>
<div align="center">共<font color=red><%=PageCount%></font>页 第<%=intpage%>页 <font color=666666> 
  <%if(intpage-1>0){%>
  <a href="delnews.jsp?page=<%=intpage-1%>">上一页</a> 
  <%}else{%>
  <font color=666666>上一页</font> 
  <%}%>
  　 
  <%if(intpage+1<=PageCount){%>
  <a href="delnews.jsp?page=<%=intpage+1%>">下一页</a> 
  <%}else{%>
  <font color=666666>下一页</font> 
  <%}%>
  </font><br>
  <%}
}
mdb.Close();
	}
%>
</div>