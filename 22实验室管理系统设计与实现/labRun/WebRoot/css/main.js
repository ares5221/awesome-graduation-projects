 
	function CheckData(){}
	CheckData.checkNull=function(dataNameList){
		for(var i=0;i<dataNameList.length;i++){
			checkItem=document.getElementById(dataNameList[i]);
			if(!checkItem){
				alert("方法调用出错，请联系管理员!");
				return false;			
			}
			if(checkItem.value==null||checkItem.value==""||checkItem.value=="undefined"||checkItem.value=="null"){
				window.alert("这里不能为空!");
				checkItem.focus();
				return false;
			}
		}
		return true;
	}
	
	


	CheckData.checkNumber=function(dataNameList){
		var result=true;
		for(var i=0;i<dataNameList.length;i++){
			checkItem=document.getElementById(dataNameList[i]);
			if(checkItem.value!=""&&isNaN(checkItem.value)){
				window.alert("这里必须为数字!");
				checkItem.focus();
				result=false;
			}
		}
		return result;
	}
	
	CheckData.checkDotNumber=function(dataNameList){
		var result=true;
		var checkRegular=/^[0-9]+[\.][0-9]+$/;
		for(var i=0;i<dataNamelist.length;i++){
			checkItem=document.getElementById(dataNameList[i]);
			if(!checkRegular.test(checkItem.value))
				result=false;
		}
		return result;	
	}
	
	CheckData.checkChineseWord=function(){
		key1=window.event.keyCode;
		if(key1>48 || key1<57){
			alert('这里只能请输入汉字！');
			window.event.keyCode=0;
		}
	}
	
	CheckData.checkLength=function(itemName,minSize,maxSize){
		checkItem=document.getElementById(itemName);
		if(checkItem.value.length<minSize){
			alert("这里的输入最少不能少于"+minSize+"个字符!");
			checkItem.focus();
			return false;
		}	
		if(checkItem.value.length>maxSize){
			alert("这里的输入最多不能多于"+maxSize+"个字符!");
			checkItem.focus();
			return false;
		}
		return true;	
	}
	
	function WindowHelper(){};
	
	WindowHelper.openWindow=function(url,windowName,windowFeatures,replaced){
		if(!replaced)
			replaced=true;	
		window.open(url,windowName,windowFeatures,replaced);	
	}
	
	WindowHelper.openModal=function(url){
		window.showModalDialog(url,null);
	}
	
	WindowHelper.showPage=function(url,windowName,params,pathParams){
		if(pathParams&&pathParams!=null&&pathParams.length!=0){
			pathDiv=window.top.frames["title"].document.getElementById("curPath");
			var pathStr="";
			for(var a=0;a<pathParams.length;a++){
				if(a==0)
					pathStr="&nbsp;&nbsp;"+pathParams[a];
				else
					pathStr=pathStr+"  >>  "+pathParams[a];
			}
			pathDiv.innerHTML=pathStr;	
		}
		var realUrl=WindowHelper.createUrl(url,params);
		window.top.frames[windowName].location.href=realUrl;
	}
	
	WindowHelper.createUrl=function(url,params){
		if(!params||params==null||params.length==0)
			return url;
		var paramStr="";
		for(var i=0;i<params.length;i++){
			paramStr=paramStr+params[i]+"&";
		}	
		return url+"?"+paramStr.substring(0,paramStr.length-1);
	}
	
	
	
	function CheckBoxHelper(){}
	
	CheckBoxHelper.isSelected=function(boxName){
		var boxItems=document.getElementsByName(boxName);
		if(!boxItems){
			alert("方法调用出错：checkbox["+boxName+"]不存在！");
			return;
		}	
		var boxLength=boxItems.length;
		for(var i=0;i<boxLength;i++){
			if(boxItems[i].checked==true)
				return true;
		}
		return false;
	}
	
	CheckBoxHelper.getSelected=function(boxName){
		var boxItems=document.getElementsByName(boxName);
		if(!boxItems){
			alert("方法调用出错：checkbox["+boxName+"]不存在！");
			return;
		}	
		var boxLength=boxItems.length;
		var selectedValues=[];
		for(var i=0;i<boxLength;i++){
			if(boxItems[i].checked==true)
				selectedValues[selectedValues.length]=boxItems[i].value;
		}
		return selectedValues;
	}
	
	
	function DivDisplayHelper(){}
	DivDisplayHelper.changeDisplay=function(divList,displayDiv){
		for(var i=0;i<divList.length;i++){
			if(divList[i]==displayDiv)
				document.getElementById(displayDiv).style.display="";
			else
				document.getElementById(divList[i]).style.display="none";
		}
	}
	
	

