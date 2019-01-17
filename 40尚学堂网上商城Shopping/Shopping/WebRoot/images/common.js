/******************************************************************************
  Crossday Discuz! Board - Common Modules for Discuz!
  Copyright 2001-2005 Comsenz Technology Ltd (http://www.comsenz.com)
*******************************************************************************/

var sPop = null;
var postSubmited = false;

document.write("<style type='text/css'id='defaultPopStyle'>");
document.write(".cPopText { font-family: Tahoma, Verdana; background-color: #FFFFCC; border: 1px #000000 solid; font-size: 12px; padding-right: 4px; padding-left: 4px; height: 20px; padding-top: 2px; padding-bottom: 2px; visibility: hidden; filter: Alpha(Opacity=80)}");

document.write("</style>");
document.write("<div id='popLayer' style='position:absolute;z-index:1000' class='cPopText'></div>");

function showpopuptext() {
	var o=event.srcElement;
	MouseX=event.x;
	MouseY=event.y;
	if(o.alt!=null && o.alt!="") { o.pop=o.alt;o.alt="" }
	if(o.title!=null && o.title!="") { o.pop=o.title;o.title="" }
	if(o.pop!=sPop) {
		sPop=o.pop;
		if(sPop==null || sPop=="") {
			popLayer.style.visibility="hidden";	
		} else {
			if(o.dyclass!=null) popStyle=o.dyclass 
			else popStyle="cPopText";
			popLayer.style.visibility="visible";
			showit();
		}
	}
}

function showit() {
	popLayer.className=popStyle;
	popLayer.innerHTML=sPop.replace(/<(.*)>/g,"&lt;$1&gt;").replace(/\n/g,"<br>");;
	popWidth=popLayer.clientWidth;
	popHeight=popLayer.clientHeight;
	if(MouseX+12+popWidth>document.body.clientWidth) popLeftAdjust=-popWidth-24
		else popLeftAdjust=0;
	if(MouseY+12+popHeight>document.body.clientHeight) popTopAdjust=-popHeight-24
		else popTopAdjust=0;
	popLayer.style.left=MouseX+12+document.body.scrollLeft+popLeftAdjust;
	popLayer.style.top=MouseY+12+document.body.scrollTop+popTopAdjust;
}


function ctlent(obj) {
	if(postSubmited == false && (event.ctrlKey && window.event.keyCode == 13) || (event.altKey && window.event.keyCode == 83)) {
		if(this.document.input.pmsubmit) {
			postSubmited = true;
			this.document.input.pmsubmit.disabled = true;
			this.document.input.submit();
		} else if(validate(this.document.input)) {
			postSubmited = true;
			if(this.document.input.topicsubmit) this.document.input.topicsubmit.disabled = true;
			if(this.document.input.replysubmit) this.document.input.replysubmit.disabled = true;
			if(this.document.input.editsubmit) this.document.input.editsubmit.disabled = true;
			this.document.input.submit();
		}
	}
}

function checkall(form, prefix, checkall) {
	var checkall = checkall ? checkall : 'chkall';
	for(var i = 0; i < form.elements.length; i++) {
		var e = form.elements[i];
		if(e.name != checkall && (!prefix || (prefix && e.name.match(prefix)))) {
			e.checked = form.elements(checkall).checked;;
		}
	}
}

function findobj(n, d) {
	var p, i, x;
	if(!d) d = document;
	if((p = n.indexOf("?"))>0 && parent.frames.length) {
		d = parent.frames[n.substring(p + 1)].document;
		n = n.substring(0, p);
	}
	if(x != d[n] && d.all) x = d.all[n];
	for(i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
	for(i = 0; !x && d.layers && i < d.layers.length; i++) x = findobj(n, d.layers[i].document);
	if(!x && document.getElementById) x = document.getElementById(n);
	return x;
}


function copycode(obj) {
	var rng = document.body.createTextRange();
	rng.moveToElementText(obj);
	rng.scrollIntoView();
	rng.select();
	rng.execCommand("Copy");
	rng.collapse(false);
}

function toggle_collapse(objname) {
	obj = findobj(objname);
	img = findobj(objname+"_img");
	collapsed = getcookie("discuz_collapse");
	cookie_start = collapsed ? collapsed.indexOf(objname) : -1;
	cookie_end = cookie_start + objname.length + 1;

	if(obj.style.display == "none") {
		obj.style.display = "";
		img_re = new RegExp("_yes\\.gif$");
		img.src = img.src.replace(img_re, '_no.gif');
		if(cookie_start != -1) collapsed = collapsed.substring(0, cookie_start) + collapsed.substring(cookie_end, collapsed.length);
	} else {
		obj.style.display = "none";
		img_re = new RegExp("_no\\.gif$");
		img.src = img.src.replace(img_re, '_yes.gif');
		if(cookie_start == -1) collapsed = collapsed + objname + " ";
	}

	expires = new Date();
	expires.setTime(expires.getTime() + (collapsed ? 86400 * 30 : -(86400 * 30 * 1000)));
	document.cookie = "discuz_collapse=" + escape(collapsed) + "; expires=" + expires.toGMTString() + "; path=/";
}

function imgzoom(o){
	if(event.ctrlKey) {
		var zoom = parseInt(o.style.zoom, 10) || 100;
		zoom -= event.wheelDelta / 12;
		if(zoom > 0) {
			o.style.zoom = zoom + '%';
		}
		return false;
	} else {
		return true;
	}
}

function getcookie(name) {
	var cookie_start = document.cookie.indexOf(name);
	var cookie_end = document.cookie.indexOf(";", cookie_start);
	return cookie_start == -1 ? '' : unescape(document.cookie.substring(cookie_start + name.length + 1, (cookie_end > cookie_start ? cookie_end : document.cookie.length)));
}

document.onmouseover=showpopuptext;
