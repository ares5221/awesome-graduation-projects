<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>
<%
if(session.getAttribute("admin_name")==null){
	;}else{
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../img/css.css" rel="stylesheet" type="text/css">
<style>
td{font-size:9pt;line-height:120%;color:#353535} 
body{font-size:9pt;line-height:120%} 

a:link          { color: #000000; text-decoration: none }
a:visited       { color: #000000; text-decoration: none }
a:active        { color: #000000; text-decoration: none }
a:hover         { color: #336699; text-decoration: none; position: relative; right: 0px; top: 1px }
</style>
</head>

<body>
<div align="center">
  <center>
<table width="80%" border="1" cellspacing="0" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse">
  <tr> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="9" rowspan="2"></td>
          <td class="12v"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="12v">
              <tr> 
                <td class="12v" > 
                  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" id="AutoNumber3" height="0" width="100%">
                    <tr> 
                      <td> 
                        <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                          <tr> 
                            <td bgcolor="#808080"> 
                              <div align="center"><font color="#FFFFFF">管理合作伙伴</font></div>
                            </td>
                          </tr>
                          <tr> 
                            <td height="99" valign="top" bgcolor="#FFFFFF"><br>
                              <%
		sql="select * from ad order by bs";
				  rs=mdb.executeQuery(sql);

		%>
                              <table width="80%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
                                <tr> 
                                  <td width="26%" height="16" bgcolor="#FFFFFF">
                                    <div align="center">网站名称</div>
                                  </td>
                                  <td width="42%" height="16" bgcolor="#FFFFFF">
                                    <div align="center">网站地址</div>
                                  </td>
                                  <td width="9%" bgcolor="#FFFFFF">
                                    <div align="center">排 序</div>
                                  </td>
                                  <td width="23%" bgcolor="#FFFFFF">
                                    <div align="center">操 作</div>
                                  </td>
                                </tr>
                                <%if(!rs.next())
		  out.print("还没有数据，请添加！");
		  else{
			  rs.previous();
		  while(rs.next()){
			  int id=rs.getInt("id");%>
                                <tr> 
                                  <form name="form1" method="post" action="savelinks.jsp?action=edit&id=<%=id%>">
                                    <td height="35" bgcolor="#FFFFFF">
                                      <div align="center"> 
                                        <input name="wordlink" type="text" id="linkname" value="<%=rs.getString("wordlink")%>" size="16">
                                      </div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                      <div align="center"> 
                                        <input name="url" type="text" id="linkurl" value="<%=rs.getString("url")%>" size="26">
                                      </div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                      <div align="center"> 
                                        <input name="bs" type="text" id="linkidorder" value=<%=rs.getInt("bs")%> size="3">
                                      </div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                      <div align="center"> 
                                        <input type="submit" name="Submit" value="修 改">
                                        &nbsp;&nbsp;<a href=savelinks.jsp?action=del&id=<%=id%>><font color="#FF0000">删除</font></a> 
                                      </div>
                                    </td>
                                  </form>
                                </tr>
                                <%}
		  }
		  %>
		  <%sql="select * from ad order by bs";
				  rs=mdb.executeQuery(sql);
				  int i=0;
				  if(rs.next()){
rs.last();
i=rs.getRow();}else i=0;%>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td class="12v" background="../img/back_3.gif" width="9" rowspan="2"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
  </center>
</div>
<br>
<div align="center">
  <center>
<table width="80%" border="1" cellspacing="0" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse">
  <tr> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="9"  rowspan="2"></td>
          <td class="12v"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="12v">
              <tr> 
                <td class="12v" > 
                  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" id="AutoNumber3" height="0" width="100%">
                    <tr> 
                      <td> 
                        <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                          <tr> 
                            <td bgcolor="#808080"> 
                              <div align="center"><font color="#FFFFFF">添加合作伙伴</font></div>
                            </td>
                          </tr>
                          <tr>
                            <form name="form2" method="post" action="savelinks.jsp?action=add">
                              <td height="98" bgcolor="#FFFFFF"> 
                                <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
                                  <tr> 
                                    <td height="15" bgcolor="#FFFFFF">
                                      <div align="center">网站名称</div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                      <div align="center">网站地址</div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                      <div align="center">排 序</div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                      <div align="center">操 作</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td height="15" bgcolor="#FFFFFF">
                                      <div align="center"> 
                                        <input name="wordlink" type="text" id="wordlink" size="16">
                                      </div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                      <div align="center"> 
                                        <input name="url" type="text" id="url" size="26">
                                      </div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                      <div align="center"> 
                                        <input name="bs" type="text" id="bs" value=<%=i+1%> size="3">
                                      </div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                      <div align="center"> 
                                        <input type="submit" name="Submit2" value="添 加">
                                      </div>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </form>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td class="12v" background="../img/back_3.gif" width="9" rowspan="2"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>

  </center>
</div>

</body>
</html>
<%mdb.Close();
	}%>