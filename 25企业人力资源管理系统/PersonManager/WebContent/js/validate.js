function checkEmpty(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert("表单信息不能为空");
return false;
}
}
}
function quit(){
if(confirm("您真的要退出吗？")){
window.location.href="leave.jsp";
}
}







function clockon(bgclock){
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth();
	var date=now.getDate();
	var day=now.getDay();
	var hour=now.getHours();
	var minu=now.getMinutes();
	var sec=now.getSeconds();
	var week;
	month=month+1;
	if(month<10) month="0"+month;
	if(date<10) date="0"+date;
	if(hour<10) hour="0"+hour;
	if(minu<10) minu="0"+minu;
	if(sec<10) sec="0"+sec;
	var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
	week=arr_week[day];
	var time="";
	time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec;
	if(document.all){
		bgclock.innerHTML=""+time+""
	}
	var timer=setTimeout("clockon(bgclock)",200);
} 

function updatePassword(){
if(document.form.oldPassword.value==""){
window.alert("请输入原来的密码");
return false;
}
if(document.form.oldPassword.value!=document.form.passwordOld.value){
window.alert("您输入的密码与原来的密码不一致");
return false;
}
if(document.form.password.value==""){
window.alert("请输入新密码");
return false;
}
if(document.form.passwordSure.value==""){
window.alert("请输入密码确认");
return false;
}
if(document.form.password.value!=document.form.passwordSure.value){
window.alert("您输入的新密码与密码确认不一致");
return false;
}
return true;
}



