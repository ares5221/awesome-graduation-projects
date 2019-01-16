// JavaScript Document
var Xpos = 0;
var Ypos = 0;
var Ygravity = 0.9;
var scrollPos = 0;
var oldScrollPos = 0;


function FloatMenu() { 
docWidth =1024; // update document width
docHeight = document.body.clientHeight; // update document height
oldScrollPos = scrollPos;
scrollPos = document.body.scrollTop; // update scrollbar position
//if(scrollPos > 600) scrollPos = 580;

Xpos = docWidth; 
Yboundary = scrollPos + 120;

if (floater2.offsetTop < Yboundary - 10) // Object is behind boundary
Ypos += 3;

if (floater2.offsetTop > Yboundary + 10) // Object is past boundary
Ypos -= 3;

Ypos *= Ygravity; // Slow object down
floater2.style.pixelLeft = Xpos - 130;
floater2.style.pixelTop += Ypos; // Make object bounce
}
window.setInterval("FloatMenu()", 30);  
 

