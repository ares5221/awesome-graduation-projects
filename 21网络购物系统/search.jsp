<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="top.jsp"%>
<link href="css.css" rel="stylesheet" type="text/css">
        <div align="center">
          <center>
        <table width="500" border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 6; border-collapse:collapse" bordercolor="#111111">
          <tr> 
            <td width="99%" align="center" bgcolor="#989DA5" height="25"><b>搜索结果</b></td>
          </tr>
          <tr> 
            <td height="100" colspan="2" bgcolor="#ECECEC"> <div align="center"></div>
              <table border="0" width="300" cellspacing="0" cellpadding="0" height="5" align="center">
                <%String hw_name,sort_id;
				  if(session.getAttribute("sort_id")==null){
                  hw_name=getStr(request.getParameter("hw_name"));
                  sql="select * from hw where hw_name like '%"+hw_name+"%' order by hw_id DESC";
				  rs=mdb.executeQuery(sql);
				  }
				  else{
                    sort_id=request.getParameter("sort_id");
                    hw_name=getStr(request.getParameter("hw_name"));
                    sql="select * from hw where sort_id='"+sort_id+"' and hw_name like '%"+hw_name+"%' order by hw_id DESC";
					rs=mdb.executeQuery(sql);
				  }


    if(!rs.next()){
    %>
                <tr> 
                  <td width="380">没有你要找的商品，请先确定商品的类别</td>
                </tr>
                <%}
		else{rs.previous();
			%>
                <tr> 
                  <td>　</td>
                </tr>
                <%while(rs.next()){%>
                <tr> 
                  <td><a href="views.jsp?hw_id=<%=rs.getString("hw_id")%>"><b class="dz1"><%=rs.getString("hw_name")%></b></a></td>
                </tr>
                <%
			}
		}%>
              </table>
              <br> <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td valign="middle"><div align="center"><img src="img/pics/seperator.gif" width="359" height="1"></div></td>
                </tr>
              </table>
              <br> </td>
          </tr>
        </table>
          </center>
</div>
<%@ include file="copy.jsp"%>