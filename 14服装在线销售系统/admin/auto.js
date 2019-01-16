// JavaScript Document
<!--
function resize(){
    var sh = document.body.scrollHeight;
    parent.document.getElementById('mainifr').style.height = (sh > 350 ? sh+20 : "370") +"px";
	document.body.style.overflow="hidden";
}
window.onload=resize;
window.onresize = resize;
-->