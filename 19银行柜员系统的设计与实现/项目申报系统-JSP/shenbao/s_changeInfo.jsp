<%@ page language="java" import="java.sql.*" contentType="text/html;charset=GB2312"%>
<%
    String getLoginmessage=(String)session.getValue("loginSign");
    String unit_ID=(String)session.getValue("unitID");    
    if(getLoginmessage!="OK")
    {    
        response.sendRedirect("index2.jsp");
    }    
%>
<jsp:useBean id="s_changeinfo" scope="page" class="firm.firm"/>
<%
    String sql="select * from I_s_info where unit_ID='"+unit_ID+"'";
    ResultSet rs=s_changeinfo.executeQuery(sql);
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
	}
%>

<html>
<head>
<title>单位信息</title>
<script>
<!--
function Jtrim(str)
{

        var i = 0;
        var len = str.length;
        if ( str == "" ) return( str );
        j = len -1;
        flagbegin = true;
        flagend = true;
        while ( flagbegin == true && i< len)
        {
           if ( str.charAt(i) == " " )
                {
                  i=i+1;
                  flagbegin=true;
                }
                else
                {
                        flagbegin=false;
                }
        }

        while  (flagend== true && j>=0)
        {
            if (str.charAt(j)==" ")
                {
                        j=j-1;
                        flagend=true;
                }
                else
                {
                        flagend=false;
                }
        }

        if ( i > j ) return ("")

        trimstr = str.substring(i,j+1);
        return trimstr;
}
function isemail (s)
{
        if (s.length > 100)
        {
                return false;
        }

         var regu = "^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$"
         var re = new RegExp(regu);
         if (s.search(re) != -1) {
               return true;
         } else {
               return false;
         }
}
function checktheform()
{
       var f1=document.theform;
	
	if (Jtrim(f1.unit_name.value) == "")
	{
		window.alert("您尚未填写单位名称。");
		f1.unit_name.focus();
		return false;
	}

	if (Jtrim(f1.cardno.value) == "")
	{
		window.alert("您尚未填写营业执照号。");
		f1.cardno.focus();
		return false;
	}

	if (Jtrim(f1.corporation.value) == "")
	{
		window.alert("您尚未填写法人代表。");
		f1.corporation.focus();
		return false;
	}

	if (Jtrim(f1.property.value) == "")
	{
		window.alert("您尚未填写公司性质。");
		f1.property.focus();
		return false;
	}

	if (Jtrim(f1.trade.value) == "")
	{
		window.alert("您尚未填写所属行业。");
		f1.trade.focus();
		return false;
	}

	if (Jtrim(f1.investment.value) == "")
	{
		window.alert("您尚未填写注册资金。");
		f1.investment.focus();
		return false;
	}

	if (Jtrim(f1.stuff.value) == "")
	{
		window.alert("您尚未填写公司规模。");
		f1.stuff.focus();
		return false;
	}

	if (Jtrim(f1.business.value) == "")
	{
		window.alert("您尚未填写经营范围。");
		f1.business.focus();
		return false;
	}

	if (Jtrim(f1.connectman.value) == "")
	{
		window.alert("您尚未填写联系人。");
		f1.connectman.focus();
		return false;
	}

	if (Jtrim(f1.tel.value) == "")
	{
		window.alert("您尚未填写电话。");
		f1.tel.focus();
		return false;
	}

	if (Jtrim(f1.fax.value) == "")
	{
		window.alert("您尚未填写传真。");
		f1.fax.focus();
		return false;
	}

	//check email
	if(f1.email.value=="" || !isemail(f1.email.value))
	{
		window.alert("请填写有效的EMAIL地址!");
		f1.email.focus();
		return false;
	}

	if (Jtrim(f1.address.value) == "")
	{
		window.alert("您尚未填写地址。");
		f1.address.focus();
		return false;
	}

	if (Jtrim(f1.zipcode.value) == "")
	{
		window.alert("您尚未填写邮编。");
		f1.zipcode.focus();
		return false;
	}

	if (Jtrim(f1.introduction.value) == "")
	{
		window.alert("您尚未填写公司简介。");
		f1.introduction.focus();
		return false;
	}
}
//-->
</script>
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
          
        <table width="100%" border="0" cellspacing="1" cellpadding="0" height="120">
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
				  <form name=theform method=post action="s_checkInfo.jsp" onsubmit="return checktheform(this)">
                    <table width="95%" border="0" cellspacing="1" cellpadding="1" align="center">
                      <tr> 
                        <td colspan="2" bgcolor="#d9d8dc">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" width="25%" align="center"> <font color="#000099">单位代码</font></td>
                        <td> 
                          <font color="#000099"><%=unit_ID%></font>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">单位名称</font></td>
                        <td> 
                          <input name=unit_name size=60 maxlength="60" value='<%=unit_name1%>'>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">英文名称</font></td>
                        <td> 
                          <input name=ename size="60" maxlength="60" value='<%=ename1%>'>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">营业执照号</font></td>
                        <td> 
                          <input name=cardno size="30" maxlength="30" value='<%=cardno1%>'>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"> <font color="#000099">法人代表</font></td>
                        <td> 
                          <input maxlength=10 name=corporation size=10 value='<%=corporation1%>'>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">公司性质</font></td>
                        <td> 
                          <input name=property size="30" maxlength="30" value='<%=property1%>'>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">所属行业</font></td>
                        <td> 
                          <input name=trade size="30" maxlength="30" value='<%=trade1%>'>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">注册资金</font></td>
                        <td> 
                          <input name=investment size="20" maxlength="20" value='<%=investment1%>'>
                          <font color="#000099">万元</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">公司规模</font></td>
                        <td> 
                          <input name=stuff size="20" maxlength="10" value='<%=stuff1%>'>
                          <font color="#000099">人</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">经营范围</font></td>
                        <td> 
                          <textarea name="business" cols="60" rows="3"><%=business1%></textarea>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">联 
                          系 人</font></td>
                        <td> 
                          <input name=connectman size="20" maxlength="20" value='<%=connectman1%>'>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">电&nbsp;&nbsp;&nbsp;&nbsp;话</font></td>
                        <td> 
                          <input name=tel size="40" maxlength="40" value='<%=tel1%>'>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">传&nbsp;&nbsp;&nbsp;&nbsp;真</font></td>
                        <td> 
                          <input name=fax size="40" maxlength="40" value='<%=fax1%>'>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">E 
                          - mail</font></td>
                        <td> 
                          <input name=email size="40" maxlength="40" value='<%=email1%>'>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">地&nbsp;&nbsp;&nbsp;&nbsp;址</font></td>
                        <td> 
                          <input name=address size="50" maxlength="60" value='<%=address1%>'>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">邮&nbsp;&nbsp;&nbsp;&nbsp;编</font></td>
                        <td> 
                          <input name=zipcode size="7" maxlength="6" value='<%=zipcode1%>'>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#d9d8dc" align="center"><font color="#000099">公司简介</font></td>
                        <td> 
                          <textarea name="introduction" cols="60" rows="4"><%=introduction1%></textarea>
                        </td>
                      </tr>
                      <tr bgcolor="#d9d8dc"> 
                        <td colspan="2">&nbsp;</td>
                      </tr>
                      <tr bgcolor="#d9d8dc" align="center"> 
                        <td colspan="2"><input type=image src="../images/refer.gif" width="62" height="22" name="refer"></td>
                      </tr>
                    </table>
				  </form>
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
