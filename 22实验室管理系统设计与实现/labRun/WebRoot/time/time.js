function check(){
var date=new Date();

var time= date.getYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+'--'+date.getHours()+':'+date.getMinutes()+':'+date.getSeconds();

if(document.all)
{ time1.innerHTML=time;}

var time2 =setTimeout("check()",200); }