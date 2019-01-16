<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<script language="JavaScript" type="text/javascript" src="auto.js"></script>
<style type="text/css">
body{
	font-size: 12px;
	color: #000000;
}
</style>
</head>
<body>
<%
dim id,pic,title,class1,class2,cpjg,cpsl,nope,jingpin,bpic

id=Trim(Request.QueryString("id"))
if(isnumeric(id)) then
	sql="select * from products where id="&id
	rs.open sql,conn,1,1
	if(not rs.eof) then
		pic=rs("pic")
		bpic=rs("bpic")
		title=rs("title")
		class1=rs("class1")
		class2=rs("class2")
		cpjg=rs("cpjg")
		cpsl=rs("cpsl")
		nope=rs("nope")
		jingpin=int(rs("jingpin"))
	end if
	rs.close
else
	pic=""
	bpic=""
	title=""
	class1=""
	class2=""
	cpjg=""
	cpsl=""
	nope=""
	jingpin=0
end if
%>
<form action="set4-1-1.asp" method="post">
<table width="670" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="80" height="25" align="right" valign="middle">产品图片：</td>
    <td colspan="3" align="left" valign="middle"><input name="pic" type="text" id="pic" value="<%=bpic%>" size="60" /> 　
      <a href="repimg.html?act=pic" target="_blank">更换图片</a>      </td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle">产品缩略图：</td>
    <td colspan="3" align="left" valign="middle"><input name="pic2" type="text" id="pic2" value="<%=pic%>" size="60" />
      <a href="repimg.html?act=pic2" target="_blank">更换图片</a></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle">产品名称：</td>
    <td colspan="3" align="left" valign="middle"><input name="title" type="text" id="title" value="<%=title%>" size="60" />
      <input name="id" type="hidden" id="id" value="<%=id%>" /></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle">产品类别：</td>
    <td align="left" valign="middle"><select name="class1" id="class1">
      <%
	  sql="select * from leibie order by id asc"
	  rs.open sql,conn,1,1
	  
	  while not rs.eof
	  	Response.Write("<option value="&rs("title")&">"&rs("title")&"</option>")
	  	rs.movenext
	  wend
	  rs.close
	  %>
    </select></td>
    <td width="80" align="right" valign="middle">精品推荐：</td>
    <td align="left" valign="middle"><%=jingpin%><input name="jingpin" type="checkbox" id="jingpin" value="1" <%if(jingpin=1) then Response.Write(" checked='checked'")%> /></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle">产品价格：</td>
    <td align="left" valign="middle"><input name="cpjg" type="text" id="cpjg" value="<%=cpjg%>" /></td>
    <td align="right" valign="middle">产品数量：</td>
    <td align="left" valign="middle"><input name="cpsl" type="text" id="cpsl" value="<%=cpsl%>" /></td>
  </tr>
  <tr>
    <td height="25" align="right" valign="middle">产品介绍：</td>
    <td colspan="3" align="left" valign="middle"><textarea name="nope" cols="70" rows="12" id="nope"><%=nope%></textarea></td>
  </tr>
  <tr>
    <td height="40" colspan="4" align="center" valign="middle"><input type="submit" name="Submit" value="提交" /></td>
  </tr>
</table>
</form>
<script language="javascript">
document.getElementById("class1").value="<%=class1%>";
</script>
</body>
</html>
