<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conn.jsp"%>

<%String action=request.getParameter("action");
if(action==null)
	action="notsave";
if(action.equals("save")){
	sql="update logo set banner='"+getStr((request.getParameter("banner")).trim())+"',url='"+(request.getParameter("url")).trim()+"'";
    mdb.executeUpdate(sql);
out.print("<script language=javascript>alert('修改成功！');history.go(-1);</script>");
}else{

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
<%
sql="select * from logo";
rs=mdb.executeQuery(sql);
rs.next();%>
<div align="center">
  <center>
<table width="80%" border="1" cellspacing="0" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse">
  <tr> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="9" background="../img/back_3.gif" rowspan="2"></td>
          <td class="12v"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="12v">
              <tr> 
                <td class="12v" > 
                  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" id="AutoNumber3" height="0" width="100%">
                    <tr> 
                      <td>
                        <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" >
                          <tr> 
                            <td bgcolor="#C0C0C0"> 
                              <div align="center"><font color="#FFFFFF">网站广告设置</font></div>
                            </td>
                          </tr>
                          <tr> 
                            <td height="211" valign="top" bgcolor="#FFFFFF">
                              <form name="form1" method="post" action="guanggao.jsp?action=save">
                                <br>
                                <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
                                  <tr> 
                                    <td bgcolor="#FFFFFF" style="PADDING-LEFT: 6px">　</td>
                                    <td bgcolor="#FFFFFF" > <div align="center">图片地址</div></td>
                                    <td bgcolor="#FFFFFF" > <div align="center">图片链接</div></td>
                                  </tr>
                                  <tr> 
                                    <td colspan="3" bgcolor="#FFFFFF" style="PADDING-LEFT: 6px">网站首页广告设置：</td>
                                  </tr>
                                  <tr> 
                                    <td width="25%" bgcolor="#FFFFFF" style="PADDING-LEFT: 6px">395*110大广告：</td>
                                    <td width="38%" bgcolor="#FFFFFF" > <div align="center"> 
                                        <input name="banner" type="text" id="banner" size="28" value=<%=rs.getString("banner")%>>
                                      </div></td>
                                    <td width="37%" bgcolor="#FFFFFF" > <div align="center"> 
                                        <input name="url" type="text" id="url" size="28" value=<%=rs.getString("url")%>>
                                      </div></td>
                                  </tr>
                                  <tr> 
                                    <td height="32" colspan="3" bgcolor="#FFFFFF" style="PADDING-LEFT: 6px"> 
                                      <div align="center"> 
                                        <input type="submit" name="Submit" value="提交更改">
                                      </div></td>
                                  </tr>
                                </table>
                              </form>
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

</body>
</html>
<%}mdb.Close();%>