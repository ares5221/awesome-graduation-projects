<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")==null){
	;}else{
%>
<%
sql="select title,id,msg from pub  order by id desc";
rs=mdb.executeQuery(sql);
%>

<html>
<head>
<title>公告管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href=../css.css rel=STYLESHEET type=text/css>

</head>

<body bgcolor="#FFFFFF">
<center>
<table width="600" bordercolor="#FFFFFF">
    <tr> 
      <td width="60%" bordercolor="#ffcc99" rowspan="2">
        <table width="311" border="1" cellspacing="0" bordercolor="#C0C0C0" style="border-collapse: collapse" cellpadding="0">
          <%while(rs.next()){%>
          <tr> 
            <td bordercolor="#C0C0C0" width="196" bgcolor="#FFFFFF">
              <div align="center"><%=rs.getString("title")%></div>
            </td>
            <td bordercolor="#C0C0C0" width="105" bgcolor="#FFFFFF"> 
              <div align="center"><a href="ggdel.jsp?id=<%=rs.getInt("id")%>"><font color="#FF0000">删除</font></a></div>
            </td>
          </tr>
          <tr> 
            <td bordercolor="#C0C0C0" colspan="2"><%=rs.getString("msg")%>　</td>
          </tr>
          <%
			}
        %>
        </table>
      </td>
      <td height="220"> 
        <div align="center"> 
          <form method="post" action="gg2.jsp">
            <table width="200" border="1" bordercolor="#C0C0C0" cellspacing="0" height="200" style="border-collapse: collapse" cellpadding="0">
              <tr bordercolor="#FFFFFF"> 
                <td> 
                  <div align="center">发布新公告</div>
                </td>
              </tr>
              <tr> 
                <td> 
                  <div align="center">主题</div>
                </td>
              </tr>
              <tr bordercolor="#FFFFFF"> 
                <td> 
                  <div align="center"> 
                    <input type="text" name="title" size="20">
                  </div>
                </td>
              </tr>
              <tr> 
                <td> 
                  <div align="center">公告内容 </div>
                </td>
              </tr>
              <tr bordercolor="#FFFFFF"> 
                <td> 
                  <div align="center"> 
                    <textarea name="msg" wrap="VIRTUAL" rows="6" cols="20"></textarea>
                  </div>
                </td>
              </tr>
              <tr bordercolor="#FFFFFF"> 
                <td> 
                  <div align="center"> 
                    <input type="submit" class="buttonface" name="Submit" style="position: relative; height: 19" value="确 定">&nbsp;&nbsp;
                    <input type="reset" class="buttonface" name="Submit2" style="position: relative; height: 19" value="重 置">
                  </div>
                </td>
              </tr>
            </table>
          </form>
        </div>
      </td>
    </tr>
  </table>
</center>
</body>
</html>
<%
						mdb.Close();}%>