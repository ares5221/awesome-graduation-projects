//检查大类输入
function checkBig()
{
  if (document.form1.BigClassName.value=="")
  {
    alert("大类名称不能为空！");
    document.form1.BigClassName.focus();
    return false;
  }
}
//检查小类输入
function checkSmall()
{
  if (document.form2.BigClassName.value=="")
  {
    alert("请先添加大类名称！");
	document.form1.BigClassName.focus();
	return false;
  }

  if (document.form2.SmallClassName.value=="")
  {
    alert("小类名称不能为空！");
	document.form2.SmallClassName.focus();
	return false;
  }
}
//删除大类确认
function ConfirmDelBig()
{
   if(confirm("确定要删除此大类吗？删除此大类同时将删除所包含的小类，并且不能恢复！"))
     return true;
   else
     return false;
	 
}
//删除小类确认
function ConfirmDelSmall()
{
   if(confirm("确定要删除此小类吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
	 
}
 
 

