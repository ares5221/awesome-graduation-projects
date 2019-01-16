<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>
<%
    String getLoginmessage=(String)session.getValue("loginSign");
    String unit_ID=(String)session.getValue("unitID");    
    if(getLoginmessage!="OK")
    {    
        response.sendRedirect("index2.jsp");
    }    
%>
<jsp:useBean id="s_expertInfo" scope="page" class="firm.firm"/>
<%
    String identityID=request.getParameter("identityID");  
    String sql="select * from I_p_info where identityID='"+identityID+"'";
    ResultSet rs=s_expertInfo.executeQuery(sql);
	//定义数据类型并初始化
	String expert_name1="";         //专家姓名
	String identityID1="";          //身份证号
	String sex1="";                 //性别
	String nation1="";              //民族
	String bir_date1="";            //生日
	String unit_ID1="";             //单位代码
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
        s_expertInfo.closeStmt();
        s_expertInfo.closeConn();
	}
	String bir_year=bir_date1.substring(0,4);
	String bir_month=bir_date1.substring(5,7);
	String bir_day=bir_date1.substring(8,10);	
%>

<html>
<head>
<title>专家信息</title>
<SCRIPT language=javascript>
<!--
OptSort = new Array(
    "0100","哲学",
	"0101","哲学",
	"0200","经济学",
	"0201","理论经济学",
	"0202","应用经济学",
	"0300","法学",
	"0301","法学",
	"0302","政治学",
	"0303","社会学",
	"0304","民族学",
	"0400","教育学",
	"0401","教育学",
	"0402","心理学",
	"0403","体育学",
	"0500","文学",
	"0501","中国语言文学",
	"0502","外国语言文学",
	"0503","新闻传播学",
	"0504","艺术学",
	"0600","历史学",
	"0601","历史学",
	"0700","理学",
	"0701","数学",
	"0702","物理学",
	"0703","化学",
	"0704","天文学",
	"0705","地理学",
	"0706","大气科学",
	"0707","海洋科学",
	"0708","地球物理学",
	"0709","地质学",
	"0710","生物学",
	"0711","系统科学",
	"0712","科学技术史",
	"0800","工学",
	"0801","力学",
	"0802","机械工程",
	"0803","光学工程",
	"0804","仪器科学与技术",
	"0805","材料科学与工程",
	"0806","冶金工程",
	"0807","动力工程及工程热物理",
	"0808","电气工程",
	"0809","电子科学与技术",
	"0810","信息与通信工程",
	"0811","控制科学与工程",
	"0812","计算机科学与技术",
	"0813","建筑学",
	"0814","土木工程",
	"0815","水利工程",
	"0816","测绘科学与技术",
	"0817","化学工程与技术",
	"0818","地质资源与地质工程",
	"0819","矿业工程",
	"0820","石油与天然气工程",
	"0900","农学",
	"0901","作物学",
	"0902","园艺学",
	"0903","农业资源利用",
	"0904","植物保护",
	"0905","畜牧学",
	"0906","兽医学",
	"0907","林学",
	"0908","水产",
	"1000","医学",
	"1001","基础医学",
	"1002","临床医学",
	"1003","口腔医学",
	"1004","公共卫生与预防医学",
	"1005","中医学",
	"1006","中西医结合",
	"1007","药学",
	"1008","中药学",
	"1100","军事学",
	"1101","军事",
	"1200","管理学",
	"1201","管理科学与工程",
	"1202","工商管理");

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
      <td bgcolor="#000099"> 
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
        <table width="650" border="0" cellspacing="1" cellpadding="0" height="120">
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
                        <td colspan="3" bgcolor="#d9d8dc">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" width="21%" align="center"> <font color="#000099">专家姓名</font></td>
                        <td colspan="2" width="50%"><font color="#000099"><%=expert_name1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">身份证号</font></td>
                        <td bgcolor="#f2f2f2" colspan="2" width="50%"><font color="#000099"><%=identityID1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">性&nbsp;&nbsp;&nbsp;&nbsp;别</font></td>
                        <td colspan="2" width="50%"><font color="#000099"><%=sex1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">民&nbsp;&nbsp;&nbsp;&nbsp;族</font></td>
                        <td bgcolor="#f2f2f2" colspan="2" width="50%"><font color="#000099"><%=nation1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"> <font color="#000099">出生日期</font></td>
                        <td colspan="2" width="50%"><font color="#000099"><%=bir_year%>年<%=bir_month%>月<%=bir_day%>日</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">单位代码</font></td>
                        <td colspan="2" width="50%"><font color="#000099"><%=unit_ID1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">所在单位</font></td>
                        <td bgcolor="#f2f2f2" colspan="2" width="50%"><font color="#000099"><%=unit_name1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">职&nbsp;&nbsp;&nbsp;&nbsp;称</font></td>
                        <td colspan="2" width="50%"><font color="#000099"><%=grade1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">研究领域</font></td>
                        <td bgcolor="#f2f2f2" colspan="2" width="50%"> <font color="#000099"><%=domain1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">适评专业</font></td>
                        <td colspan="2" width="50%"> <font color="#000099"> 
                          <script language="javascript">showSort(OptSort,"<%=sort1%>");showbank();showSort(OptSort,"<%=sort2%>");</script>
                          </font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">E 
                          - mail</font></td>
                        <td bgcolor="#f2f2f2" colspan="2" width="50%"><font color="#000099"><%=email1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">联系地址</font></td>
                        <td colspan="2" width="50%"><font color="#000099"><%=address1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">邮政编码</font></td>
                        <td bgcolor="#f2f2f2" colspan="2" width="50%"><font color="#000099"><%=zipcode1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">电&nbsp;&nbsp;&nbsp;&nbsp;话</font></td>
                        <td colspan="2" width="50%"><font color="#000099"><%=tel1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">简&nbsp;&nbsp;&nbsp;&nbsp;介</font></td>
                        <td bgcolor="#f2f2f2" colspan="2" width="50%"><font color="#000099"><%=introduction1%></font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center" colspan="3">&nbsp;</td>
                      </tr>
                      <tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center" colspan="3">&nbsp;<INPUT onclick=javascript:window.close(); type=image src="../images/close.gif" width="62" height="22"></td>
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
