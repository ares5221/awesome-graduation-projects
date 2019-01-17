window.onerror = function(){return true;}
Sys = function(){;}
Sys.NS = (document.layers) ? true : false;
Sys.IE = (document.all) ? true : false;
Sys.DOM = (document.getElementById) ? true : false;
if (Sys.IE) Sys.DOM = false;
Sys.MAC = (navigator.platform) && (navigator.platform.toUpperCase().indexOf('MAC') >= 0);
if (Sys.NS) Sys.MAC = false;
Sys.getObj = function(objId){if (document.getElementById)return document.getElementById(objId);else if (document.all)return document.all(objId);};
Sys.urlEncode = function(str)
{
	var i,c,ret="",strSpecial="!\"#$%&'()*+,/:;<=>?@[\]^`{|}~%";
	for(i=0;i<str.length;i++)
	{
		c=str.charAt(i);
		if(c==" ")
		ret+="+";
		else if(strSpecial.indexOf(c)!=-1)
			ret+="%"+str.charCodeAt(i).toString(16);
		else
		ret+=c;
	}
	return ret;
};
Sys.urlDecode = function(str)
{
	if("undefined" == typeof decodeURIComponent)
	{
		return unescape(str).replace(/\+/g, ' ').replace(/%2B/g,'+');
  	} else {
  		/*just use my self decode script*/
  		/*return decodeURIComponent(str.replace(/\+/g, ' ').replace(/%2B/g,'+'));*/
  		return unescape(str).replace(/\+/g, ' ').replace(/%2B/g,'+');
  }
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
        paramValue =(encodedProperty.substring(equalsPos+1, encodedProperty.length));

        cmdParams[paramName] = paramValue;

        if (newPos==-1) {
            break;
        }
        pos = newPos;
    }
	return cmdParams;
};
 
Sys.addEvent = function(objectId, eventName, eventFunction)
{
	if(document.attachEvent)
		objectId.attachEvent("on"+eventName, eventFunction);
	else
		objectId.addEventListener(eventName, eventFunction, false);
}
function getTrustfulVisitorInfo(){
	var visitorInfoUrl="";
	if(typeof trustfulInfo!="undefined"&&trustfulInfo.length>0&&trustfulInfo!=null&&trustfulInfo!="null"){
		visitorInfoUrl="info="+trustfulInfo+"";
	}
	return visitorInfoUrl;
}
function StaticIcon(inLogger, inPreferences)
{
	this.logger = inLogger;
	this.preferences = inPreferences;
	this.companyID = this.preferences["companyID"];
	this.iconIndex = this.preferences["iconIndex"];
	this.online = this.preferences["online"];
	this.offline = this.preferences["offline"];
	this.parentObject = null;
	this.reload = StaticIcon_reload;
	this.generate = StaticIcon_generate;
	this.onIconClick = StaticIcon_onIconClick
	this.start = StaticIcon_start;
}
function StaticIcon_start()
{
	this.generate();
};
function StaticIcon_reload()
{
/*
	var baseIconUrl = this.preferences["protocol"] + "://" + this.preferences["baseHtmlUrl"] + this.preferences["baseWebapp"] + this.preferences["baseChatHtmlDir"] + "/icons";
	if(this.online == null || this.offline == null)
	{
		onlineUrl = baseIconUrl + "/" + this.iconIndex + "_online.gif";
		offlineUrl = baseIconUrl + "/" + this.iconIndex + "_offline.gif";
	}else
	{
		onlineUrl = this.online;
		offlineUrl = this.offline;
	}

	var reloadUrl = this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + this.preferences["baseWebapp"] + "/SurferServer?cmd=111";
	reloadUrl += "&companyID=" + this.companyID;
	reloadUrl += "&online=" + onlineUrl;
	reloadUrl += "&offline=" + offlineUrl;
	Sys.getObj("live800icon").src = reloadUrl;
*/
	// version 3 do nothing, the reload function remove to visiteHandle
	
};
function StaticIcon_generate()
{
	var live800IconLink = Sys.getObj("live800iconlink");
	var live800Icon = Sys.getObj("live800icon");
	if(live800Icon == null) return;
	var baseIconUrl = this.preferences["protocol"] + "://" + this.preferences["baseHtmlUrl"] + this.preferences["baseWebapp"] + this.preferences["baseChatHtmlDir"] + "/icons";
	if(this.preferences["online"] == null || this.preferences["offline"] == null)
	{
		onlineUrl = baseIconUrl + "/" + this.preferences["iconIndex"] + "_online.gif";
		offlineUrl = baseIconUrl + "/" + this.preferences["iconIndex"] + "_offline.gif";
	}else
	{
		onlineUrl = this.preferences["online"];
		offlineUrl = this.preferences["offline"];
	}
	live800Icon.src = this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + this.preferences["baseWebapp"] + '/SurferServer?'+getParam()+'&cmd=111&companyID=' + this.preferences["companyID"] + '&online=' + onlineUrl + '&offline=' + offlineUrl+'&'+getTrustfulVisitorInfo();
	var attr='width=541,height=401';
	var tempsurl=this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + this.preferences["baseWebapp"]+"/chatClient/chatbox.jsp?"+getGid()+getParam()+"&companyID="+ this.preferences["companyID"]+getEnterUrl()+"&"+getTrustfulVisitorInfo();
	var boxname="chatbox"+this.preferences["companyID"];
	live800IconLink.href ="javascript:window.open('"+tempsurl+"','"+boxname+"','"+attr+"')";
	Sys.addEvent(live800IconLink, "click", function(){staticIconOnIconClick();return false;});
	live800Icon.border = 0;
	this.reload();
};
function staticIconOnIconClick()
{
	globalIcon.onIconClick();
}
function StaticIcon_onIconClick()
{
	this.parentObject.onIconClick();
};
function Logger()
{
	//document.write('<div style="position: absolute; top: 430; left: 0;"><textarea style=" width:800px; height:600px;" id="loggerTextarea"></textarea>');
	this.textarea = document.getElementById('loggerTextarea');
	this.log = Logger_log;
}
function Logger_log(message)
{
	if(this.textarea!=null)
	{
		newMessage = new Date() + ' ' +message + '\r\n';
		this.textarea.value += newMessage;
		this.textarea.scrollTop = 999999;
	}
};
function RpcMethod(inServiceName, inCmdNo, inParams, inRetryTimes, inOnSuccess, inOnError)
{
	this.serviceName = inServiceName;
	this.cmdNo = inCmdNo;
	this.params = inParams;
	this.retryTimes = inRetryTimes;
	this.onSuccess = inOnSuccess;
	this.onError = inOnError;
}
function SendDriver(inLogger, inPreferences)
{
	this.logger = inLogger;
	this.preferences = inPreferences;
	this.busy = false;
	this.rpcImage = null;
	this.onRpcSuccess = SendDriver_onRpcSuccess;
	this.onRpcError = SendDriver_onRpcError;
	this.execute = SendDriver_execute;
}
function SendDriver_execute(inRpcMethod)
{
  this.logger.log("SendDriver_execute():inRpcMethod.cmdNo=" +  inRpcMethod.cmdNo);
  this.busy = true;
  this.rpcMethod = inRpcMethod;
  var rpcImageUrl = this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + preferences["baseWebapp"] + "/" + this.rpcMethod.serviceName + "?cmd=" + this.rpcMethod.cmdNo + "&visitorIDInSession=" + this.preferences["visitorIDInSession"];
	if(this.rpcMethod.params != null)
	{
		for (i in this.rpcMethod.params)
		{
			pos = this.rpcMethod.params[i].indexOf("=");
			paramName = this.rpcMethod.params[i].substring(0,pos);
			paramValue = this.rpcMethod.params[i].substring(pos+1);
			rpcImageUrl +=  '&' +paramName+ '=' +Sys.urlEncode(paramValue);
		}
	}
	rpcImageUrl += '&rpcImageId=' +(new Date()).getTime();/*this param keep browser do not cache the rpcImage*/
	this.rpcImage = new Image();
	this.rpcImage.onload = onRpcSuccess;
	this.rpcImage.onerror = onRpcError;
	this.rpcImage.src = rpcImageUrl;
};
function onRpcSuccess(){globalSendDriver.onRpcSuccess(this.width, this.height);};
function SendDriver_onRpcSuccess(inWidth, inHeight)
{
	if(this.rpcMethod.onSuccess != null)
		this.rpcMethod.onSuccess(inWidth, inHeight);
	this.busy = false;
};
function onRpcError(){globalSendDriver.onRpcError();};
function SendDriver_onRpcError()
{
	if(this.rpcMethod.retryTimes <=0)
	{
		if(this.rpcMethod.onError != null)
			this.rpcMethod.onError(this.rpcMethod);
		this.busy = false;
	}else
	{
		this.logger.log("SendDriver_onRpcError():rpcMethod.retryTimes=" + this.rpcMethod.retryTimes);
		this.rpcMethod.retryTimes--;
		this.execute(this.rpcMethod);
	}
};
function getCookie(name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
        if(arr=document.cookie.match(reg)) return unescape(arr[2]);
        else return null;
};
function setCookie(name,value)
{
    var Days = 30;
    var exp  = new Date();    //new Date("December 31, 9998");
        exp.setTime(exp.getTime() + Days*24*60*60*1000);
        //document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
        document.cookie = name + "="+ escape (value);
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
	var paramUrl="";
	if(getCookie("operatorId")!=null&&typeof getCookie("operatorId")!="undefined"&&getCookie("operatorId").length!=0&&getCookie("operatorId")!="undefined")
	{
		paramUrl="operatorId="+getCookie("operatorId")+"&";
	}
	if(getCookie("skillId")!=null&&getCookie("skillId")!="undefined"&&getCookie("skillId").length!=0&&getCookie("skillId")!="undefined")
	{
		paramUrl=paramUrl+"skillId="+getCookie("skillId")+"&";
	}
	return paramUrl;
};
function ReceiveDriver(inLogger, inPreferences)
{
	this.logger = inLogger;
	this.preferences = inPreferences;
	this.receiveDriverListeners = new Array();
	this.loadingTag = false;
	this.lastMsgTime = "-1";
	this.tagImage = new Image();
	this.tags = new Array();
	this.receiveTimer = null;
	var paramUrl=getParam();
	this.tagUrl = this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + live800_baseWebApp+"/SurferServer?cmd=101&companyID=" + this.preferences["companyID"]+"&"+getTrustfulVisitorInfo()+getParam();
	this.localTyping = false;
	this.initTags = ReceiveDriver_initTags;
	this.getTag = ReceiveDriver_getTag;
	this.onTagSuccess = ReceiveDriver_onTagSuccess;
	this.onTagError = ReceiveDriver_onTagError;
	this.sendMessage = function(cmdParams){this.logger.log("ReceiveDriver_sendMessage: cmdNo=" + cmdParams["content"]);};
	this.start = ReceiveDriver_start;
	this.stop = ReceiveDriver_stop;
	this.addReceiveDriverListener = ReceiveDriver_addReceiveDriverListener;
	this.initTags();
}

function ReceiveDriver_stop()
{
	clearTimeout(this.receiveTimer);
};
function ReceiveDriver_initTags()
{
	this.tags["1"]  = ["0000"];/*loadContent*/
	this.tags["2"]  = ["6040"];/*iconreload*/
	this.tags["3"]  = ["6021"];/*BeInvitedToChat  invite show*/
	this.tags["4"]  = ["6020"];/*invite hide*/
	this.tags["5"]  = ["6031"];/*openInitiatedChat*/
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
var	pagetitle=URLEncode(document.title);
var	pagelocation=URLEncode(document.URL);
var	pagereferrer=URLEncode(document.referrer);
function JustUrlLen()
{
	pagetitle=URLEncode(document.title);
	pagelocation=URLEncode(document.URL);
	pagereferrer=URLEncode(document.referrer);
	if(pagelocation.length>=1600)
	pagelocation=pagelocation.substring(0,1600);	
	if(pagereferrer.length>=1600)
	pagereferrer=pagereferrer.substring(0,1600);	
	if(pagetitle.length>1600)
	pagetitle=pagetitle.substring(0,1600);
	for(var i=1;i>0;i++)
	{
		if((pagetitle+pagelocation+pagereferrer).length>1600)
		{
				if(pagetitle.length>=100)
				pagetitle=pagetitle.substring(0,pagetitle.length-200);
				if((pagetitle+pagelocation+pagereferrer).length>1600)	
				{
							if(pagelocation.length>=100)
							pagelocation=pagelocation.substring(0,pagelocation.length-100);
							if((pagetitle+pagelocation+pagereferrer).length>1600)
							{
								if(pagereferrer.length>=100)
								pagereferrer=pagereferrer.substring(0,pagereferrer.length-100);
								if((pagetitle+pagelocation+pagereferrer).length<1600)
								{
									break;	
								}
							}
							else
							{
								break;
							}
				}
				else
				{
					break;
				}
		}
		else
		{
			break;
		}
	}
}
function ReceiveDriver_getTag()
{
	JustUrlLen();
	this.loadingTag = true;
	this.tagImage.onload = onTagSuccess;
	this.tagImage.onerror = onTagError;
	var tempTagUrl = this.tagUrl;
	tempTagUrl += "&isblock=0";
	tempTagUrl += "&act=0";
	//tempTagUrl += "&pagetitle=" + pagetitle;
	//tempTagUrl += "&pagelocation=" + pagelocation;
	//tempTagUrl += "&pagereferrer=" + pagereferrer;
	tempTagUrl = tempTagUrl +  '&rpcImageId=' + (new Date()).getTime();/*note: every src must be not the same, because some web browser will check the image url, if all the image url are the same, browser cache the width & length of image*/
	this.tagImage.src = tempTagUrl;
	this.logger.log("ReceiveDriver_getTag():tempTagUrl=" + tempTagUrl);
	this.receiveTimer = setTimeout("globalReceiveDriver.getTag()", 10000);
};
function ReceiveDriver_start()
{
	///////////
	JustUrlLen();
	var tempTagUrl = this.tagUrl;
	tempTagUrl += "&isblock=0";
	tempTagUrl += "&act=0";
	tempTagUrl += "&pagetitle=" + pagetitle;
	tempTagUrl += "&pagelocation=" + pagelocation;
	tempTagUrl += "&pagereferrer=" + pagereferrer;
	tempTagUrl = tempTagUrl +  '&rpcImageId=' + (new Date()).getTime();
	this.tagImage.src = tempTagUrl;
	///////////
	this.receiveTimer = setTimeout("globalReceiveDriver.getTag()", 10000);
};
function onTagSuccess(){globalReceiveDriver.onTagSuccess(this.width.toString());};
function ReceiveDriver_onTagSuccess(inTagId)
{
	this.logger.log("ReceiveDriver_onTagSuccess():tagId=" +inTagId);
	var tagId = inTagId;
	var cmds = this.tags[tagId];
	if (cmds == null) return;
	for (i in cmds)
	{
		if (cmds[i] == "0000")
		{
			this.loadContent();
		}
		else
		{
			var cmdNo = cmds[i].substring(0,3);
			var boolValue = cmds[i].substring(3);
			var cmdParams = new Array();
			cmdParams["tp"] = cmdNo;
			cmdParams["content"] = boolValue;
			for (j in this.receiveDriverListeners)
			{
				this.receiveDriverListeners[j].receiveDriverReceived(cmdParams);
			}
		}
	}
	this.loadingTag = false;
};
function onTagError(){globalReceiveDriver.onTagError();};
function ReceiveDriver_onTagError(){};
function ReceiveDriver_addReceiveDriverListener(receiveDriverListener)
{
  this.logger.log("ReceiveDriver_addReceiveDriverListener():receiveDriverListener=" + receiveDriverListener);
  if (receiveDriverListener!=null)
  {
    this.receiveDriverListeners[this.receiveDriverListeners.length] = receiveDriverListener;
  }
};
function VisitClient(inLogger, inPreferences, inReceiveDriver, inSendDriver)
{
	/* Private Attributes */
	this.logger = inLogger;
	this.receiveDriver = inReceiveDriver;
	this.sendDriver = inSendDriver;
	this.visitServer = new VisitServer(inLogger, inPreferences, this, this.sendDriver);
	this.receiveDriverReceived = VisitClient_receiveDriverReceived;/* The controller of remote server command */
	this.refuseInvite = VisitClient_refuseInvite;
	this.acceptInvite = VisitClient_acceptInvite;
	this.initiatedChat = VisitClient_initiatedChat;
	this.getAcceptInviteUrl = VisitClient_getAcceptInviteUrl;
	this.getInitiatedChatUrl = VisitClient_getInitiatedChatUrl;
	this.getCallUrl = VisitClient_getCallUrl;
	this.start = VisitClient_start;
	this.stop = VisitClient_stop;
	this.messageListeners = new Array();
	this.addMessageListener = VisitClient_addMessageListener;
	this.receiveDriver.addReceiveDriverListener(this);
}
function VisitClient_addMessageListener(messageListener)
{
  this.logger.log("VisitClient_addMessageListener():messageListener=" + messageListener);
  if (messageListener!=null)
  {
    this.messageListeners[this.messageListeners.length] = messageListener;
  }
};
function Is_enablecookie()
{
		document.cookie="testcookie=testvalue";
		var cookiestr=new String(document.cookie);
		var cookiename="testcookie=testvalue";
		var beginpos=cookiestr.indexOf(cookiename);
		if(beginpos!=-1)
		{
			return true;
		}
		else
		{
			return false;
		}
};

function VisitClient_start()
{
	if(Is_enablecookie())
	{
		this.receiveDriver.start();
		this.visitServer.start();
	}
};
function VisitClient_stop()
{
	this.receiveDriver.stop();
	this.visitServer.stop();
};

function VisitClient_receiveDriverReceived(inCmdParams)
{
	var cmdParams = inCmdParams;
	var cmdNo = cmdParams["tp"];
	if(cmdNo == null)
	{
		this.logger.log("Exception:VisitClient_receiveMessage():cmdNo is null");
		return;
	}
	switch(cmdNo)
	{
		case "602":
				if ( cmdParams["content"] == "1")
				{
					for (j in this.messageListeners)
					{
						if( this.messageListeners[j].showInvite )
							this.messageListeners[j].showInvite();
					}
				}
				else
					{
						for (j in this.messageListeners)
						{
							if( this.messageListeners[j].hideInvite )
								this.messageListeners[j].hideInvite();
						}
					}
				break;
		case "603":
				for (j in this.messageListeners)
				{
					if( this.messageListeners[j].openInitiatedChat )
						this.messageListeners[j].openInitiatedChat();
				}
				break;
		case "604":
				for (j in this.messageListeners)
				{
					if( this.messageListeners[j].reloadIcon )
						this.messageListeners[j].reloadIcon();
				}
				break;
		case "608":
				for (j in this.messageListeners)
				{
					if( this.messageListeners[j].setConfig )
						this.messageListeners[j].setConfig(cmdParams);
				}
				break;
		default :
				break;
	}
};
function VisitClient_refuseInvite()
{
	this.visitServer.refuseInvite();
};
function VisitClient_acceptInvite()
{
	this.visitServer.acceptInvite();
};
function VisitClient_initiatedChat()
{
	this.visitServer.initiatedChat();
};
function VisitClient_getAcceptInviteUrl()
{
	return this.visitServer.getAcceptInviteUrl();
};
function VisitClient_getInitiatedChatUrl()
{
	return this.visitServer.getInitiatedChatUrl();
};
function VisitClient_getCallUrl()
{
	return this.visitServer.getCallUrl();
};



function FloatIcon(inLogger, inPreferences)
{
	this.preferences = inPreferences;

	this.logger = inLogger;
	this.inviteInnerHtml = null;
	this.lastTop = -1;
	this.lastLeft = -1;
	this.showInvite = false;
	this.companyID = this.preferences["companyID"];
	this.iconIndex = this.preferences["iconIndex"];
	this.online = this.preferences["online"];
	this.offline = this.preferences["offline"];
	this.toRight = this.preferences["floatToRight"];
	this.loaded = true;

	this.toBottom = false;
	this.floatTop = 150;
	this.floatLeft = 5;
	this.parentObject = null;

	this.showTimer = FloatIcon_showTimer;
	this.scrollPlace = FloatIcon_scrollPlace;
	this.generate = FloatIcon_generate;

	this.show = FloatIcon_show;
	this.hide = FloatIcon_hide;
	this.reload = FloatIcon_reload;
	this.start = FloatIcon_start;
	this.onIconClick = FloatIcon_onIconClick;

}
function FloatIcon_start()
{
	this.generate();
	this.show();
	setTimeout('globalFloatIcon.showTimer()', 250);
}
function FloatIcon_reload()
{
	//version 3 do nothing, the reload function remove to visiteHandle
}
function FloatIcon_generate()
{
	var layerHtml = '<div id=\"FloatIcon\" style=\"z-index:8888;position:absolute;visibility:hidden;left:500px;top:200px;\">';
	layerHtml += '<a id="live800iconlink" href="javascript:void(0)" onclick="this.newWindow = window.open(\'' + this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + this.preferences["baseWebapp"] + this.preferences["baseChatHtmlDir"] +"/chatbox.jsp?"+getGid()+"companyID="+this.preferences["companyID"]+getEnterUrl()+"&"+getTrustfulVisitorInfo();
	if(typeof this.preferences["configID"] != "undefined" && this.preferences["configID"] != null) {
		layerHtml += "&configID=" + this.preferences["configID"];
	}
	if(typeof this.preferences["chatBanner"] != "undefined" && this.preferences["chatBanner"] != null) {
		layerHtml += "&chatBanner=" + this.preferences["chatBanner"];
	}
	if(typeof this.preferences["chatBannerLink"] != "undefined" && this.preferences["chatBannerLink"] != null) {
		layerHtml += "&chatBannerLink=" + this.preferences["chatBannerLink"];
	}
	layerHtml += '\', \'chatbox'+ this.preferences["companyID"] + '\', \'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=536,height=396\');this.newWindow.focus();this.newWindow.opener=window;return false;">';
	var baseIconUrl = this.preferences["protocol"] + "://" + this.preferences["baseHtmlUrl"] + this.preferences["baseWebapp"] + this.preferences["baseChatHtmlDir"] + "/icons";
	if(this.preferences["online"] == null || this.preferences["offline"] == null)
	{
		onlineUrl = baseIconUrl + "/" + this.preferences["iconIndex"] + "_online.gif";
		offlineUrl = baseIconUrl + "/" + this.preferences["iconIndex"] + "_offline.gif";
	}else
	{
		onlineUrl = this.preferences["online"];
		offlineUrl = this.preferences["offline"];
	}
	layerHtml += '<img name="live800icon" id="live800icon" src="' + this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + this.preferences["baseWebapp"] + '/SurferServer?cmd=111&companyID=' + this.preferences["companyID"] +'&online=' + onlineUrl + '&offline=' + offlineUrl +'"  border="0" />';
	layerHtml += '</a></div>';
	document.write(layerHtml);
};
function FloatIcon_showTimer()
{
	if (this.loaded && this.showInvite)
	{
		var top;
		var left;
		if (Sys.IE)
		{
			if(this.inviteInnerHtml == null)
				this.inviteInnerHtml=Sys.getObj('FloatIcon').innerHTML;
 			if(Sys.getObj('FloatIcon').innerHTML.indexOf('javascript')==-1)
 			{
 				Sys.getObj('FloatIcon').innerHTML=this.inviteInnerHtml;
 			}
 			scrollPosY = 0;
 			scrollPosX = 0;
 			eval('try {' + 'if (typeof(document.documentElement) != "undefined") {' +  'scrollPosY = document.documentElement.scrollTop;' +  'scrollPosX = document.documentElement.scrollLeft;' + '}' + '} catch (e) {}');
 			scrollPosY = Math.max(document.body.scrollTop, scrollPosY);
 			scrollPosX = Math.max(document.body.scrollLeft, scrollPosX);
 			top = scrollPosY;
 			left = scrollPosX;
 			if ((this.lastTop < 0) || ((this.lastTop == top) && (this.lastLeft == left)))
 			{
 				document.all.FloatIcon.style.visibility = 'visible';
 			}
 			else
 			{
 				document.all.FloatIcon.style.visibility = 'hidden';
 			}
 		}
 		else if (Sys.NS)
 		{
 			top = pageYOffset;
 			left = pageXOffset;
 			if ((this.lastTop < 0) || ((this.lastTop == top) && (this.lastLeft == left)))
 			{
 				document.layers.FloatIcon.visibility = 'visible';
 			}
 			else
 				{
 					document.layers.FloatIcon.visibility = 'hidden';
 				}
 		}
 		else if (Sys.DOM)
 		{
 			top = pageYOffset;
 			left = pageXOffset;
 			if ((this.lastTop < 0) || ((this.lastTop == top) && (this.lastLeft == left)))
 			{
 				Sys.getObj('FloatIcon').style.visibility = 'visible';
 			}
 			else
 				{
 					Sys.getObj('FloatIcon').style.visibility = 'hidden';
 				}
 		}
 		this.scrollPlace();
 		this.lastTop = top;
 		this.lastLeft = left;
 	}
 	setTimeout('globalFloatIcon.showTimer()', 250);
};
function FloatIcon_scrollPlace()
{

  var iconHeight = Sys.getObj("live800icon").height;
  var iconWidth = Sys.getObj("live800icon").width;

  //float to bottom
  var y;
  var x;
  if (this.toBottom)
  {
      if (document.body)
          y = document.body.clientHeight - iconHeight - this.floatTop;
      else
          y = innerHeight - iconHeight - this.floatTop;
  }
  else
      y = this.floatTop;

  //float to right
  if (this.toRight == "1")
  {
      if (document.body)
          x = document.body.clientWidth - iconWidth - this.floatLeft;
      else
          x = innerWidth - iconWidth - this.floatLeft;
  }
  else
      x = this.floatLeft;


	var obj = null;
	if (Sys.IE)
	{
		obj = document.all.FloatIcon.style;
	}
	else if (Sys.NS)
	{
		obj = document.layers.FloatIcon;
	}
	else if (Sys.DOM)
	{
		obj = Sys.getObj('FloatIcon').style;
	}

	if (Sys.IE)
	{
		scrollPosY = 0;
		scrollPosX = 0;
		eval('try {' + 'if (typeof(document.documentElement) !=	"undefined") {'	+ 'scrollPosY =	document.documentElement.scrollTop;' + 'scrollPosX = document.documentElement.scrollLeft;' + '}' + '} catch	(e)	{}');
		scrollPosY = Math.max(document.body.scrollTop, scrollPosY);
		scrollPosX = Math.max(document.body.scrollLeft, scrollPosX);
		obj.left	= scrollPosX + x + 'px';
		obj.top = scrollPosY +	y +	'px';
	}
	else if	(Sys.NS)
	{
		obj.left =	pageXOffset	+ x;
		obj.top = pageYOffset + y;
	}
	else if (Sys.DOM)
	{
		obj.left = pageXOffset + x + 'px';
		obj.top = pageYOffset + y + 'px';
	}
};
function FloatIcon_show()
{
	this.showInvite = true;
	if (Sys.IE)
	{
 		document.all.FloatIcon.style.visibility = 'visible';
 	}
 	else if (Sys.NS)
 	{
 		document.layers.FloatIcon.visibility = 'visible';
	}
 	else if (Sys.DOM)
 	{
		Sys.getObj('FloatIcon').style.visibility = 'visible';
 	}
};
function FloatIcon_hide()
{
	this.showInvite = false;
	if (Sys.IE)
	{
 		document.all.FloatIcon.style.visibility = 'hidden';
 	}
 	else if (Sys.NS)
 	{
 		document.layers.FloatIcon.visibility = 'hidden';
	}
 	else if (Sys.DOM)
 	{
		Sys.getObj('FloatIcon').style.visibility = 'hidden';
 	}
};
function floatIconOnIconClick()
{
	globalIcon.onIconClick();
};
function FloatIcon_onIconClick()
{
	this.parentObject.onIconClick();
};
//var globalFloatIcon = new FloatIcon();
//setTimeout('globalFloatIcon.showTimer()', 250);


/**
  *	Define object InviteWindow
  *	@param inLogger log object
  *	@param inChatClient
  */
function InviteWindow(inLogger, inPreferences, inVisitClient, inWindow)
{

	/* Private Attributes */
	this.logger = inLogger;
	this.preferences = inPreferences;
	this.visitClient = inVisitClient;
	this.window = inWindow;
	this.skin = this.preferences["skin"];
	this.inviteText = "";
	this.lastTop = -1;
	this.lastLeft = -1;
	this.showInvite = false;
	this.inviteInnerHtml = null;
	this.isauto = true;
	this.operatorInvite=true;/*operator invite flag*/
	
	/* Public Attributes */
	this.toBottom = true;
	this.toRight = true;
	this.floatTop = 150;
	if(document.body)
		this.floatLeft = (document.body.clientWidth-250)/2;
	else
		this.floatLeft = (innerWidth-450)/2;
	this.loaded = true;
	this.parent = null;

	/* Private methods */
	this.generate = InviteWindow_generate;
	this.showTimer = InviteWindow_showTimer;
	this.scrollPlace = InviteWindow_scrollPlace;
	this.initListener = VisitHandle_initListener;

	/* Publice methods */
	this.show = InviteWindow_show;
	this.hide = InviteWindow_hide;
	this.accept = InviteWindow_accept;
	this.refuse = InviteWindow_refuse;
	this.setInviteText = InviteWindow_setInviteText;

	/* Listener interface */
	this.setConfig = InviteWindow_setConfig;

	/* Initialization */
	this.generate();
	//this.initListener();
	setTimeout('globalInviteWindow.showTimer()', 250);
	
	if((preferences["invite_auto"]==1||preferences["invite_auto"]==2)&&preferences["status"]=="1")
	{
		setTimeout('globalInviteWindow.show()', preferences["invite_delay"]*1000);
		this.isauto = true;
	}

}
function VisitHandle_initListener()
{

	this.visitClient.addMessageListener(this);
}
function InviteWindow_setConfig(inSettings)
{
	this.inviteText = inSettings["invitecontent"];
	this.setInviteText(this.inviteText);
};
function InviteWindow_setInviteText(inInviteText)
{
	Sys.getObj("invitetext").innerHTML = inInviteText;
};
function URLDecode(Str){
  if(Str==null||Str=="")
    return "";
  var newStr="";
  function toCase(sStr){
    return sStr.toString(16).toUpperCase();
    }
  for(var i=0,ichar,len=Str.length;i<len;){
    if(Str.charAt(i)=="%"){
      ichar=Str.charAt(i+1);
      if(ichar.toLowerCase()=="e"){
        newStr+=String.fromCharCode((parseInt("0x"+Str.substr(i+1,2))-0xE0)*0x1000+(parseInt("0x"+Str.substr(i+4,2))-0x80)*0x40+parseInt("0x"+Str.substr(i+7,2))-0x80);
        i+=9;
        }
      else if(ichar.toLowerCase()=="c"||ichar.toLowerCase()=="d"){
        newStr+=String.fromCharCode((parseInt("0x"+Str.substr(i+1,2))-0xC0)*0x40+parseInt("0x"+Str.substr(i+4,2))-0x80);
        i+=6;
        }
      else{
        newStr+=String.fromCharCode(parseInt("0x"+Str.substr(i+1,2)));
        i+=3;
        }
      }
    else{
      newStr+=Str.charAt(i).replace(/\+/," ");
      i++;
      }
    }
  return newStr;
  };
 
 function getInviteContent(){
    var content="";
  if(typeof live800_visitorAddr=="undefined")return content;
 	if(live800_visitorAddr!="null"&&live800_visitorAddr.length!=0)
 	{
 		content="&nbsp;<span id='inviteMessage' style='color:#000000;line-height:13px;FONT-SIZE: 9pt; FONT-FAMILY: Tahoma; word-break:break-all;word-wrap:break-word; '>";
 		//if(preferences["companyID"]=="800")content="&nbsp;<span id='inviteMessage' style='color:#FFFFFF;line-height:13px;FONT-SIZE: 9pt; FONT-FAMILY: Tahoma; word-break:break-all;word-wrap:break-word; '>";
 		content=content+URLDecode(live800_visitorAddr)+"<br/><br/>&nbsp;"+URLDecode(live800_inviteContent)+"</span>";
 	}
 	return content;
 };
function InviteWindow_generate(){
	var baseUrl = preferences["protocol"] + "://" + preferences["baseHtmlUrl"] + preferences["baseWebapp"] + preferences["baseChatHtmlDir"];
	var inviteUrl = baseUrl + "/invitewin.jsp?companyID=" + preferences["companyID"];
	/*edit by hwj;0:blue;1:yellow;2:green;3:red*/
	var styleType=0;
	if(preferences["invite_style"]!=null&&typeof preferences["invite_style"]!="undefined"&&preferences["invite_style"]!="null")
	styleType=preferences["invite_style"];
	if(preferences["invite_top"]!=null&&typeof preferences["invite_top"]!="undefined"&&preferences["invite_top"]!="null"&&preferences["invite_top"]==1){
		this.inviteInnerHtml='<OBJECT height="159" width="439" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"><PARAM NAME=movie VALUE="'+baseUrl+'/images/invite.swf"><PARAM NAME=quality VALUE=high><PARAM NAME=FlashVars VALUE="title='+URLDecode(preferences["invite_title"])+'&content='+URLDecode(live800_inviteContent)+'&addr='+URLDecode(live800_visitorAddr)+'"></OBJECT>';
	}
	if((preferences["companyID"]=="800"&&(preferences["invite_style"]==null||typeof preferences["invite_style"]=="undefined"))||styleType==4){
		var bt1="";
		var bt2="";
		if(typeof live800_Language=="undefined")
		{
			bt1="/images/cn_image/invite_bt1.gif";
			bt2="/images/cn_image/invite_bt2.gif";
		}
		else
		{
			if(live800_Language=="zh")
			{
				bt1="/images/cn_image/invite_bt1.gif";
				bt2="/images/cn_image/invite_bt2.gif";
			}
			else if(live800_Language=="zh_TW")
			{
				bt1="/images/big5_image/invite_bt1.gif";
				bt2="/images/big5_image/invite_bt2.gif";
			}
			else if(live800_Language=="en")
			{
				bt1="/images/english_image/invite_bt1.gif";
				bt2="/images/english_image/invite_bt2.gif";
			}
			else
			{
				bt1="/images/cn_image/invite_bt1.gif";
				bt2="/images/cn_image/invite_bt2.gif";
			}
		}
		var attr='width=541,height=401';
		var tempsurl=this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + this.preferences["baseWebapp"]+"/chatClient/chatbox.jsp?"+getGid()+getParam()+"&companyID="+ this.preferences["companyID"]+"&configID="+preferences["configID"]+getEnterUrl()+"&"+getTrustfulVisitorInfo();
		var boxname="chatbox"+this.preferences["companyID"];
		var openwin="javascript:this.newWindow=window.open('"+tempsurl+"','','"+attr+"');this.newWindow.focus();this.newWindow.opener=window;void(0);";
		this.inviteInnerHtml ='<table style="z-index:88882" width="439" height="160" border="0" cellpadding="0" cellspacing="0"><tr style="cursor:move;">';
		this.inviteInnerHtml +='<td height="28" colspan="7" background="' +baseUrl+ '/images/1.gif">';
		this.inviteInnerHtml +='<span style="color:#0000;font-size:12px;">&nbsp;&nbsp;&nbsp;Live800 - '+URLDecode(preferences["invite_title"])+'</span></td></tr><tr>';
		this.inviteInnerHtml +='<td rowspan="5"><img src="' +baseUrl+ '/images/2.gif" width="134" height="131" alt=""></td>';
		this.inviteInnerHtml +='<td colspan="6"><img src="' +baseUrl+ '/images/3.gif" width="305" height="27" alt=""></td></tr>';
		this.inviteInnerHtml +='<tr><td height="46" colspan="4" background="' +baseUrl+ '/images/4.gif" valign="top">';
		this.inviteInnerHtml +=getInviteContent()+'</td>';
		this.inviteInnerHtml +='<td colspan="2"><img src="' +baseUrl+ '/images/5.gif" width="38" height="46" alt=""></td></tr>';
		this.inviteInnerHtml +='<tr><td colspan="6"><img src="' +baseUrl+ '/images/6.gif" width="305" height="23" alt=""></td></tr>';
		this.inviteInnerHtml +='<tr><td><img src="' +baseUrl+ '/images/7.gif" width="139" height="22" alt=""></td>';
		this.inviteInnerHtml +='<td><img src="' +baseUrl+bt1+ '" width="66" height="22" onclick="globalInviteWindow.accept();" style="cursor:pointer"></td>';
		this.inviteInnerHtml +='<td><img src="' +baseUrl+ '/images/9.gif" width="12" height="22" alt=""></td>';
		this.inviteInnerHtml +='<td colspan="2"><img src="' +baseUrl+ bt2+'" width="66" height="22" onclick="globalInviteWindow.refuse();" style="cursor:pointer"></td>';
		this.inviteInnerHtml +='<td><img src="' +baseUrl+ '/images/11.gif" width="22" height="22" alt=""></td></tr>';
		this.inviteInnerHtml +='<tr><td colspan="6"><img src="' +baseUrl+ '/images/12.gif" width="305" height="13" alt=""></td></tr>';
		this.inviteInnerHtml +='<tr><td><img src="' +baseUrl+ '/images/blank.gif" width="134" height="1" alt=""></td>';
		this.inviteInnerHtml +='<td><img src="' +baseUrl+ '/images/blank.gif" width="139" height="1" alt=""></td>';
		this.inviteInnerHtml +='<td><img src="' +baseUrl+ '/images/blank.gif" width="66" height="1" alt=""></td>';
		this.inviteInnerHtml +='<td><img src="' +baseUrl+ '/images/blank.gif" width="12" height="1" alt=""></td>';
		this.inviteInnerHtml +='<td><img src="' +baseUrl+ '/images/blank.gif" width="50" height="1" alt=""></td>';
		this.inviteInnerHtml +='<td><img src="' +baseUrl+ '/images/blank.gif" width="16" height="1" alt=""></td>';
		this.inviteInnerHtml +='<td><img src="' +baseUrl+ '/images/blank.gif" width="22" height="1" alt=""></td></tr></table>';
	}
	else if(styleType==0){
		var bt1="";
		var bt2="";
		if(typeof live800_Language=="undefined")
		{
			bt1="/images/cn_image/invite_bt1.gif";
			bt2="/images/cn_image/invite_bt2.gif";
		}
		else
		{
			if(live800_Language=="zh")
			{
				bt1="/images/cn_image/invite_bt1.gif";
				bt2="/images/cn_image/invite_bt2.gif";
			}
			else if(live800_Language=="zh_TW")
			{
				bt1="/images/big5_image/invite_bt1.gif";
				bt2="/images/big5_image/invite_bt2.gif";
			}
			else if(live800_Language=="en")
			{
				bt1="/images/english_image/invite_bt1.gif";
				bt2="/images/english_image/invite_bt2.gif";
			}
			else
			{
				bt1="/images/cn_image/invite_bt1.gif";
				bt2="/images/cn_image/invite_bt2.gif";
			}
		}
		this.inviteInnerHtml ='<table style="background-repeat:no-repeat" width="439" height="160" border="0" cellpadding="0" cellspacing="0" background="' +baseUrl+ '/images/invite_bg.gif">';
		this.inviteInnerHtml +='<tr style="cursor:move;"><td colspan="7" width="439" height="27"><span style="color:#FFFFFF;font-size:12px;">&nbsp;&nbsp;&nbsp;Live800 - '+URLDecode(preferences["invite_title"])+'</span></td></tr>';
		this.inviteInnerHtml +='<tr><td rowspan="3" width="132" height="132"></td>';
		this.inviteInnerHtml +='<td colspan="5" width="296" height="97">'+getInviteContent()+'</td>';
		this.inviteInnerHtml +='<td width="11" height="97"></td></tr>';
		this.inviteInnerHtml +='<tr><td width="141" height="22"></td>';
		this.inviteInnerHtml +='<td width="66" height="22"><img src="' +baseUrl+bt1+ '" onclick="globalInviteWindow.accept();" style="cursor:pointer"></td>';
		this.inviteInnerHtml +='<td width="12" height="22"></td>';
		this.inviteInnerHtml +='<td width="66" height="22"><img src="' +baseUrl+bt2+ '" onclick="globalInviteWindow.refuse();" style="cursor:pointer"></td>';
		this.inviteInnerHtml +='<td colspan="2" width="22" height="22"></td></tr>';
		this.inviteInnerHtml +='<tr><td colspan="6" width="307" height="13"></td></tr>';
		this.inviteInnerHtml +='<tr><td width="132" height="1"></td>';
		this.inviteInnerHtml +='<td width="141" height="1"></td>';
		this.inviteInnerHtml +='<td width="66" height="1"></td>';
		this.inviteInnerHtml +='<td width="12" height="1"></td>';
		this.inviteInnerHtml +='<td width="66" height="1"></td>';
		this.inviteInnerHtml +='<td width="11" height="1"></td>';
		this.inviteInnerHtml +='<td width="11" height="1"></td>	</tr></table>';
	}
	else if(styleType==1){//1:yellow;2:green;3:red
		var bt1="";
		var bt2="";
		if(typeof live800_Language=="undefined")
		{
			bt1="/images/cn_image/yellow_invite_bt1.gif";
			bt2="/images/cn_image/yellow_invite_bt2.gif";
		}
		else
		{
			if(live800_Language=="zh")
			{
				bt1="/images/cn_image/yellow_invite_bt1.gif";
				bt2="/images/cn_image/yellow_invite_bt2.gif";
			}
			else if(live800_Language=="zh_TW")
			{
				bt1="/images/big5_image/yellow_invite_bt1.gif";
				bt2="/images/big5_image/yellow_invite_bt2.gif";
			}
			else if(live800_Language=="en")
			{
				bt1="/images/english_image/yellow_invite_bt1.gif";
				bt2="/images/english_image/yellow_invite_bt2.gif";
			}
			else
			{
				bt1="/images/cn_image/yellow_invite_bt1.gif";
				bt2="/images/cn_image/yellow_invite_bt2.gif";
			}
		}
		this.inviteInnerHtml ='<table style="background-repeat:no-repeat" width="439" height="160" border="0" cellpadding="0" cellspacing="0" background="' +baseUrl+ '/images/yellow_invite_bg.gif">';
		this.inviteInnerHtml +='<tr style="cursor:move;"><td colspan="7" width="439" height="27"><span style="color:#FFFFFF;font-size:12px;">&nbsp;&nbsp;&nbsp;Live800 - '+URLDecode(preferences["invite_title"])+'</span></td></tr>';
		this.inviteInnerHtml +='<tr><td rowspan="3" width="132" height="132"></td>';
		this.inviteInnerHtml +='<td colspan="5" width="296" height="97">'+getInviteContent()+'</td>';
		this.inviteInnerHtml +='<td width="11" height="97"></td></tr>';
		this.inviteInnerHtml +='<tr><td width="141" height="22"></td>';
		this.inviteInnerHtml +='<td width="66" height="22"><img src="' +baseUrl+bt1+ '" onclick="globalInviteWindow.accept();" style="cursor:pointer"></td>';
		this.inviteInnerHtml +='<td width="12" height="22"></td>';
		this.inviteInnerHtml +='<td width="66" height="22"><img src="' +baseUrl+bt2+ '" onclick="globalInviteWindow.refuse();" style="cursor:pointer"></td>';
		this.inviteInnerHtml +='<td colspan="2" width="22" height="22"></td></tr>';
		this.inviteInnerHtml +='<tr><td colspan="6" width="307" height="13"></td></tr>';
		this.inviteInnerHtml +='<tr><td width="132" height="1"></td>';
		this.inviteInnerHtml +='<td width="141" height="1"></td>';
		this.inviteInnerHtml +='<td width="66" height="1"></td>';
		this.inviteInnerHtml +='<td width="12" height="1"></td>';
		this.inviteInnerHtml +='<td width="66" height="1"></td>';
		this.inviteInnerHtml +='<td width="11" height="1"></td>';
		this.inviteInnerHtml +='<td width="11" height="1"></td>	</tr></table>';
	}
	else if(styleType==2){//1:yellow;2:green;3:red
		var bt1="";
		var bt2="";
		if(typeof live800_Language=="undefined")
		{
			bt1="/images/cn_image/green_invite_bt1.gif";
			bt2="/images/cn_image/green_invite_bt2.gif";
		}
		else
		{
			if(live800_Language=="zh")
			{
				bt1="/images/cn_image/green_invite_bt1.gif";
				bt2="/images/cn_image/green_invite_bt2.gif";
			}
			else if(live800_Language=="zh_TW")
			{
				bt1="/images/big5_image/green_invite_bt1.gif";
				bt2="/images/big5_image/green_invite_bt2.gif";
			}
			else if(live800_Language=="en")
			{
				bt1="/images/english_image/green_invite_bt1.gif";
				bt2="/images/english_image/green_invite_bt2.gif";
			}
			else
			{
				bt1="/images/cn_image/green_invite_bt1.gif";
				bt2="/images/cn_image/green_invite_bt2.gif";
			}
		}
		this.inviteInnerHtml ='<table style="background-repeat:no-repeat" width="439" height="160" border="0" cellpadding="0" cellspacing="0" background="' +baseUrl+ '/images/green_invite_bg.gif">';
		this.inviteInnerHtml +='<tr style="cursor:move;"><td colspan="7" width="439" height="27"><span style="color:#FFFFFF;font-size:12px;">&nbsp;&nbsp;&nbsp;Live800 - '+URLDecode(preferences["invite_title"])+'</span></td></tr>';
		this.inviteInnerHtml +='<tr><td rowspan="3" width="132" height="132"></td>';
		this.inviteInnerHtml +='<td colspan="5" width="296" height="97">'+getInviteContent()+'</td>';
		this.inviteInnerHtml +='<td width="11" height="97"></td></tr>';
		this.inviteInnerHtml +='<tr><td width="141" height="22"></td>';
		this.inviteInnerHtml +='<td width="66" height="22"><img src="' +baseUrl+bt1+ '" onclick="globalInviteWindow.accept();" style="cursor:pointer"></td>';
		this.inviteInnerHtml +='<td width="12" height="22"></td>';
		this.inviteInnerHtml +='<td width="66" height="22"><img src="' +baseUrl+bt2+ '" onclick="globalInviteWindow.refuse();" style="cursor:pointer"></td>';
		this.inviteInnerHtml +='<td colspan="2" width="22" height="22"></td></tr>';
		this.inviteInnerHtml +='<tr><td colspan="6" width="307" height="13"></td></tr>';
		this.inviteInnerHtml +='<tr><td width="132" height="1"></td>';
		this.inviteInnerHtml +='<td width="141" height="1"></td>';
		this.inviteInnerHtml +='<td width="66" height="1"></td>';
		this.inviteInnerHtml +='<td width="12" height="1"></td>';
		this.inviteInnerHtml +='<td width="66" height="1"></td>';
		this.inviteInnerHtml +='<td width="11" height="1"></td>';
		this.inviteInnerHtml +='<td width="11" height="1"></td>	</tr></table>';
	}
	else if(styleType==3){//1:yellow;2:green;3:red
		var bt1="";
		var bt2="";
		if(typeof live800_Language=="undefined")
		{
			bt1="/images/cn_image/red_invite_bt1.gif";
			bt2="/images/cn_image/red_invite_bt2.gif";
		}
		else
		{
			if(live800_Language=="zh")
			{
				bt1="/images/cn_image/red_invite_bt1.gif";
				bt2="/images/cn_image/red_invite_bt2.gif";
			}
			else if(live800_Language=="zh_TW")
			{
				bt1="/images/big5_image/red_invite_bt1.gif";
				bt2="/images/big5_image/red_invite_bt2.gif";
			}
			else if(live800_Language=="en")
			{
				bt1="/images/english_image/red_invite_bt1.gif";
				bt2="/images/english_image/red_invite_bt2.gif";
			}
			else
			{
				bt1="/images/cn_image/red_invite_bt1.gif";
				bt2="/images/cn_image/red_invite_bt2.gif";
			}
		}
		this.inviteInnerHtml ='<table style="background-repeat:no-repeat" width="439" height="160" border="0" cellpadding="0" cellspacing="0" background="' +baseUrl+ '/images/red_invite_bg.gif">';
		this.inviteInnerHtml +='<tr style="cursor:move;"><td colspan="7" width="439" height="27"><span style="color:#FFFFFF;font-size:12px;">&nbsp;&nbsp;&nbsp;Live800 - '+URLDecode(preferences["invite_title"])+'</span></td></tr>';
		this.inviteInnerHtml +='<tr><td rowspan="3" width="132" height="132"></td>';
		this.inviteInnerHtml +='<td colspan="5" width="296" height="97">'+getInviteContent()+'</td>';
		this.inviteInnerHtml +='<td width="11" height="97"></td></tr>';
		this.inviteInnerHtml +='<tr><td width="141" height="22"></td>';
		this.inviteInnerHtml +='<td width="66" height="22"><img src="' +baseUrl+bt1+ '" onclick="globalInviteWindow.accept();" style="cursor:pointer"></td>';
		this.inviteInnerHtml +='<td width="12" height="22"></td>';
		this.inviteInnerHtml +='<td width="66" height="22"><img src="' +baseUrl+bt2+ '" onclick="globalInviteWindow.refuse();" style="cursor:pointer"></td>';
		this.inviteInnerHtml +='<td colspan="2" width="22" height="22"></td></tr>';
		this.inviteInnerHtml +='<tr><td colspan="6" width="307" height="13"></td></tr>';
		this.inviteInnerHtml +='<tr><td width="132" height="1"></td>';
		this.inviteInnerHtml +='<td width="141" height="1"></td>';
		this.inviteInnerHtml +='<td width="66" height="1"></td>';
		this.inviteInnerHtml +='<td width="12" height="1"></td>';
		this.inviteInnerHtml +='<td width="66" height="1"></td>';
		this.inviteInnerHtml +='<td width="11" height="1"></td>';
		this.inviteInnerHtml +='<td width="11" height="1"></td>	</tr></table>';
	}
	this.layerHtml = "<div id=\"InviteWindow\" onmousedown=\"popDivMoveStart()\"  style=\"z-index:8888;position:absolute;visibility:hidden;left:500px;top:200px;\">";
	this.layerHtml += "";
	this.layerHtml += "</div>";
	document.write(this.layerHtml);
}
function openFlashWin(){
	var attr='width=541,height=401';
	var tempUrl=this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + this.preferences["baseWebapp"]+"/chatClient/chatbox.jsp?"+getGid()+getParam()+"&companyID="+ this.preferences["companyID"]+getEnterUrl()+"&"+getTrustfulVisitorInfo();
	var newWin=window.open(tempUrl,'',attr);
	globalInviteWindow.hide();
}
var popDivDiffX=null;
var popDivDiffY=null;
var floadttime;
function getEnterUrl()
{
	var url="";
	if(enterurl=="null")
	enterurl=document.URL;
	url=URLEncode(enterurl);
	return "&enterurl="+url;
};
function popDivMoveStart(){
	clearTimeout(floadttime);
	var InviteWindow=document.getElementById("InviteWindow");
	popDivDiffX=event.x-InviteWindow.style.pixelLeft;
	popDivDiffY=event.y-InviteWindow.style.pixelTop;
	window.document.body.attachEvent("onmousemove",popDivMove);
	window.document.body.attachEvent("onmouseup",popDivMoveStop);
	InviteWindow.setCapture();
};

function popDivMove(){
	if(popDivDiffX!=null){
		if(event.x<10 || event.y<10||event.x>document.body.clientWidth||event.y>document.body.clientHeight){
			popDivMoveStop();
			return;
		}
		document.getElementById("InviteWindow").style.pixelLeft=event.x-popDivDiffX;
		document.getElementById("InviteWindow").style.pixelTop=event.y-popDivDiffY;
	}
};

function popDivMoveStop(){
	if(popDivDiffX != null){
		document.getElementById("InviteWindow").releaseCapture();
		popDivDiffX=null;
		popDivDiffY=null;
		window.document.body.detachEvent("onmousemove",popDivMove);
		window.document.body.detachEvent("onmouseup",popDivMoveStop);
	 }
};

function resizeInvite(){
	document.getElementById("InviteWindow").style.top=document.body.scrollTop+(document.body.clientHeight-document.getElementById("InviteWindow").offsetHeight)/2;
	document.getElementById("InviteWindow").style.left=document.body.scrollLeft+(document.body.clientWidth-document.getElementById("InviteWindow").offsetWidth)/2;
};
function InviteWindow_showTimer()
{
	if (this.loaded && this.showInvite)
	{
		var top;
		var left;
		if (Sys.IE)
		{
			if(this.inviteInnerHtml == null)
			this.inviteInnerHtml=Sys.getObj('InviteWindow').innerHTML;
			if(Sys.getObj('InviteWindow').innerHTML.indexOf('live800')==-1){
				Sys.getObj('InviteWindow').innerHTML = this.inviteInnerHtml;
			}
   			scrollPosY = 0;
   			scrollPosX = 0;
   			eval('try {' + 'if (typeof(document.documentElement) != "undefined") {' +  'scrollPosY = document.documentElement.scrollTop;' +  'scrollPosX = document.documentElement.scrollLeft;' + '}' + '} catch (e) {}');
   			scrollPosY = Math.max(document.body.scrollTop, scrollPosY);
       		scrollPosX = Math.max(document.body.scrollLeft, scrollPosX);
       		top = scrollPosY;
       		left = scrollPosX;
       		if ((this.lastTop < 0) || ((this.lastTop == top) && (this.lastLeft == left))){
       			document.all.InviteWindow.style.visibility = 'visible';
       		}
       		else
       		{
       			document.all.InviteWindow.style.visibility = 'hidden';
       		}
 		}
 		else if (Sys.NS)
 		{
 			top = pageYOffset;
 			left = pageXOffset;
 			if ((this.lastTop < 0) || ((this.lastTop == top) && (this.lastLeft == left)))
 			{
 				document.layers.InviteWindow.visibility = 'visible';
 			}
 			else
 				{
 					document.layers.InviteWindow.visibility = 'hidden';
 				}
 		}
 		else if (Sys.DOM)
 		{
 			if(this.inviteInnerHtml == null)
			this.inviteInnerHtml=Sys.getObj('InviteWindow').innerHTML;
			if(Sys.getObj('InviteWindow').innerHTML.indexOf('live800')==-1)
			{
				Sys.getObj('InviteWindow').innerHTML = this.inviteInnerHtml;
			}
   			scrollPosY = 0;
   			scrollPosX = 0;
   			eval('try {' + 'if (typeof(document.documentElement) != "undefined") {' +  'scrollPosY = document.documentElement.scrollTop;' +  'scrollPosX = document.documentElement.scrollLeft;' + '}' + '} catch (e) {}');
   			scrollPosY = Math.max(document.body.scrollTop, scrollPosY);
       		scrollPosX = Math.max(document.body.scrollLeft, scrollPosX);
 			
 			top = pageYOffset;
 			left = pageXOffset;
 			if ((this.lastTop < 0) || ((this.lastTop == top) && (this.lastLeft == left)))
 			{
 				Sys.getObj('InviteWindow').style.visibility = 'visible';
 			}
 			else
 				{
 					Sys.getObj('InviteWindow').style.visibility = 'hidden';
 				}
 		}
 		this.lastTop = top;
 		this.lastLeft = left;
 		//write cookie flag
		if(preferences["invite_auto"]==2&&(getCookie("hasVisited")==null||typeof getCookie("hasVisited")=="undefined")){
 			setCookie("hasVisited","true");
 		}/*
 		if(getCookie("hasVisited")==null||typeof getCookie("hasVisited")=="undefined"){
 			setCookie("hasVisited","true");
 		}*/
 	}
 	resizeInvite();
 	floadttime=setTimeout('globalInviteWindow.showTimer()', 250);
};

function InviteWindow_scrollPlace()
{
	var y;
	var x;
	y = this.floatTop;
    if (document.body)
        x = document.body.clientWidth -250 - this.floatLeft;
    else
        x = innerWidth - 250 - this.floatLeft;

	var obj = null;
	if (Sys.IE)
	{
		obj = document.all.InviteWindow.style;
	}
	else if (Sys.NS)
	{
		obj = document.layers.InviteWindow;
	}
	else if (Sys.DOM)
	{
		obj = Sys.getObj('InviteWindow').style;
	}

	if (Sys.IE)
	{
		scrollPosY = 0;
		scrollPosX = 0;
		eval('try {' + 'if (typeof(document.documentElement) !=	"undefined") {'	+ 'scrollPosY =	document.documentElement.scrollTop;' + 'scrollPosX = document.documentElement.scrollLeft;' + '}' + '} catch	(e)	{}');
		scrollPosY = Math.max(document.body.scrollTop, scrollPosY);
		scrollPosX = Math.max(document.body.scrollLeft, scrollPosX);
		obj.left	= scrollPosX + x - 50 + 'px';
		obj.top = scrollPosY +	y +	'px';
	}
	else if	(Sys.NS)
	{
		obj.left =	pageXOffset	+ x;
		obj.top = pageYOffset + y;
	}
	else if (Sys.DOM)
	{
		obj.left = pageXOffset + x + 'px';
		obj.top = pageYOffset + y + 'px';
	}
};
function InviteWindow_show()
{
	if(getCookie("hasVisited")!=null&&getCookie("hasVisited")=="true"&&this.operatorInvite&&preferences["invite_auto"]==2){
		return;	
	}
	this.showInvite = true;
	if (Sys.IE)
	{
 		document.all.InviteWindow.style.visibility = 'visible';
 	}
 	else if (Sys.NS)
 	{
		document.layers.InviteWindow.visibility = 'visible';
	}
 	else if (Sys.DOM)
 	{
		Sys.getObj('InviteWindow').style.visibility = 'visible';
 	}

};
function InviteWindow_hide()
{
	this.showInvite = false;
	if (Sys.IE)
	{
 		document.all.InviteWindow.style.visibility = 'hidden';
 	}
 	else if (Sys.NS)
 	{
 		document.layers.InviteWindow.visibility = 'hidden';
	}
 	else if (Sys.DOM)
 	{
		Sys.getObj('InviteWindow').style.visibility = 'hidden';
 	}

};
function InviteWindow_accept()
{

	this.hide();
	if(this.isauto){
		this.parentObject.onIconClick();
	}else{
		this.parentObject.onInviteWindowAccept();
	}
	
};
function InviteWindow_refuse()
{

	this.hide();
	if(!this.isauto)
		this.parentObject.onInviteWindowRefuse();
};

function VisitServer(inLogger, inPreferences, inVisitClient, inSendDriver)
{
	this.logger = inLogger;
	this.preferences = inPreferences;
	this.visitClient = inVisitClient;
	this.sendDriver = inSendDriver;
	this.visitServerTimer = null;

	this.refuseInvite = VisitServer_refuseInvite;
	this.acceptInvite = VisitServer_acceptInvite;
	this.initiatedChat = VisitServer_initiatedChat;

	this.getAcceptInviteUrl = VisitServer_getAcceptInviteUrl;
	this.getInitiatedChatUrl = VisitServer_getInitiatedChatUrl;
	this.getCallUrl = VisitServer_getCallUrl;

	this.start = VisitServer_start;
	this.stop = VisitServer_stop;
}
function VisitServer_getCallUrl()
{
	var openUrl = this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + this.preferences["baseWebapp"]+ this.preferences["baseChatHtmlDir"] +"/chatbox.jsp?"+getGid()+getParam()+getTrustfulVisitorInfo();
		openUrl += "&companyID=" + this.preferences["companyID"]+"&";
	if(this.preferences["skin"] != null)
		openUrl += "&skin=" + this.preferences["skin"];
	if(this.preferences["chatBanner"] != null)
		openUrl += "&chatBanner=" + this.preferences["chatBanner"];
	if(this.preferences["chatBannerLink"] != null)
		openUrl += "&chatBannerLink=" + this.preferences["chatBannerLink"];
	if(typeof live800_configContent != "undefined" && live800_configContent != null)
		openUrl += "&configID=" + live800_configID;
	return openUrl+getEnterUrl();
}
function VisitServer_getInitiatedChatUrl()
{
	var openUrl = this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + this.preferences["baseWebapp"] + this.preferences["baseChatHtmlDir"] +"/chatbox.jsp?"+getGid()+"&companyID=" + this.preferences["companyID"] +"&chatType=2";
	if(typeof this.preferences["configID"] != "undefined" && this.preferences["configID"] != null && this.preferences["configID"] != "")
	{
		openUrl += "&configID=" + this.preferences["configID"];
	}
	if(this.preferences["skin"] != null)
		openUrl += "&skin=" + this.preferences["skin"];
	if(this.preferences["chatBanner"] != null)
		openUrl += "&chatBanner=" + this.preferences["chatBanner"];
	if(this.preferences["chatBannerLink"] != null)
		openUrl += "&chatBannerLink=" + this.preferences["chatBannerLink"];
	if(typeof live800_configContent != "undefined" && live800_configContent != null)
		openUrl += "&configID=" + live800_configID;
	return openUrl+getEnterUrl()+"&"+getTrustfulVisitorInfo();
};
function VisitServer_getAcceptInviteUrl()
{
	var openUrl = this.preferences["protocol"] + "://" + this.preferences["baseUrl"] + live800_baseWebApp+"/SurferServer?&cmd=102";
	openUrl += "&accept=1";
	openUrl += "&visitorIDInSession=" + this.preferences["visitorIDInSession"];
	openUrl += "&companyID=" + this.preferences["companyID"];
	if(typeof this.preferences["configID"] != "undefined" && this.preferences["configID"] != null && this.preferences["configID"] !="")
		openUrl += "&configID=" + live800_configID;
	if(typeof live800_configContent != "undefined" && live800_configContent != null)
		openUrl += "&configID=" + live800_configID;
	return openUrl+"&"+getGid()+getParam()+getTrustfulVisitorInfo();
};
function VisitServer_start()
{
	//this.visitServerTimer = setTimeout('globalVisitServer.getConfigInServer()',100);
};
function VisitServer_stop()
{
	clearTimeout(this.visitServerTimer);
};
function VisitServer_refuseInvite()
{
	var params = new Array();
	params[0] = "companyID=" + this.preferences["companyID"];
	params[1] = "accept=0";
	var rpcMethod = new RpcMethod("SurferServer", "102", params, 0, null, null);
	this.sendDriver.execute(rpcMethod);
};
function VisitServer_acceptInvite()
{
	var params = new Array();
	params[0] = "companyID=" + this.preferences["companyID"];
	params[1] = "accept=1";
	var rpcMethod = new RpcMethod("SurferServer", "102", params, 0, null, null);
	this.sendDriver.execute(rpcMethod);
};
function VisitServer_initiatedChat()
{
	var params = new Array();
	params[0] = "companyID=" + this.preferences["companyID"];
	var rpcMethod = new RpcMethod("SurferServer", "109", params, 0, null, null);
	this.sendDriver.execute(rpcMethod);
}
function VisitServer_call()
{

};

function VisitHandle(inLogger, inPreferences, inVisitClient, inWindow, inInviteWindow, inIcon)
{
	this.logger = inLogger;
	this.preferences = inPreferences;
	this.visitClient = inVisitClient;

	this.visitWindow = inWindow;
	this.visitDocument = inWindow.document;
	this.inviteWindow = inInviteWindow;
	this.icon = inIcon;
	this.inviteWindow.parentObject = this;
	if(this.icon != null)
		this.icon.parentObject = this;
	this.chatWindow = null;

	this.showInvite = VisitHandle_showInvite;
	this.hideInvite = VisitHandle_hideInvite;
	this.openInitiatedChat = VisitHandle_openInitiatedChat;
	this.reloadIcon = VisitHandle_reloadIcon;

	this.onInviteWindowAccept = VisitHandle_onInviteWindowAccept;
	this.onInviteWindowRefuse = VisitHandle_onInviteWindowRefuse;
	this.onIconClick = VisitHandle_onIconClick;

   	this.initListener = VisitHandle_initListener;
	this.initListener();

}
function VisitHandle_onIconClick()
{
	var openUrl = this.visitClient.getCallUrl();
	var winAttr = 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=541,height=401';
		if (typeof(this.chatWindow) == "undefined"||this.chatWindow==null)
		{
			this.chatWindow = window.open(openUrl, 'chatbox'+ this.preferences["companyID"], winAttr);
		}
		try
		{
			this.chatWindow.focus();
			this.chatWindow.opener=window;
		}
		catch(e)
		{
			this.chatWindow = window.open(openUrl, 'chatbox'+ this.preferences["companyID"], winAttr);
		}
    return false;

}
function VisitHandle_onInviteWindowAccept()
{
	var openUrl = this.visitClient.getAcceptInviteUrl();
	var winAttr = 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=541,height=401';
	this.chatWindow = window.open(openUrl, 'chatbox'+ this.preferences["companyID"], winAttr);
	try
	{
		this.chatWindow.focus();
		this.chatWindow.opener=window;
	}
	catch(e)
	{
		this.chatWindow = window.open(openUrl, 'chatbox'+ this.preferences["companyID"], winAttr);
	}
    return false;
};
function VisitHandle_onInviteWindowRefuse()
{
	this.visitClient.refuseInvite();
};
function VisitHandle_showInvite()
{
	this.inviteWindow.operatorInvite=false;
	this.visitWindow.focus();
	this.inviteWindow.show();
	this.inviteWindow.isauto = false;
	this.inviteWindow.operatorInvite=true;
};
function VisitHandle_hideInvite()
{
	this.inviteWindow.hide();
};
function VisitHandle_openInitiatedChat()
{
	//this.visitClient.initiatedChat();
	var openUrl = this.visitClient.getInitiatedChatUrl();
	var winAttr = 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=541,height=401';
	
	try
	{
		this.chatWindow = window.open(openUrl, 'chatbox'+ this.preferences["companyID"], winAttr);
		this.chatWindow.focus();
		this.chatWindow.opener=window;
	}
	catch(e)
	{
		/*for must initiated chat*/
		openUrl += '&blocked=1';
		window.location = openUrl;
	}
    return false;
};
function VisitHandle_reloadIcon()
{
	var live800iconList = document.getElementsByName("live800icon");
	if(live800iconList == null) return;
	for(i=0; i<live800iconList.length; i++)
	{
		temp = live800iconList[i].src ;
		temp += "&rpcImageId=" + (new Date()).getTime();
		live800iconList[i].src = temp;
	}
};
function VisitHandle_initListener()
{
	this.visitClient.addMessageListener(this);
};
if(live800_companyID == null || live800_companyID == ""){alert("miss companyID");}
else
{
	preferences = new Array();
	preferences["companyID"] = live800_companyID;
	preferences["float"] = (typeof live800_float != "undefined" ? live800_float : "1");
	preferences["iconIndex"] = (typeof live800_iconIndex !="undefined" ? live800_iconIndex : "0");
	preferences["online"] =  (typeof live800_online !="undefined" ? live800_online : null);
	preferences["offline"] =  (typeof live800_offline !="undefined" ? live800_offline : null);
	preferences["floatToRight"] = (typeof live800_floatToRight !="undefined" ? live800_floatToRight : "1");
	preferences["skin"] = (typeof live800_skin !="undefined" ? live800_skin : "0");
	preferences["chatBanner"] = (typeof live800_chatBanner !="undefined" ? live800_chatBanner : null);
	preferences["chatBannerLink"] = (typeof live800_chatBannerLink !="undefined" ? live800_chatBannerLink : null);
	preferences["status"] = (typeof live800_status !="undefined" ? live800_status : null);
	if(typeof live800_configContent != "undefined")
	{
	params = Sys.urlToParams(live800_configContent);
	preferences["configID"] = live800_configID;
	preferences["invite_auto"] = (typeof params["live800_invite_auto"] !="undefined" ? params["live800_invite_auto"] : 1);
	preferences["invite_delay"] = (typeof params["live800_invite_delay"] !="undefined" ? params["live800_invite_delay"] : 10);
	preferences["invite_title"] = (typeof params["live800_invite_title"] !="undefined" ? params["live800_invite_title"] : unescape("Live800%u7F51%u7AD9%u5728%u7EBF%u5BA2%u670D%u7CFB%u7EDF"));
	preferences["invite_style"] = (typeof params["live800_invite_style"] !="undefined" ? params["live800_invite_style"] : null);
	preferences["invite_top"] = (typeof params["live800_invite_top"] !="undefined" ? params["live800_invite_top"] : 0);
	}
	else
	{
		preferences["configID"] = 1;
		preferences["invite_auto"] = 1;
		preferences["invite_delay"] = 10;
		preferences["invite_style"]=null;
		preferences["invite_top"]=0;
		preferences["invite_title"] = unescape("Live800%u7F51%u7AD9%u5728%u7EBF%u5BA2%u670D%u7CFB%u7EDF");
	}

	preferences["protocol"] = "http";
	preferences["baseUrl"] = live800_baseUrl;
	preferences["baseHtmlUrl"] =live800_baseHtmlUrl;
	preferences["baseWebapp"] = live800_baseWebApp;
	preferences["baseChatHtmlDir"] = live800_baseChatHtmlDir;
	preferences["visitorIDInSession"] = preferences["companyID"] + "chater";

	var globalLogger = new Logger();
	var globalSendDriver = new SendDriver(globalLogger, preferences);
	var globalReceiveDriver = new ReceiveDriver(globalLogger, preferences);
	var globalVisitClient = new VisitClient(globalLogger, preferences, globalReceiveDriver, globalSendDriver);
	var globalVisitServer = globalVisitClient.visitServer;

	var globalIcon = null;
	if(typeof live800_configContent == "undefined")
	{

		if(preferences["float"]=="1")
		{
			globalIcon = globalFloatIcon = new FloatIcon(globalLogger, preferences, globalVisitClient, window);
		}
		else
		{
			globalIcon = globalStaticIcon = new StaticIcon(globalLogger, preferences, globalVisitClient, window);
		}
		globalIcon.start();
	}
	/*var live800_configContent to detect is a a version 3 live800 js*/

	var globalInviteWindow = new InviteWindow(globalLogger, preferences, globalVisitClient, window);
	var globalVisitHandle = new VisitHandle(globalLogger, preferences, globalVisitClient, window, globalInviteWindow, globalIcon);
	globalVisitClient.start();
}
