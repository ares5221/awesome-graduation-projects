<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>

<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean id="z_showUnit" scope="page" class="firm.firm"/>
<%
    String unit_ID=new String(request.getParameter("unit_ID").getBytes("8859_1"));
    String sql="select * from I_s_info where unit_ID='"+unit_ID+"'";
    ResultSet rs=z_showUnit.executeQuery(sql);
	//定义数据类型并初始化
	String unit_name1="";    //单位名称
	String ename1="";        //英文名称
	String cardno1="";     //营业执照号
	String corporation1="";        //法人代表
	String property1="";     //公司性质
	String trade1="";        //所属行业
	String investment1="";   //注册资金
	String stuff1="";        //公司规模
	String business1="";     //经营范围
	String connectman1="";   //联 系 人
	String tel1="";          //电    话
	String fax1="";          //传    真
	String email1="";        //E- mail
	String address1="";      //地    址
	String zipcode1="";      //邮    编
	String introduction1=""; //公司简介
	
	if(rs.next())
	{
	    unit_name1=rs.getString("unit_name");
		ename1=rs.getString("ename");
		cardno1=rs.getString("cardno");
		corporation1=rs.getString("corporation");
		property1=rs.getString("property");
		trade1=rs.getString("trade");
		investment1=rs.getString("investment");
		stuff1=rs.getString("stuff");
		business1=rs.getString("business");
		connectman1=rs.getString("connectman");
		tel1=rs.getString("tel");
		fax1=rs.getString("fax");
		email1=rs.getString("email");
		address1=rs.getString("address");
		zipcode1=rs.getString("zipcode");
		introduction1=rs.getString("introduction");
		
		rs.close();
                z_showUnit.closeStmt();
                z_showUnit.closeConn();
	}
%>

<html>
<head>
<title>showInfo</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<div align="center"> 
  <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td bgcolor="#4f71b8"> 
        <table width="600" border="0" cellspacing="0" cellpadding="0">
          <tr bgcolor="#FFFFFF"> 
            <td colspan="3">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="3"></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="3">&nbsp;</td>
          </tr>
          <tr> 
            <td width="33%">&nbsp;</td>
            <td bgcolor="#FFFFFF"> 
              <div align="center"><img src="../images/s_unitinfo.gif" width="112" height="22"></div>
            </td>
            <td width="33%">&nbsp;</td>
          </tr>
        </table>
        <table width="600" border="0" cellspacing="1" cellpadding="0" height="120">
          <tr> 
            <td height="179" bgcolor="#FFFFFF"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="5">&nbsp;</td>
                </tr>
              </table>
              <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" height="151">
                <tr> 
                  <td> 
                    <table width="95%" border="0" cellspacing="1" cellpadding="1" align="center">
                      <tr> 
                        <td colspan="2" bgcolor="#d9d8dc">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" width="25%" align="center"> <font color="#000099">单位代码</font></td>
                        <td width="75%"><font color="#000099"><%=unit_ID%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">单位名称</font></td>
                        <td bgcolor="#f2f2f2"><font color="#000099"><%=unit_name1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">英文名称</font></td>
                        <td><font color="#000099"><%=ename1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">营业执照号</font></td>
                        <td bgcolor="#f2f2f2"><font color="#000099"><%=cardno1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"> <font color="#000099">法人代表</font></td>
                        <td><font color="#000099"><%=corporation1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">公司性质</font></td>
                        <td bgcolor="#f2f2f2"><font color="#000099"><%=property1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">所属行业</font></td>
                        <td><font color="#000099"><%=trade1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">注册资金</font></td>
                        <td bgcolor="#f2f2f2"> <font color="#000099"><%=investment1%>万元</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">公司规模</font></td>
                        <td> <font color="#000099"><%=stuff1%>人</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">经营范围</font></td>
                        <td bgcolor="#f2f2f2" width="75%"><font color="#000099"><%=business1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">联 
                          系 人</font></td>
                        <td><font color="#000099"><%=connectman1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">电&nbsp;&nbsp;&nbsp;&nbsp;话</font></td>
                        <td bgcolor="#f2f2f2"><font color="#000099"><%=tel1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">传&nbsp;&nbsp;&nbsp;&nbsp;真</font></td>
                        <td><font color="#000099"><%=fax1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">E 
                          - mail</font></td>
                        <td bgcolor="#f2f2f2"><font color="#000099"><%=email1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">地&nbsp;&nbsp;&nbsp;&nbsp;址</font></td>
                        <td><font color="#000099"><%=address1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">邮&nbsp;&nbsp;&nbsp;&nbsp;编</font></td>
                        <td bgcolor="#f2f2f2"><font color="#000099"><%=zipcode1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">公司简介</font></td>
                        <td width="75%"><font color="#000099"><%=introduction1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc">&nbsp;</td>
                        <td bgcolor="#d9d8dc">&nbsp;</td>
                      </tr>
                      <tr align="center"> 
                        <td bgcolor="#d9d8dc" colspan="2"><input type=image src="../images/shutdown.gif" width="80" height="22" border="0" onclick=javascript:window.close();></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
