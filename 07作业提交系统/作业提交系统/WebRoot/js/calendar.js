//显示日期
window.addEventListener("load", initDate, false);//当窗口加载时响应此事件
// window.onload=initDate;
function initDate() {
	var dayName = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
	var monName = new Array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);

	var now = new Date();

	var dtString = now.getFullYear() + "/" + monName[now.getMonth()] + "/"
			+ now.getDate() + "&nbsp;&nbsp;" + dayName[now.getDay()];

	document.getElementById("dtField").innerHTML = dtString;  //向指定位置写入指定内容
}
/*
 * 1 Date 对象会自动把当前日期和时间保存为其初始值。 
 * 2 Date 对象 方法 FF: Firefox, IE: Internet Explorer 方法
 * 3 描述 FF IE 
 * 4 Date() 返回当日的日期和时间。 
 * 5 getDate() 从 Date 对象返回一个月中的某一天 (1 ~ 31)。 
 * 6 getDay() 从 Date 对象返回一周中的某一天 (0 ~ 6)。 
 * 7 getMonth() 从 Date 对象返回月份 (0 ~ 11)。 
 * 8 getFullYear() 从 Date 对象以四位数字返回年份。 
 * 9 getYear() 请使用 getFullYear() 方法代替。
 */

// 创建倒计时程序 目的 从此开始显示距离答辩日期还有几天
window.addEventListener("load", showDays, false);

function showDays() {
	var spanTags = document.getElementsByTagName("span");

	for (var i = 0; i < spanTags.length; i++) {
		if (spanTags[i].className.indexOf("daysTill") > -1) {
			spanTags[i].innerHTML = showTheDaysTill(spanTags[i].id);
		}
	}

	function showTheDaysTill(thisDate) {
		var theDays;

		switch (thisDate) {
		case "end":
			theDays = daysTill(5, 14); // 传参为月份和天 距离答辩日期
			break;
		case "bday":
			theDays = daysTill(8, 7);
			break;
		case "xmas":
			theDays = daysTill(12, 25);
			break;
		default:
			break;
		}
		return theDays + " "; // 返回日的编号和一个空格
	}

	function daysTill(mm, dd) {
		var now = new Date();
		var inDate = new Date(now.getFullYear(), mm - 1, dd); // mm-1月份需要减1
																// js处理月份和数字不同情况

		if (inDate.getTime() < now.getTime()) { // 将这个日期与今天进行比较
			inDate.setYear(now.getFullYear() + 1);
		}

		return Math.ceil(dayToDays(inDate) - dayToDays(now)); // 返回一个比实际数字大的整数
	}

	function dayToDays(inTime) {
		return inTime.getTime() / (1000 * 60 * 60 * 24);
	}
}

//显示此网站的访问量
window.addEventListener("load", showNumberofPeople, false);
function showNumberofPeople() {
	var caution = false;

	function setCookie(name, value, expires, path, domain, secure) {
		var curCookie = name + "=" + escape(value) +
		((expires) ? "; expires=" + expires.toGMTString() : "") +
		((path) ? "; path=" + path : "") +
		((domain) ? "; domain=" + domain : "") +
		((secure) ? "; secure" : "")
		if (!caution || (name + "=" + escape(value)).length <= 4000)
			document.cookie = curCookie;
		else if (confirm("Cookie exceeds 4KB and will be cut!"))
			document.cookie = curCookie;
	}

	function getCookie(name) {
		var prefix = name + "=";
		var cookieStartIndex = document.cookie.indexOf(prefix);
		if (cookieStartIndex == -1)
			return null;
		var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length);
		if (cookieEndIndex == -1)
			cookieEndIndex = document.cookie.length;
		return (document.cookie.substring(cookieStartIndex + prefix.length,cookieEndIndex));
	}

	function deleteCookie(name, path, domain) {
		if (getCookie(name)) {
			document.cookie = name + "=" +
			((path) ? "; path=" + path : "") +
			((domain) ? "; domain=" + domain : "") +
			"; expires=Thu, 01-Jan-70 00:00:01 GMT"
		}
	}

	function fixDate(date) {
		var base = new Date(0);
		var skew = base.getTime();
		if (skew > 0)
			date.setTime(date.getTime() - skew);
	}
	
	var now = new Date();
	fixDate(now);
	now.setTime(now.getTime() + 365 * 24 * 60 * 60 * 1000);
	var visits = getCookie("counter");
	if (!visits)
		visits = 1;
	else
		visits = parseInt(visits) + 1;
	setCookie("counter", visits, now);

	document.getElementById("visits").innerHTML = visits;
	//document.write("欢迎光临本站，您是第" + visits + "访问者！");
}

/*当用户留言提交完毕后5秒返回主界面      未用************************************************/
function delayURL(url) {
	var delay = document.getElementById("time").innerHTML;
	if(delay > 0) {
		delay--;
		document.getElementById("time").innerHTML = delay;
	} else {
		window.top.location.href = url;
    }
    setTimeout("delayURL('" + url + "')", 1000); //delayURL(http://wwer)
}
/*检查输入框是否为空*/
function checkEmpty() {	
	var title = document.getElementById("title");
	var input  = /^[\s]*$/;  
	if (input.test(title)){  
	    alert("标题不能为空！"); 
	    return false;  
	} 
}





