<!--
//dropdown_initialize.js
  var preloaded = [];
  for (var i = 1; i <= 8; i++) {
   preloaded[i] = [loadImage(i + "-1.gif"), loadImage(i + "-1.gif")];  //设置图片的OnMouseOver和OnMouseOut的路径
  }
  function init() {
   if (mtDropDown.isSupported()) {
    mtDropDown.initialize();
//    menu1.onactivate = function() { swapImage("button1", preloaded[1][1].src) };
//    menu1.ondeactivate = function() { swapImage("button1", preloaded[1][0].src) };
//    menu2.onactivate = function() { swapImage("button2", preloaded[2][1].src) };
//    menu2.ondeactivate = function() { swapImage("button2", preloaded[2][0].src) };
//    menu3.onactivate = function() { swapImage("button3", preloaded[3][1].src) };
//    menu3.ondeactivate = function() { swapImage("button3", preloaded[3][0].src) };
//    menu4.onactivate = function() { swapImage("button4", preloaded[4][1].src) };
//    menu4.ondeactivate = function() { swapImage("button4", preloaded[4][0].src) };
//    menu5.onactivate = function() { swapImage("button5", preloaded[5][1].src) };
//    menu5.ondeactivate = function() { swapImage("button5", preloaded[5][0].src) };
//    menu6.onactivate = function() { swapImage("button6", preloaded[6][1].src) };
//    menu6.ondeactivate = function() { swapImage("button6", preloaded[6][0].src) };
//    menu7.onactivate = function() { swapImage("button7", preloaded[7][1].src) };
//    menu7.ondeactivate = function() { swapImage("button7", preloaded[7][0].src) };
    
//    menu8.onactivate = function() { swapImage("button8", preloaded[8][1].src) };
//    menu8.ondeactivate = function() { swapImage("button8", preloaded[8][0].src) };
   }
  }
  function loadImage(sFilename) {
   var img = new Image();
   img.src ="" + sFilename;
   return img;
  }
  function swapImage(imgName, sFilename) {
   document.images[imgName].src = sFilename;
  }
//-->