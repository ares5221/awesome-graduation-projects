<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>

<%
    String z_Loginmessage=(String)session.getValue("z_loginSign");
    String adminID=(String)session.getValue("adminID");    
    if(z_Loginmessage!="OK")
    {
	response.sendRedirect("index4.jsp");
    }
%>
<jsp:useBean id="z_showExpert" scope="page" class="firm.firm"/>
<%
    String identityID=new String(request.getParameter("identityID").getBytes("8859_1"));
    String sql="select * from I_p_info where identityID='"+identityID+"'";
    ResultSet rs=z_showExpert.executeQuery(sql);
	//定义数据类型并初始化
	String expert_name1="";         //专家姓名
	String identityID1="";          //身份证号
	String sex1="";                 //性别
	String nation1="";              //民族
	String bir_date1="";            //生日
	String unit_ID1="";
	String unit_name1="";           //所在单位
	String grade1="";               //职称
	String domain1="";              //研究领域
    String sort1="";                    //适评专业
    String sort2="";                    //适评专业
    String email1="";                   //E-mail
    String address1="";                 //住址
    String zipcode1="";                 //邮编
    String tel1="";                     //电话
    String introduction1="";            //介绍
    if(rs.next())
	{
	    identityID1=rs.getString("identityID");
                expert_name1=rs.getString("expert_name");
		sex1=rs.getString("sex");
		nation1=rs.getString("nation");
		bir_date1=rs.getString("bir_date");
		unit_ID1=rs.getString("unit_ID");
		unit_name1=rs.getString("unit_name");
		grade1=rs.getString("grade");
		domain1=rs.getString("domain");
		sort1=rs.getString("sort1");
		sort2=rs.getString("sort2");
		email1=rs.getString("email");
		address1=rs.getString("address");
		zipcode1=rs.getString("zipcode");
		tel1=rs.getString("tel");
		introduction1=rs.getString("introduction");
	rs.close();
        z_showExpert.closeStmt();
        z_showExpert.closeConn();
	}
	String bir_year=bir_date1.substring(0,4);
	String bir_month=bir_date1.substring(5,7);
	String bir_day=bir_date1.substring(8,10);	
%>

<html>
<head>
<title>showInfo</title>
<SCRIPT language=javascript>
<!--
OptSort = new Array(
    "0100","网络",
	"0101","软件外包",
	"0200","经营管理",
	"0201","公司硬件设施",
	"0202","员工交通",
	"0300","员工住宿",
	"0301","员工工资",
	"0302","节假日补助",
	"0303","公司发展战略",
	"0304","软件系统",
	"0400","招聘新员工",
	"0401","成立新部门",
	"0402","公司管理制度",
	"0403","公司财务管理",
	"0500","公司人事管理",
	"0501","公司销售部门",
	"0502","公司质检部门"	);

function showSort()
{
	var i,len,start,step,s1,a,args=showSort.arguments;
	var name;
	a=args[0];
	s1=args[1];
	start=0;
	step=2;
	len=a.length;
	for(i=0;i<len;i+=step)
	{
		if(a[i]==s1)
		{
		    name=a[i+1];
			break;
		}
		else name="";
	}
	document.writeln(name);
}
function showbank()
{
    document.writeln("");
}
//-->
</SCRIPT>
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
              <div align="center"><img src="../images/p_expertinfo.gif" width="112" height="22"></div>
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
                        <td bgcolor="#d9d8dc" width="25%" align="center"> <font color="#000099">专家姓名</font></td>
                        <td width="75%"><font color="#000099"><%=expert_name1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">身份证号</font></td>
                        <td bgcolor="#f2f2f2"><font color="#000099"><%=identityID1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">性&nbsp;&nbsp;&nbsp;&nbsp;别</font></td>
                        <td><font color="#000099"><%=sex1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">民&nbsp;&nbsp;&nbsp;&nbsp;族</font></td>
                        <td bgcolor="#f2f2f2"><font color="#000099"><%=nation1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"> <font color="#000099">出生日期</font></td>
                        <td><font color="#000099"><%=bir_year%>年<%=bir_month%>月<%=bir_day%>日</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">单位代码</font></td>
                        <td><font color="#000099"><%=unit_ID1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">所在单位</font></td>
                        <td bgcolor="#f2f2f2"><font color="#000099"><%=unit_name1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">职&nbsp;&nbsp;&nbsp;&nbsp;称</font></td>
                        <td><font color="#000099"><%=grade1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">研究领域</font></td>
                        <td bgcolor="#f2f2f2"> <font color="#000099"><%=domain1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">适评专业</font></td>
                        <td> <font color="#000099"> 
                          <script language="javascript">showSort(OptSort,"<%=sort1%>");showbank();showSort(OptSort,"<%=sort2%>");</script>
                          </font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">E 
                          - mail</font></td>
                        <td bgcolor="#f2f2f2" width="75%"><font color="#000099"><%=email1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">联系地址</font></td>
                        <td><font color="#000099"><%=address1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">邮政编码</font></td>
                        <td bgcolor="#f2f2f2"><font color="#000099"><%=zipcode1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">电&nbsp;&nbsp;&nbsp;&nbsp;话</font></td>
                        <td><font color="#000099"><%=tel1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">简&nbsp;&nbsp;&nbsp;&nbsp;介</font></td>
                        <td bgcolor="#f2f2f2"><font color="#000099"><%=introduction1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center" colspan="2">&nbsp;</td>
                      </tr>
                      <tr align="center"> 
                        <td bgcolor="#d9d8dc" colspan="2"> 
                          <input type=image src="../images/shutdown.gif" width="80" height="22" border="0" onclick=javascript:window.close();>
                        </td>
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
