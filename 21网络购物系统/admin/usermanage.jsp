<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href=../css.css rel=STYLESHEET type=text/css>
</head>
<script>
  function user(id) { window.open("viewuser.asp?user_id="+id,"","height=400,width=600,left=190,top=0,resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no");} 
</script>
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
if(session.getAttribute("admin_name")==null){
;}else{
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#808080" height="77"> 
      <table width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr bgcolor="688cb8"> 
          <td width="7%" height="17" bgcolor="#808080"> 
            <div align="center"><font color="#FFFFFF">ID</font></div>
          </td>
          <td width="9%" height="17" bgcolor="#808080"> 
            <div align="center"><font color="#FFFFFF">用户名</font></div>
          </td>
          <td width="14%" height="17" bgcolor="#808080"> 
            <div align="center"><font color="#FFFFFF">E-mail </font></div>
          </td>
          <td width="11%" height="17" bgcolor="#808080"> 
            <div align="center"><font color="#FFFFFF">邮政编码</font></div>
          </td>
          <td width="18%" height="17" bgcolor="#808080"> 
            <div align="center"><font color="#FFFFFF">地址</font></div>
          </td>
          <td width="11%" height="17" bgcolor="#808080"> 
            <div align="center"><font color="#FFFFFF">注册时间</font></div>
          </td>
          <td width="8%" height="17" bgcolor="#808080"> 
            <div align="center"><font color="#FFFFFF">类型</font></div>
          </td>
          <td width="10%" height="17" bgcolor="#808080"> 
            <div align="center"><font color="#FFFFFF">删除</font></div>
          </td>
          <td width="12%" bgcolor="#808080" height="17"> 
            <div align="center"><font color="#FFFFFF">升级成VIP</font></div>
          </td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
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

sql="select * from member order by user_id desc";
rs=mdb.executeQuery(sql);
if(!rs.next()){
%>
          <td colspan="9">暂且没有任何用户注册</td>
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

int i=1;
rs.previous();
	while(rs.next()&&i<=PageSize){
		
		i++;
		int user_id=rs.getInt("user_id");
		String user_mail=rs.getString("user_mail");
		String user_name=rs.getString("user_name");
		String user_adds=rs.getString("user_adds");
		String user_postcode=rs.getString("user_postcode");
		Date user_regtime=rs.getDate("user_regtime");
		String user_type=rs.getString("user_type");
%>
        <tr bgcolor="#FFFFFF"> 
          <td width="7%" height="15"><%=user_id%> 
            <div align="center"></div>
          </td>
          <td width="9%" height="15"><%=user_name%> 
            <div align="center"></div>
          </td>
          <td width="14%" height="15"><%=user_mail%> 
            <div align="center"></div>
          </td>
          <td width="11%" height="15"><%=user_postcode%> 
            <div align="center"></div>
          </td>
          <td width="18%" height="15"> 
            <div align="center"><%=user_adds%></div>
          </td>
          <td width="11%" height="15"><%=user_regtime%> </td>
          <td width="8%" height="15"><%=user_type%> </td>
          <td width="10%" height="15"> 
            <div align="center"><a href="viewuser.jsp?user_id=<%=user_id%>&action=deluser">删除</a></div>
          </td>
          <td width="12%" height="15"> 
            <div align="center"><a href="sheng.jsp?user_id=<%=user_id%>&action=up">升级</a> 
            </div>
          </td>
        </tr>
        <%}
%>
        <tr bgcolor="#FFFFFF" align="right"> 
          <td colspan="9" height="2"> 
            <p align="left">共<font color=red><%=PageCount%></font>页 第<%=intpage%>页 
              <font color=666666> 
              <%if(intpage-1>0){%>
              <a href="usermanage.jsp?page=<%=intpage-1%>">上一页</a> 
              <%}else{%>
              <font color=666666>上一页</font> 
              <%}%>
              　 
              <%if(intpage+1<=PageCount){%>
              <a href="usermanage.jsp?page=<%=intpage+1%>">下一页</a> 
              <%}else{%>
              <font color=666666>下一页</font> 
              <%}%>
              </font></p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<%
}
mdb.Close();}
%>