//ajax函数
var http_request = false;
function send_request(url)
{
	//初始化、指定处理函数、发送请求的函数
	http_request = false;
	//开始初始化XMLHttpRequest对象
	if(window.XMLHttpRequest)
	{
		http_request = new XMLHttpRequest(); //Mozilla 浏览器
		if (http_request.overrideMimeType)
		{
			http_request.overrideMimeType('text/xml'); //设置MiME类别
		}
	}
	else if (window.ActiveXObject)
	{
		try{http_request = new ActiveXObject("Msxml2.XMLHTTP");} //IE浏览器
		catch (e)
		{
			try {http_request = new ActiveXObject("Microsoft.XMLHTTP");}
			catch (e) {}
		}
	}
	if (!http_request)
	{
		window.alert("不能创建XMLHttpRequest对象实例."); //异常，创建对象实例失败
		return false;
	}
	http_request.open("GET",url,true); // 确定发送请求的方式和URL以及是否同步执行下段代码
	http_request.send(null);
}
