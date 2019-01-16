<%@ page contentType="text/html;charset=GBK" language="java" import="java.sql.*,java.util.Date" errorPage="" %>
<%@ include file="conn.jsp"%>
<%!
String encode(String str)
 {
    String result;
    int l;
    if(str=="")
	{
       result="";
	}
    else
    {
    l=str.length();
	char[] chr=new char[l];
	str.getChars(0,l,chr,0);
    result="";
	int i;
	for(i=0;i<=l-1;i++)
	  {
	    
               switch(chr[i])
			    {

			    
	           case '<':
	                result=result+"&lt;";
					break;
	           case '>':
	                result=result+"&gt;";
			   break;

              case 10:
	                result=result+"<br>";
			  break;
			  case 13:
	                result=result+"<br>";
			  break;
	           case 34:
	                result=result+"&quot;";
			   break;
	           case '&':
	                result=result+"&amp;";
			   break;
              case ' ':
			        result=result+"&nbsp;";	
			  break;
	               
	          case 9:
	                result=result+"    ";
			   break;
	           default:
	                result=result+String.valueOf(chr[i]);
				}
	  } 
	}
    return result;
  }
 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href=../css.css rel=STYLESHEET type=text/css>
</head>
<%
if(request.getParameter("action")!=null)
 {//-----------------------------------action=save-----------------------------------------------------
   if(request.getParameter("action").equals("save"))
   {    boolean founderr=false;
        String hw_name=request.getParameter("hw_name");
    String hw_content=encode(request.getParameter("hw_content"));
	String hw_content2=encode(request.getParameter("hw_content2"));
    String hw_cashs=request.getParameter("hw_cash");
    String hw_pic=request.getParameter("hw_pic");
	int length=hw_pic.length();
	int n=hw_pic.lastIndexOf(".jpg");
	int m=hw_pic.lastIndexOf(".gif");
	int k=hw_pic.lastIndexOf(".");
	if(n>0){if(k!=n) founderr=true;}
	 else if(m>0){ if(m!=k) founderr=true;}
	 else{ founderr=true;
	 }
	String chubsh=request.getParameter("chubsh");
	String zhuang=request.getParameter("zhuang");
	String yeshu=request.getParameter("yeshu");
	 String isbn=request.getParameter("isbn");
    String sort_ids=request.getParameter("sort_id");
  String Nsort_ids=request.getParameter("Nsort_id");

   String pifas=request.getParameter("pifa");
String dailis=request.getParameter("daili");
String hwsn=request.getParameter("hwsn");
String data=request.getParameter("data");
  data=data.trim();
  Date datas=new Date();
String kaiben=request.getParameter("kaiben");
String tuijian=request.getParameter("tuijian");
String jia=request.getParameter("jia");
String errmsg="输入有错!";

    if(Cint(hw_cashs)==0)
	{
        errmsg="<br>"+"<li>价格应该为数字";
        founderr=true;
    }
    if(hw_name=="")
	{
        errmsg=errmsg+"<br>"+"<li>名称不能为空";
        founderr=true;
    }
	
    if(hw_content=="")
	{
        errmsg=errmsg+"<Br>"+"<li>介绍不能为空";
        founderr=true;
    }
	
    if(sort_ids=="" )
	{
        errmsg=errmsg+"<br>"+"<li>类别不能为空";
        founderr=true;
    }
   
      if(Nsort_ids=="") 
	  {
        errmsg=errmsg+"<br>"+"<li>类别不能为空";
        founderr=true;
      }
	  if(data.length()!=10){
	    errmsg=errmsg+"<br>"+"<li>产品生产日期格式不正确";
        founderr=true;
	  }else
	  {
	    if(data.indexOf('-')!=4||data.lastIndexOf('-')!=7){
		  errmsg=errmsg+"<br>"+"<li>产品生产日期格式不正确";
          founderr=true;
		}
		else
		{
		int year=Cint(data.substring(0,4));
		int month=Cint(data.substring(5,7));
		int day=Cint(data.substring(8));
		  if(month>12||day>31||month<=0||day<=0){
		      errmsg=errmsg+"<br>"+"<li>产品生产日期格式不正确";
             founderr=true;
		   }else{
		    datas=new Date(year-1900,month-1,day);
		   }
		}
	  }
	 if(hw_pic==""){ hw_pic="img/noimage.gif";}
     if(chubsh==""|zhuang==""|yeshu==""|isbn==""|pifas==""|dailis==""|hwsn==""|data==""|kaiben==""|jia==""){
	   founderr=true;
	   }
    if (founderr==true)
	{
        out.print(errmsg);
        out.print("<br>");
        out.print("<a href=addhw.jsp>返回</a>");
      }else
	 {
        hw_name=getStr(hw_name);
       	hw_content2=encode(getStr(hw_content2));
        hw_content=encode(getStr(hw_content));
		boolean btuijian=false,bjia=false;
		if(tuijian.equals("1")){ btuijian=true;}
		if(jia.equals("1")){ bjia=true;}
		
        sql="insert into hw (hw_name,hw_content,hw_content2,hw_cash,sort_id,Nsort_id,daili,pifa,hw_sn,chubsh,kaiben,yeshu,";    
        sql=sql+"data,isbn,zhuang,hw_pic,tuijian,jia,hw_date)";
		sql=sql+"values('"+hw_name+"','"+hw_content+"','"+hw_content2+"',"+Cint(hw_cashs)+","+Cint(sort_ids)+","+Cint(Nsort_ids);
        sql=sql+","+Cint(dailis)+","+Cint(pifas)+",'"+getStr(hwsn)+"','"+getStr(chubsh)+"','"+getStr(kaiben)+"','"+yeshu+"','"+datas.toLocaleString()+"','"+getStr(isbn);
        sql=sql+"','"+getStr(zhuang)+"','"+hw_pic+"','"+btuijian+"','"+bjia+"',now())";
		mdb.executeInsert(sql);
		out.print("货物添加成功");
        out.print("<br>");
        out.print("<a href=addhw.jsp>返回</a>");
    
    }
    
    
  }
}
else{
//-----------------------------------action!=save-----------------------------------------------------
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<title>添 加 商　品</title>
<link rel="stylesheet" type="text/css" href="style.css">
<%
int count=0;
sql = "select * from  Nsort  order by Nsort_id asc";
rs=mdb.executeQuery(sql);
%>
<script language = "JavaScript">
var onecount;
onecount=0;
subcat = new Array();
        <%
        while(rs.next()) 
		{
        %>
subcat[<%=count%>] = new Array("<%=rs.getString("Nsort_name")%>","<%=rs.getInt("sort_id")%>","<%=rs.getInt("Nsort_id")%>");
        <%
        count = count + 1;
        }
		rs.close();
        %>
onecount=<%=count%>;

function changelocation(locationid)
    {
    document.myform.Nsort_id.length = 0; 

    var locationid=locationid;
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { 
                document.myform.Nsort_id.options[document.myform.Nsort_id.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
        
    }    
</script>
</head>

<body>
<tr>
    <td>
      <div align="center"><b>所有选项都必须填写</b></div>
    </td>
  </tr>
<form method="POST" name="myform" action="addhw.jsp?action=save">
  <table class="border" cellspacing="0" width="80%" border="0" cellpadding="4" cellspacing="0" >
    
    <tr align="center">
      <td class="tdbg" width="100%">
	<table border="0" cellspacing="1" width="100%">
        
                <td width="85%">
<%       int selclass=0;
        sql = "select * from sort";
       rs=mdb.executeQuery(sql);
	if(!rs.next())
	{
	  out.print("请先添加栏目。");
	 }else
	 {
	 rs.previous();
	 if(rs.next())
	   {
	      selclass=rs.getInt("sort_id");
	 %>
<select name="sort_id" onChange="changelocation(document.myform.sort_id.options[document.myform.sort_id.selectedIndex].value)" size="1">
        <option selected value="<%=selclass%>"><%=rs.getString("sort_name")%></option>
<%       
           while(rs.next())
		  {
%> <option value="<%=rs.getInt("sort_id")%>"><%=rs.getString("sort_name")%></option>
<%
          }
	   }
	}
       rs.close();
%></select> 
<select name="Nsort_id">                  
<%
sql="select * from Nsort where sort_id="+selclass;
rs=mdb.executeQuery(sql);
if(rs.next())
{
%>
        <option selected value="<%=rs.getInt("Nsort_ID")%>"><%=rs.getString("Nsort_name")%></option>
<% 
while(rs.next())
  {%>
        <option value="<%=rs.getInt("Nsort_ID")%>"><%=rs.getString("Nsort_name")%></option>
<% 
   }
}
rs.close();
%>
</td>
  </tr>
</table>

<table border="0" width="500" cellspacing="1" height="392" align="left">
  <tr>
    <td width="100%" height="395"> 
      
            <table border="0" width="100%" cellspacing="1">
              <tr> 
                <td colspan="2"><font color="#FF0000">型号名称</font> 
                  <input type="text" name="hw_name" size="20" class=input>
                  <font color="#FF0000"> &nbsp;&nbsp;&nbsp;&nbsp; </font> </td>
              </tr>
              <tr> 
                <td colspan="2"><font color="#FF0000">市场价</font> 
                  <input type="text" name="pifa" size="7" class=input>
                  元 <font color="#FF0000">&nbsp;&nbsp;&nbsp;会员价</font> 
                  <input type="text" name="hw_cash" size="7" class=input>
                  元 <font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;VIP价</font> 
                  <input type="text" name="daili" size="7" class=input>
                  元 </td>
              </tr>
              <tr> 
                <td height="5" colspan="2"> 
                  <hr noshade size="1">
                </td>
              </tr>
              <tr> 
                <td><font color="#000000">录入</font> 
                  <input type="text" name="hwsn" size="10" class=input value="不详">
                </td>
                <td width="63%"><font color="#000000">出品公司</font> 
                  <input type="text" name="chubsh" size="30" class=input value="不详">
                </td>
              </tr>
              <tr> 
                <td><font color="#000000">尺码</font> 
                  <input type="text" name="kaiben" size="10" class=input value="16">
                </td>
                <td width="63%"><font color="#000000">出品日期</font> 
                  <input type="text" name="data" size="24" class=input value="2002-10-10">
                  格式:2002-01-01</td>
              </tr>
              <tr> 
                <td><font color="#000000">颜色</font> 
                  <input type="text" name="yeshu" size="10" class=input value="100">
                </td>
                <td width="63%"><font color="#000000">编号</font> 
                  <input type="text" name="isbn" size="30" class=input value="不详">
                </td>
              </tr>
              <tr> 
                <td height="5" colspan="2"> 
                  <hr noshade size="1">
                </td>
              </tr>
              <tr> 
                <td colspan="2"> <font color="#000000">包装类型</font> <input type="text" name="zhuang" size="30" class=input value="普通"></td>
              </tr>
              <tr> 
                <td colspan="2"> <font color="#FF0000">简单内容介绍</font></td>
              </tr>
              <tr> 
                <td valign="top" colspan="2"> 
                  <textarea rows="3" name="hw_content" cols="50" class=input>暂时没有……</textarea>
                </td>
              </tr>
              <tr>
                <td valign="top" colspan="2"><font color="#FF0000">详细内容介绍</font></td>
              </tr>
              <tr>
                <td valign="top" colspan="2">
                  <textarea rows="10" name="hw_content2" cols="50" class=input>暂时没有……</textarea>
                </td>
              </tr>
              <tr> 
                <td colspan="2"> <font color="#FF0000">商品图片</font> 
                  <input type="text" name="hw_pic" size="46" class=input value="pic/"> <a href=# onClick="javascript:window.open('up.jsp','添加产品图片','height=270,width=450,toobar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no');">上传图片</a></td>
              </tr>
            </table>
            <table width="372" border="0" cellspacing="0" cellpadding="0" height="24">
              <tr>
                <td>推荐此商品
                  <input type="radio" name="tuijian" value="1">
                  不推荐 
                  <input type="radio" name="tuijian" value="0" checked>
                  <br>
                  否特价 
                  <input name="jia" type="radio" value="0" checked>
                  &nbsp;&nbsp; 是特价
                  <input type="radio" name="jia" value="1"> 
                </td>
              </tr>
            </table>
            <p>
              <input type="submit" value="提交" name="B1" class=input>
              <input type="reset" value="全部重写" name="B2" class=input>
            </p>
    
      
    </td>
  </tr>
</table>
</form>

</body>
</html>

<%}
//--------------------------------------end action check----------------------------------------------
%>