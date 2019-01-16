<html>
<head>
<title>联系我们</title>
<%@page contentType="text/html;charset=GB2312" %>

<script language="JavaScript">
function isValid(form){
       
    if ((form.from.value=="")||(form.from.value.indexOf('@',0)==-1)||(form.from.value.indexOf('.',0)==-1)||(form.from.value.length<6)){
        alert("请您输入合法的E-mail地址!");
        document.form.from.focus();
	return false;
    }
    
    else if(document.form.subject.value==""){
        alert("请输入标题!");
        document.form.subject.focus();
	return false;
    }
    else if(document.form.message.value==""){
        alert("请输入您的意见!");
        document.form.message.focus();
	return false;
    }
    
    else {
        return true;
    }
}
</script>
</head>
<body>
<jsp:include page="../top.jsp" flush="true"/>
<form action="mail.jsp" name="form" method="POST" onSubmit="return isValid(this);">
<center><p align="center"><h4><font color="blue">联系我们</font></h4></p>
<table border="=0" cellspacing="0" width="394" bgcolor="#F0F0F0" bordercolorlight="#4f71b8" bordercolordark="#ECF5FF">
    <input type="hidden" size= "30" name="to" value="huiren11291021@sina.com">
    <!--value值可根据实际情况自行设置-->
    <tr>
       <td>您的Email:</td>
       <td><input type="text" size= "20"name="from"></td>
    </tr>
    <tr>
       <td>主&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
       <td><input type="text" size= "40"name="subject"></td>
    </tr>
    <tr>
       <td></td>
       <td><textarea name= "message" rows="10" cols="40"></textarea></td>
    </tr>
    <tr>
       <td>&nbsp;</td>
       <td align="center"><input type="submit" name= "B1"value="提交" class="buttonface">&nbsp;&nbsp;&nbsp;<input type="reset" name= "B2"value="重写" class="buttonface"></td>
    </tr>
</table>
</form>
</center>
<jsp:include page="../bottom.jsp" flush="true"/>
</body>
</html>
