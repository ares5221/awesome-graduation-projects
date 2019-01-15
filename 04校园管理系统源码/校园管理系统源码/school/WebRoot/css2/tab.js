function	IsShow()
{
	parent.document.all.layMnAboutPingSoft.style.visibility = 'visible';
}
function	IsHide()
{
	parent.document.all.layMnAboutPingSoft.style.visibility = 'hidden'; 
}

function	ReLocation(url)
{
	parent.document.location.href=url
 	//parent.document.all.CurrentLocation.innerText = CurrentLocationCaption; 
	//parent.document.location.href=url
}

function mOvr(src,clrOver) { if (!src.contains(event.fromElement)) {  src.bgColor = '#ED1B23'; src.style.color = '#555555'}}
function mOut(src,clrIn,font) { if (!src.contains(event.toElement)) {  src.bgColor = '#CCCCCC';  src.style.color = '#555555'}}
function mClk(src) { if(event.srcElement.tagName=='TD'){src.children.tags('A')[0].click();} }

function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}