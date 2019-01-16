<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="mdb" class="ckstudio.db.mysqlconn" scope="page"/>
<%
if(session.getAttribute("user_name")==null){%><br>1.你尚未登录!请登录后再订购本站商品!<br>2.第一次来本站，请先注册会员（免费）!<br><br>
<%}else{
%>
<link href="css.css" rel="stylesheet" type="text/css">
<script>
  function openbag(id) { window.open("submore.jsp?sub_id="+id,"","height=400,width=600,left=190,top=0,resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no");} 
</script><head>
<title>订单列表</title>
<link href=css.css rel=STYLESHEET type=text/css>
</head>
<table border="0" width="100%" cellspacing="0" style="border-collapse: collapse" cellpadding="0">
      <tr>
        <td width="100%" colspan="4">
        <img border="0" src="img/promo_list_top.gif" width="100%" height="4"></td>
      </tr>
      <tr>
        <td width="100%" colspan="4" bgcolor="#989DA5" height="25" align="center">
        <b><font color="#FF0000">未处理订单 </font>&nbsp;<a href="submitsub.jsp"><font color="#FFFFFF">点击查看已处理订单</font></a></b></td>
      </tr>
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
<%String mypage;
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

String sql;
sql="select * from sub where user_name='"+session.getValue("user_name")+"' and sub_check='false'";
ResultSet rs;
rs=mdb.executeQuery(sql);
if(!rs.next())
    out.print("暂且没有任何订单");
else{
	int PageSize =10; //设置每张网页显示两条记录
int ShowPage = 1; //设置欲显示的页数
int RowCount = 0; //ResultSet的记录数目
int PageCount = 0; //ResultSet分页后的总页数
int duoyu=0;

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

rs.absolute((ShowPage - 1) * PageSize + 1); 
//计算欲显示页的第一笔记录位置
/**
    rs.pagesize=10
    totalrec=rs.recordcount
    totalpage=rs.pagecount
    if page>totalpage then page=totalpage
    rs.absolutepage=page
    rs.cachesize=rs.pagesize
    i=0
    dim sub_id(),user_name(),sub_number(),sub_adds(),sub_date()
    do while not rs.eof and (i<rs.pagesize)
        i=i+1
        redim preserve sub_id(i),user_name(i),sub_number(i),sub_adds(i),sub_date(i)
        sub_id(i)=rs("sub_id")
        user_name(i)=rs("user_name")
        sub_number(i)=rs("sub_number")
        sub_adds(i)=rs("sub_adds")
        sub_date(i)=rs("sub_date")
        rs.movenext
    loop
    rs.close
	**/
    %>
    

      <tr>
        <td width="100%" colspan="4" bgcolor="#ECECEC" height="20">共<font color=red><%=PageCount%></font>页 第<%=intpage%>页         
                      <font color=666666><%if(intpage-1>0){%><a href="subpass.jsp?page=<%=intpage-1%>">上一页</a><%}else{%>上一页<%}%><%if (intpage+1<=PageCount){%><a href="subpass.jsp?page=<%=intpage+1%>">下一页</a><%}else{%>下一页</font><%}
%></td>
      </tr>
      <tr>
        <td width="25%" bgcolor="#ECECEC" height="20">订单号</td>
        <td width="25%" bgcolor="#ECECEC" height="20">订货人</td>
        <td width="25%" bgcolor="#ECECEC" height="20">地址</td>
        <td width="25%" bgcolor="#ECECEC" height="20">日期</td>
      </tr>
    <%int i=1;
rs.previous();
	while(rs.next()&&i<=PageSize){
		i++;
		int sub_id=rs.getInt("sub_id");
		String sub_number=rs.getString("sub_number");
		String user_name=rs.getString("user_name");
		String sub_adds=rs.getString("sub_adds");
		Date sub_date=rs.getDate("sub_date");
		%>
      <tr>
        <td width="25%" bgcolor="#ECECEC" height="20"><a href='javascript:openbag(<%=sub_id%>)'><%=sub_number%></a>　</td>
        <td width="25%" bgcolor="#ECECEC" height="20"><%=user_name%>　</td>
        <td width="25%" bgcolor="#ECECEC" height="20"><%=sub_adds%>　</td>
        <td width="25%" bgcolor="#ECECEC" height="20"><%=sub_date%>　</td>
      </tr>
      <%
			}%>
      <tr>
        <td width="100%" colspan="4" bgcolor="#ECECEC" height="20">共<font color=red><%=PageCount%></font>页 第<%=intpage%>页         
                      <font color=666666><%if(intpage-1>0){%><a href="subpass.jsp?page=<%=intpage-1%>">上一页</a><%}else{%>上一页<%}%>　<%if (intpage+1<=PageCount){%><a href="subpass.jsp?page=<%=intpage+1%>">下一页</a><%}else{%>下一页</font><%
			}%></td>
      </tr>
    </table>
<%}
	}
	mdb.Close();%>