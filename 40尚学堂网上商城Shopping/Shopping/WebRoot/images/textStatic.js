window.onerror = function(){return true;}
Sys = function(){;}
Sys.urlDecode = function(str)
{
	if("undefined" == typeof decodeURIComponent)
	{
		return unescape(str).replace(/\+/g, ' ').replace(/%2B/g,'+');
  } else {
	return unescape(str).replace(/\+/g, ' ').replace(/%2B/g,'+');
  }
};
function getTrustfulVisitorInfo(){
	var visitorInfoUrl="";
	if(typeof trustfulInfo!="undefined"&&trustfulInfo.length>0&&trustfulInfo!=null&&trustfulInfo!="null"){
		visitorInfoUrl="info="+trustfulInfo+"&";
	}
	return visitorInfoUrl;
};
Sys.urlToParams = function(urlContent)
{
	cmdMap = new Array();
	cmdParams = new Array();
    pos = -1;
    while (true)
	{
        newPos = urlContent.indexOf('&', pos+1);
        if (newPos>=0) {
            encodedProperty = urlContent.substring(pos+1, newPos);
        }
        else {
            encodedProperty = urlContent.substring(pos+1, urlContent.length);
        }

        equalsPos = encodedProperty.indexOf('=');
        paramName = encodedProperty.substring(0, equalsPos);
        paramValue = Sys.urlDecode(encodedProperty.substring(equalsPos+1, encodedProperty.length));

        cmdParams[paramName] = paramValue;

        if (newPos==-1) {
            break;
        }
        pos = newPos;
    }
	return cmdParams;
};
function setCookie(name,value)
{
    var Days = 30;
    var exp  = new Date();    //new Date("December 31, 9998");
        exp.setTime(exp.getTime() + Days*24*60*60*1000);
        document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
};
function getCookie(name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
        if(arr=document.cookie.match(reg)) return unescape(arr[2]);
        else return null;
};
function getGid(){
	if(typeof jid!="undefined"){
		return "jid="+jid+"&";
	}
	else
	return "";
};
function getParam()
{
	var url="";
	params = Sys.urlToParams(live800_configContent);
	if(typeof params["live800_operator"]!="undefined"&&params["live800_operator"].length!=0&&params["live800_operator"]!="undefined")
	{
		url="operatorId="+params["live800_operator"]+"&";
	}
	if(typeof params["live800_skill"]!="undefined"&&params["live800_skill"].length!=0&&params["live800_skill"]!="undefined")
	{
		url=url+"skillId="+params["live800_skill"]+"&";
	}
	return url;
};
function URLEncode(Str){
  if(Str==null||Str=="")
    return "";
  var newStr="";
  function toCase(sStr){
    return sStr.toString(16).toUpperCase();
    }
  for(var i=0,icode,len=Str.length;i<len;i++){
    icode=Str.charCodeAt(i);
    if( icode<0x10)
      newStr+="%0"+icode.toString(16).toUpperCase();
    else if(icode<0x80){
      if(icode==0x20)
        newStr+="+";
      else if((icode>=0x30&&icode<=0x39)||(icode>=0x41&&icode<=0x5A)||(icode>=0x61&&icode<=0x7A))
        newStr+=Str.charAt(i);
      else
        newStr+="%"+toCase(icode);
      }
    else if(icode<0x800){
      newStr+="%"+toCase(0xC0+(icode>>6));
      newStr+="%"+toCase(0x80+icode%0x40);
      }
    else{
      newStr+="%"+toCase(0xE0+(icode>>12));
      newStr+="%"+toCase(0x80+(icode>>6)%0x40);
      newStr+="%"+toCase(0x80+icode%0x40);
      }
    }
  return newStr;
};
function getEnterUrl()
{
	var url="";
	if(enterurl=="null")
	enterurl=document.URL;
	url=URLEncode(enterurl);
	return "&enterurl="+url;
};
function delCookie(name)
{
    var exp = new Date();
        exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
        if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
};
function setLiveCookie()
{
	delCookie("operatorId");
	delCookie("skillId");
	if(typeof params["live800_operator"]!="undefined"&&params["live800_operator"].length!=0&&params["live800_operator"]!="undefined")
	{
		setCookie("operatorId",params["live800_operator"]);
	}
	if(typeof params["live800_skill"]!="undefined"&&params["live800_skill"].length!=0&&params["live800_skill"]!="undefined")
	{
		setCookie("skillId",params["live800_skill"]);
	}
}
params = Sys.urlToParams(live800_configContent);
setLiveCookie();
if(params["live800_operator"]!="undefined"&&params["live800_skill"]!="undefined")
{
	setCookie("operatorId",params["live800_operator"]);
	setCookie("skillId",params["live800_skill"]);
}
if(live800_companyID == null || live800_companyID == ""){alert("miss companyID");}else{
preferences = new Array();
preferences["companyID"] = live800_companyID;
preferences["configID"] = live800_configID;
preferences["text"] =  (params["live800_text"] !=null ? unescape(params["live800_text"]) : unescape("%u5728%u7EBF%u5BA2%u670D"));
preferences["protocol"] = "http";
preferences["baseUrl"] = live800_baseUrl;
preferences["baseHtmlUrl"] = live800_baseHtmlUrl;
preferences["baseWebapp"] = live800_baseWebApp;
preferences["baseChatHtmlDir"] = live800_baseChatHtmlDir;
preferences["visitorIDInSession"] = preferences["companyID"] + "chater";
var layerHtml = '<a id="live800iconlink" target="_self" href="javascript:void(0)" onclick="this.newWindow = window.open(\'' + this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + this.preferences["baseWebapp"] + this.preferences["baseChatHtmlDir"] +"/chatbox.jsp?"+getGid()+getParam()+"companyID="+this.preferences["companyID"]+"&configID="+this.preferences["configID"] +getEnterUrl()+'&'+getTrustfulVisitorInfo()+'\', \'chatbox'+ this.preferences["companyID"] + '\', \'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=541,height=401\');this.newWindow.focus();this.newWindow.opener=window;return false;">';
layerHtml += preferences["text"];
layerHtml += '</a>';
function text_generate()
{
	return layerHtml;
}
if((typeof live800_codeType)=="undefined") live800_codeType = null;
if(live800_codeType=="custom"||live800_codeType==null||live800_codeType==""||live800_codeType=="null")
	{document.write(layerHtml);}
}