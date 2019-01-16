//----------------------------------------------------------------------------
//  这是梅花雨做的一个日历 Javascript 页面脚本控件，适用于微软的 IE （5.0以上）浏览器
//  主调用函数是 setday(this,[object])和setday(this)，[object]是控件输出的控件名，举两个例子：
//  一、<input name=txt><input type=button value=setday onclick="setday(this,document.all.txt)">
//  二、<input onfocus="setday(this)">
//  若有什么不足的地方，或者您有更好的建议，请与我联系：mail: meizz@hzcnc.com
//  本日历的年份限制是（1000 - 9999）
//  按ESC键关闭该控件
//  在年和月的显示地方点击时会分别出年与月的下拉框
//  控件外任意点击一点即可关闭该控件
/* 以下为walkingpoison的修改说明
walkingpoison联系方式：wayx@kali.com.cn

Ver	2.0
修改日期：2002-12-13
修改内容：
1.*全新修改使用iframe作为日历的载体，不再被select和flash等控件挡住。
2.修正了移植到iframe后移动日历控件的问题。

Ver	1.5
修改日期：2002-12-4
修改内容：
1.选中的日期显示为凹下去的样式
2.修改了关闭层的方法，使得失去焦点的时候能够关闭日历。
3.修改按键处理，使得Tab切换焦点的时候可以关闭控件
4.*可以自定义日历是否可以拖动

Ver 1.4
修改日期：2002-12-3
修改内容：
1.修正选中年/月份下拉框后按Esc键导致年/月份不显示的问题
2.修正使用下拉框选择月份造成的日期错误（字符串转化为数字的问题）
3.*外观样式的改进，使得控件从丑小鸭变成了美丽的天鹅，从灰姑娘变成了高贵的公主，从……（读者可以自己进行恰当的比喻）
4.再次增大年/月份的点击空间，并对下拉框的位置稍作调整

注：*号表示比较关键的改动

说明：
1.受到iframe的限制，如果拖动出日历窗口，则日历会停止移动。
*/

//==================================================== 参数设定部分 =======================================================
var bMoveable=true;		//设置日历是否可以拖动
var _VersionInfo="关闭"	//版本信息

//==================================================== WEB 页面显示部分 =====================================================
var strFrame;		//存放日历层的HTML代码
document.writeln('<iframe id=meizzDateLayer height="204" width="144" Author=wayx frameborder=0 style="position: absolute; width: 144; height: 204; z-index: 9998; display: none"></iframe>');
strFrame='<style>';
strFrame+='INPUT.button{BORDER-RIGHT: #E4F1F9 1px solid;BORDER-TOP: #E4F1F9 1px solid;BORDER-LEFT: #E4F1F9 1px solid;';
strFrame+='BORDER-BOTTOM: #E4F1F9 1px solid;BACKGROUND-COLOR: #D2E8F6;font-family:宋体;}';
strFrame+='TD{FONT-SIZE: 12px;font-family:宋体;}';
strFrame+='</style>';
strFrame+='<scr' + 'ipt>';
strFrame+='var datelayerx,datelayery;	/*存放日历控件的鼠标位置*/';
strFrame+='var bDrag;	/*标记是否开始拖动*/';
strFrame+='function document.onmousemove()	/*在鼠标移动事件中，如果开始拖动日历，则移动日历*/';
strFrame+='{if(bDrag && window.event.button==1)';
strFrame+='	{var DateLayer=parent.document.all.meizzDateLayer.style;';
strFrame+='		DateLayer.posLeft += window.event.clientX-datelayerx;/*由于每次移动以后鼠标位置都恢复为初始的位置，因此写法与div中不同*/';
strFrame+='		DateLayer.posTop += window.event.clientY-datelayery;}}';
strFrame+='function DragStart()		/*开始日历拖动*/';
strFrame+='{var DateLayer=parent.document.all.meizzDateLayer.style;';
strFrame+='	datelayerx=window.event.clientX;';
strFrame+='	datelayery=window.event.clientY;';
strFrame+='	bDrag=true;}';
strFrame+='function DragEnd(){		/*结束日历拖动*/';
strFrame+='	bDrag=false;}';
strFrame+='</scr' + 'ipt>';
strFrame+='<div style="z-index:9999;position: absolute; left:0; top:0;" onselectstart="return false"><span id=tmpSelectYearLayer Author=wayx style="z-index: 9999;position: absolute;top: 3; left: 19;display: none"></span>';
strFrame+='<span id=tmpSelectMonthLayer Author=wayx style="z-index: 9999;position: absolute;top: 3; left: 78;display: none"></span>';
strFrame+='<table border=1 cellspacing=0 cellpadding=0 width=142 height=160 bordercolor=#E4F1F9 bgcolor=#E4F1F9 Author="wayx">';
strFrame+='  <tr Author="wayx"><td width=142 height=18 Author="wayx" bgcolor=#FFFFFF><table border=0 cellspacing=1 cellpadding=0 width=140 Author="wayx" height=18>';
strFrame+='      <tr align=center Author="wayx"><td width=16 align=center bgcolor=#D2E8F6 style="font-size:12px;cursor: hand;color: #00000" ';
strFrame+='        onclick="parent.meizzPrevM()" title="向前翻 1 月" Author=meizz><b Author=meizz>&lt;</b>';
strFrame+='        </td><td width=60 align=center bgcolor=#D2E8F6 style="font-size:12px;cursor:default" Author=meizz '; 
strFrame+='onmouseover="style.backgroundColor=\'#E4F1F9\'" onmouseout="style.backgroundColor=\'#D2E8F6\'" ';
strFrame+='onclick="parent.tmpSelectYearInnerHTML(this.innerText.substring(0,4))" title="点击这里选择年份"><span Author=meizz id=meizzYearHead></span></td>';
strFrame+='<td width=48 align=center bgcolor=#D2E8F6 style="font-size:12px;cursor:default" Author=meizz onmouseover="style.backgroundColor=\'#E4F1F9\'" ';
strFrame+=' onmouseout="style.backgroundColor=\'#D2E8F6\'" onclick="parent.tmpSelectMonthInnerHTML(this.innerText.length==3?this.innerText.substring(0,1):this.innerText.substring(0,2))"';
strFrame+='        title="点击这里选择月份"><span id=meizzMonthHead Author=meizz></span></td>';
strFrame+='        <td width=16 bgcolor=#D2E8F6 align=center style="font-size:12px;cursor: hand;color: #00000" ';
strFrame+='         onclick="parent.meizzNextM()" title="向后翻 1 月" Author=meizz><b Author=meizz>&gt;</b></td></tr>';
strFrame+='    </table></td></tr>';
strFrame+='  <tr Author="wayx"><td width=142 height=18 Author="wayx">';
strFrame+='<table border=1 cellspacing=0 cellpadding=0 bgcolor=#D2E8F6 ' + (bMoveable? 'onmousedown="DragStart()" onmouseup="DragEnd()"':'');
strFrame+=' BORDERCOLORLIGHT=#E4F1F9 BORDERCOLORDARK=#FFFFFF width=140 height=20 Author="wayx" style="cursor:' + (bMoveable ? 'move':'default') + '">';
strFrame+='<tr Author="wayx" align=center valign=bottom><td style="font-size:12px;color:red" Author=meizz>日</td>';
strFrame+='<td style="font-size:12px;color:#000000" Author=meizz>一</td><td style="font-size:12px;color:#000000" Author=meizz>二</td>';
strFrame+='<td style="font-size:12px;color:#000000" Author=meizz>三</td><td style="font-size:12px;color:#000000" Author=meizz>四</td>';
strFrame+='<td style="font-size:12px;color:#000000" Author=meizz>五</td><td style="font-size:12px;color:#00CC00" Author=meizz>六</td></tr>';
strFrame+='</table></td></tr><!-- Author:F.R.Huang(meizz) http://www.meizz.com/ mail: meizz@hzcnc.com 2002-10-8 -->';
strFrame+='  <tr Author="wayx"><td width=142 height=120 Author="wayx">';
strFrame+='    <table border=1 cellspacing=2 cellpadding=0 BORDERCOLORLIGHT=#E4F1F9 BORDERCOLORDARK=#FFFFFF bgcolor=#D2E8F6 width=140 height=120 Author="wayx">';
var n=0; for (j=0;j<5;j++){ strFrame+= ' <tr align=center Author="wayx">'; for (i=0;i<7;i++){
strFrame+='<td width=20 height=20 id=meizzDay'+n+' style="font-size:12px" Author=meizz onclick=parent.meizzDayClick(this.innerText,0)></td>';n++;}
strFrame+='</tr>';}
strFrame+='      <tr align=center Author="wayx">';
for (i=35;i<39;i++)strFrame+='<td width=20 height=20 id=meizzDay'+i+' style="font-size:12px" Author=wayx onclick="parent.meizzDayClick(this.innerText,0)"></td>';
strFrame+='        <td colspan=3 align=right Author=meizz><span onclick=parent.closeLayer() style="font-size:12px;cursor: hand"';
strFrame+='          Author=meizz title="' + _VersionInfo + '"></span>&nbsp;</td></tr>';
										 // Author=meizz title="' + _VersionInfo + '"><u>×</u></span>&nbsp;</td></tr>';
strFrame+='    </table></td></tr><tr Author="wayx"><td Author="wayx">';
strFrame+='        <table border=0 cellspacing=1 cellpadding=0 width=100% Author="wayx" bgcolor=#FFFFFF>';
strFrame+='          <tr Author="wayx"><td Author=meizz align=left><input Author=meizz type=button class=button value="<<" title="向前翻 1 年" onclick="parent.meizzPrevY()" ';
strFrame+='             onfocus="this.blur()" style="font-size: 12px; height: 18px"><input Author=meizz class=button title="向前翻 1 月" type=button ';
strFrame+='             value="< " onclick="parent.meizzPrevM()" onfocus="this.blur()" style="font-size: 12px; height: 18px"></td><td ';
strFrame+='             Author=meizz align=center><input Author=meizz type=button class=button value="今天" onclick="parent.meizzToday()" ';
strFrame+='             onfocus="this.blur()" title="当前日期" style="font-size: 12px; height: 18px; cursor:hand"></td><td ';
strFrame+='             Author=meizz align=right><input Author=meizz type=button class=button value=" >" onclick="parent.meizzNextM()" ';
strFrame+='             onfocus="this.blur()" title="向后翻 1 月" class=button style="font-size: 12px; height: 18px"><input ';
strFrame+='             Author=meizz type=button class=button value=">>" title="向后翻 1 年" onclick="parent.meizzNextY()"';
strFrame+='             onfocus="this.blur()" style="font-size: 12px; height: 18px"></td>';
strFrame+='</tr></table></td></tr></table></div>';

window.frames.meizzDateLayer.document.writeln(strFrame);
window.frames.meizzDateLayer.document.close();		//解决ie进度条不结束的问题

//==================================================== WEB 页面显示部分 ======================================================
var outObject;
var outButton;		//点击的按钮
var outDate="";		//存放对象的日期
var odatelayer=window.frames.meizzDateLayer.document.all;		//存放日历对象
function setday(tt,obj) //主调函数
{
	if (arguments.length >  2){alert("对不起！传入本控件的参数太多！");return;}
	if (arguments.length == 0){alert("对不起！您没有传回本控件任何参数！");return;}
	var dads  = document.all.meizzDateLayer.style;
	var th = tt;
	var ttop  = tt.offsetTop;     //TT控件的定位点高
	var thei  = tt.clientHeight;  //TT控件本身的高
	var tleft = tt.offsetLeft;    //TT控件的定位点宽
	var ttyp  = tt.type;          //TT控件的类型
	while (tt = tt.offsetParent){ttop+=tt.offsetTop; tleft+=tt.offsetLeft;}
	dads.top  = (ttyp=="image")? ttop+thei : ttop+thei+6;
	dads.left = tleft;
	outObject = (arguments.length == 1) ? th : obj;
	outButton = (arguments.length == 1) ? null : th;	//设定外部点击的按钮
	//根据当前输入框的日期显示日历的年月
	var reg = /^(\d+)-(\d{1,2})-(\d{1,2})$/; 
	var r = outObject.value.match(reg); 
	if(r!=null){
		r[2]=r[2]-1; 
		var d= new Date(r[1], r[2],r[3]); 
		if(d.getFullYear()==r[1] && d.getMonth()==r[2] && d.getDate()==r[3]){
			outDate=d;		//保存外部传入的日期
		}
		else outDate="";
			meizzSetDay(r[1],r[2]+1);
	}
	else{
		outDate="";
		meizzSetDay(new Date().getFullYear(), new Date().getMonth() + 1);
	}
	dads.display = '';

	event.returnValue=false;
}

var MonHead = new Array(12);    		   //定义阳历中每个月的最大天数
    MonHead[0] = 31; MonHead[1] = 28; MonHead[2] = 31; MonHead[3] = 30; MonHead[4]  = 31; MonHead[5]  = 30;
    MonHead[6] = 31; MonHead[7] = 31; MonHead[8] = 30; MonHead[9] = 31; MonHead[10] = 30; MonHead[11] = 31;

var meizzTheYear=new Date().getFullYear(); //定义年的变量的初始值
var meizzTheMonth=new Date().getMonth()+1; //定义月的变量的初始值
var meizzWDay=new Array(39);               //定义写日期的数组

function document.onclick() //任意点击时关闭该控件	//ie6的情况可以由下面的切换焦点处理代替
{ 
  with(window.event)
  { if (srcElement.getAttribute("Author")==null && srcElement != outObject && srcElement != outButton)
    closeLayer();
  }
}

function document.onkeyup()		//按Esc键关闭，切换焦点关闭
  {
    if (window.event.keyCode==27){
		if(outObject)outObject.blur();
		closeLayer();
	}
	else if(document.activeElement)
		if(document.activeElement.getAttribute("Author")==null && document.activeElement != outObject && document.activeElement != outButton)
		{
			closeLayer();
		}
  }

function meizzWriteHead(yy,mm)  //往 head 中写入当前的年与月
  {
	odatelayer.meizzYearHead.innerText  = yy + " 年";
    odatelayer.meizzMonthHead.innerText = mm + " 月";
  }

function tmpSelectYearInnerHTML(strYear) //年份的下拉框
{
  if (strYear.match(/\D/)!=null){alert("年份输入参数不是数字！");return;}
  var m = (strYear) ? strYear : new Date().getFullYear();
  if (m < 1000 || m > 9999) {alert("年份值不在 1000 到 9999 之间！");return;}
  var n = m - 1;
  if (n < 1000) n = 1000;
  if (n + 2 > 9999) n = 9998;
  var s = "<select Author=meizz name=tmpSelectYear style='font-size: 12px' "
     s += "onblur='document.all.tmpSelectYearLayer.style.display=\"none\"' "
     s += "onchange='document.all.tmpSelectYearLayer.style.display=\"none\";"
     s += "parent.meizzTheYear = this.value; parent.meizzSetDay(parent.meizzTheYear,parent.meizzTheMonth)'>\r\n";
  var selectInnerHTML = s;
  for (var i = n; i < n + 2; i++)
  {
    if (i == m)
       {selectInnerHTML += "<option Author=wayx value='" + i + "' selected>" + i + "年" + "</option>\r\n";}
    else {selectInnerHTML += "<option Author=wayx value='" + i + "'>" + i + "年" + "</option>\r\n";}
  }
  selectInnerHTML += "</select>";
  odatelayer.tmpSelectYearLayer.style.display="";
  odatelayer.tmpSelectYearLayer.innerHTML = selectInnerHTML;
  odatelayer.tmpSelectYear.focus();
}

function tmpSelectMonthInnerHTML(strMonth) //月份的下拉框
{
  if (strMonth.match(/\D/)!=null){alert("月份输入参数不是数字！");return;}
  var m = (strMonth) ? strMonth : new Date().getMonth() + 1;
  var s = "<select Author=meizz name=tmpSelectMonth style='font-size: 12px' "
     s += "onblur='document.all.tmpSelectMonthLayer.style.display=\"none\"' "
     s += "onchange='document.all.tmpSelectMonthLayer.style.display=\"none\";"
     s += "parent.meizzTheMonth = this.value; parent.meizzSetDay(parent.meizzTheYear,parent.meizzTheMonth)'>\r\n";
  var selectInnerHTML = s;
  for (var i = 1; i < 13; i++)
  {
    if (i == m)
       {selectInnerHTML += "<option Author=wayx value='"+i+"' selected>"+i+"月"+"</option>\r\n";}
    else {selectInnerHTML += "<option Author=wayx value='"+i+"'>"+i+"月"+"</option>\r\n";}
  }
  selectInnerHTML += "</select>";
  odatelayer.tmpSelectMonthLayer.style.display="";
  odatelayer.tmpSelectMonthLayer.innerHTML = selectInnerHTML;
  odatelayer.tmpSelectMonth.focus();
}

function closeLayer()               //这个层的关闭
  {
    document.all.meizzDateLayer.style.display="none";
  }

function IsPinYear(year)            //判断是否闰平年
  {
    if (0==year%4&&((year%100!=0)||(year%400==0))) return true;else return false;
  }

function GetMonthCount(year,month)  //闰年二月为29天
  {
    var c=MonHead[month-1];if((month==2)&&IsPinYear(year)) c++;return c;
  }
function GetDOW(day,month,year)     //求某天的星期几
  {
    var dt=new Date(year,month-1,day).getDay()/7; return dt;
  }

function meizzPrevY()  //往前翻 Year
  {
    if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear--;}
    else{alert("年份超出范围（1000-9999）！");}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzNextY()  //往后翻 Year
  {
    if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear++;}
    else{alert("年份超出范围（1000-9999）！");}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzToday()  //Today Button
  {
	var today;
    meizzTheYear = new Date().getFullYear();
    meizzTheMonth = new Date().getMonth()+1;
    today=new Date().getDate();
    //meizzSetDay(meizzTheYear,meizzTheMonth);
    if(outObject){
		outObject.value=meizzTheYear + "-" + meizzTheMonth + "-" + today;
    }
    closeLayer();
  }
function meizzPrevM()  //往前翻月份
  {
    if(meizzTheMonth>1){meizzTheMonth--}else{meizzTheYear--;meizzTheMonth=12;}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzNextM()  //往后翻月份
  {
    if(meizzTheMonth==12){meizzTheYear++;meizzTheMonth=1}else{meizzTheMonth++}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }

function meizzSetDay(yy,mm)   //主要的写程序**********
{
  meizzWriteHead(yy,mm);
  //设置当前年月的公共变量为传入值
  meizzTheYear=yy;
  meizzTheMonth=mm;
  
  for (var i = 0; i < 39; i++){meizzWDay[i]=""};  //将显示框的内容全部清空
  var day1 = 1,day2=1,firstday = new Date(yy,mm-1,1).getDay();  //某月第一天的星期几
  for (i=0;i<firstday;i++)meizzWDay[i]=GetMonthCount(mm==1?yy-1:yy,mm==1?12:mm-1)-firstday+i+1	//上个月的最后几天
  for (i = firstday; day1 < GetMonthCount(yy,mm)+1; i++){meizzWDay[i]=day1;day1++;}
  for (i=firstday+GetMonthCount(yy,mm);i<39;i++){meizzWDay[i]=day2;day2++}
  for (i = 0; i < 39; i++)
  { var da = eval("odatelayer.meizzDay"+i)     //书写新的一个月的日期星期排列
    if (meizzWDay[i]!="")
      { 
		//初始化边框
		da.borderColorLight="#E4F1F9";
		da.borderColorDark="#FFFFFF";
		if(i<firstday)		//上个月的部分
		{
			da.innerHTML="<b><font color=gray>" + meizzWDay[i] + "</font></b>";
			da.title=(mm==1?12:mm-1) +"月" + meizzWDay[i] + "日";
			da.onclick=Function("meizzDayClick(this.innerText,-1)");
			if(!outDate)
				da.style.backgroundColor = ((mm==1?yy-1:yy) == new Date().getFullYear() && 
					(mm==1?12:mm-1) == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate()) ?
					 "#FFD700":"#D2E8F6";
			else
			{
				da.style.backgroundColor =((mm==1?yy-1:yy)==outDate.getFullYear() && (mm==1?12:mm-1)== outDate.getMonth() + 1 && 
				meizzWDay[i]==outDate.getDate())? "#00ffff" :
				(((mm==1?yy-1:yy) == new Date().getFullYear() && (mm==1?12:mm-1) == new Date().getMonth()+1 && 
				meizzWDay[i] == new Date().getDate()) ? "#FFD700":"#D2E8F6");
				//将选中的日期显示为凹下去
				if((mm==1?yy-1:yy)==outDate.getFullYear() && (mm==1?12:mm-1)== outDate.getMonth() + 1 && 
				meizzWDay[i]==outDate.getDate())
				{
					da.borderColorLight="#FFFFFF";
					da.borderColorDark="#E4F1F9";
				}
			}
		}
		else if (i>=firstday+GetMonthCount(yy,mm))		//下个月的部分
		{
			da.innerHTML="<b><font color=gray>" + meizzWDay[i] + "</font></b>";
			da.title=(mm==12?1:mm+1) +"月" + meizzWDay[i] + "日";
			da.onclick=Function("meizzDayClick(this.innerText,1)");
			if(!outDate)
				da.style.backgroundColor = ((mm==12?yy+1:yy) == new Date().getFullYear() && 
					(mm==12?1:mm+1) == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate()) ?
					 "#FFD700":"#D2E8F6";
			else
			{
				da.style.backgroundColor =((mm==12?yy+1:yy)==outDate.getFullYear() && (mm==12?1:mm+1)== outDate.getMonth() + 1 && 
				meizzWDay[i]==outDate.getDate())? "#00ffff" :
				(((mm==12?yy+1:yy) == new Date().getFullYear() && (mm==12?1:mm+1) == new Date().getMonth()+1 && 
				meizzWDay[i] == new Date().getDate()) ? "#FFD700":"#D2E8F6");
				//将选中的日期显示为凹下去
				if((mm==12?yy+1:yy)==outDate.getFullYear() && (mm==12?1:mm+1)== outDate.getMonth() + 1 && 
				meizzWDay[i]==outDate.getDate())
				{
					da.borderColorLight="#FFFFFF";
					da.borderColorDark="#E4F1F9";
				}
			}
		}
		else		//本月的部分
		{
			da.innerHTML="<b>" + meizzWDay[i] + "</b>";
			da.title=mm +"月" + meizzWDay[i] + "日";
			da.onclick=Function("meizzDayClick(this.innerText,0)");		//给td赋予onclick事件的处理
			//如果是当前选择的日期，则显示亮蓝色的背景；如果是当前日期，则显示暗黄色背景
			if(!outDate)
				da.style.backgroundColor = (yy == new Date().getFullYear() && mm == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate())?
					"#FFD700":"#D2E8F6";
			else
			{
				da.style.backgroundColor =(yy==outDate.getFullYear() && mm== outDate.getMonth() + 1 && meizzWDay[i]==outDate.getDate())?
					"#00ffff":((yy == new Date().getFullYear() && mm == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate())?
					"#FFD700":"#D2E8F6");
				//将选中的日期显示为凹下去
				if(yy==outDate.getFullYear() && mm== outDate.getMonth() + 1 && meizzWDay[i]==outDate.getDate())
				{
					da.borderColorLight="#FFFFFF";
					da.borderColorDark="#E4F1F9";
				}
			}
		}
        da.style.cursor="hand"
      }
    else{da.innerHTML="";da.style.backgroundColor="";da.style.cursor="default"}
  }
}

function meizzDayClick(n,ex)  //点击显示框选取日期，主输入函数*************
{
  var yy=meizzTheYear;
  var mm = parseInt(meizzTheMonth)+ex;	//ex表示偏移量，用于选择上个月份和下个月份的日期
	//判断月份，并进行对应的处理
	if(mm<1){
		yy--;
		mm=12+mm;
	}
	else if(mm>12){
		yy++;
		mm=mm-12;
	}
	
  if (mm < 10){mm = "0" + mm;}
  if (outObject)
  {
    if (!n) {//outObject.value=""; 
      return;}
    if ( n < 10){n = "0" + n;}
    outObject.value= yy + "-" + mm + "-" + n ; //注：在这里你可以输出改成你想要的格式
    closeLayer(); 
  }
  else {closeLayer(); alert("您所要输出的控件对象并不存在！");}
}