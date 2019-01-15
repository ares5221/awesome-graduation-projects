
var _D			//div
var div_Top;		//层顶坐标
var div_Id;		//层的名字
var div_Left;		//层左边坐标
var div_Width;		//层的宽度
var div_Height;		//层的高度
var doc_Height;		//窗口当前总高度
var doc_Width;		//窗口当前宽度

//style对象中的属性
var _style;
var style_Top;
var style_Left;

var T = function (divId){
	alert(divId);
	//alert("T");
	init(divId);
	style_Top=(arrayPageSize[1] - div_Height)/2+arrayScroll[1];
	style_Left=(arrayPageSize[0] - div_Width)/2+arrayScroll[0];
	_style.display="";
}

//获取属性
var init = function (divId){
	_D =		document.getElementById(divId);
	div_Top =    parseInt(document.getElementById(divId).style.top,10)			//获取高
	div_Left =   parseInt(document.getElementById(divId).style.left,10)			//div的y坐标
    div_Height = parseInt(document.getElementById(divId).offsetHeight,10)		//div的高度
    div_Width =	 parseInt(document.getElementById(divId).offsetWidth,10)		//div的宽度	
	arrayScroll		=	 getPageScroll();
	arrayPageSize	=    getPageSize();
	_style = divId.style;
	style_Top= divId.style.top;
	style_Left= divId.style.left;
}

//增加的方法
var addTM = function (x,y){
	//获取值
	var td1 = document.getElementById("gztype").value;
	var td2 = document.getElementById("jinge").value;

	//表格插入
	var _T = document.getElementById("t2");
	var R_ind = _T.rows.Length;
	var objTR = objTable.insertRow(R_ind);  
  	var objTD_1=  objTR.insertCell(0);
	var objTD_2=  objTR.insertCell(1);
	objTD_1.innerHTML="<td>"+td1+"</td>";
	objTD_2.innerHTML="<td>"+td2+"</td>";
}

//获取getPageSize
var getPageSize = function () {
	var de = document.documentElement;
	var w = window.innerWidth || self.innerWidth || (de&&de.clientWidth) || document.body.clientWidth;
	var h = window.innerHeight || self.innerHeight || (de&&de.clientHeight) || document.body.clientHeight
	arrayPageSize = new Array(w,h) 
	return arrayPageSize;
}

//获取pageScrollTop
var getPageScroll = function (){
	var yScrolltop;
	var xScrollleft;
	if (self.pageYOffset || self.pageXOffset) {
		yScrolltop = self.pageYOffset;
		xScrollleft = self.pageXOffset;
	} else if (document.documentElement && document.documentElement.scrollTop || document.documentElement.scrollLeft ){	 // Explorer 6 Strict
		yScrolltop = document.documentElement.scrollTop;
		xScrollleft = document.documentElement.scrollLeft;
	} else if (document.body) {// all other Explorers
		yScrolltop = document.body.scrollTop;
		xScrollleft = document.body.scrollLeft;
	}
	arrayPageScroll = new Array(xScrollleft,yScrolltop) 
	return arrayPageScroll;
}

